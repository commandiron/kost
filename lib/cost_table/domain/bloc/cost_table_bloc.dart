import 'dart:async';
import 'dart:convert';
import 'package:universal_html/js.dart' as js;

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/common/bloc/bloc_state.dart';
import 'package:kost/common/model/unit_price_category.dart';
import 'package:kost/data/unit_price_repository.dart';
import 'package:kost/common/extension/formatted_number.dart';
import 'package:kost/cost_table/domain/model/cost.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../../../common/model/job.dart';
import '../model/currency_rates.dart';
import '../../../common/model/unit_price.dart';
import 'cost_table_event.dart';
import 'cost_table_state.dart';

class CostTableBloc extends Bloc<CostTableEvent, CostTableState> {
  CostTableBloc()
    : super(
      CostTableState(
        blocState: Initial(),
        tableName: "Apartman Maliyeti",
        jobs: const [],
        unitPrices: const [],
        currencyRates: ManualCurrencyRates(),
        costs: const [],
        categoryVisibilities: const {},
        formattedSubTotalsTRY: const {},
        formattedGrandTotalTRY: ""
      ),
    ) {
    on<InitCostTableBloc>((event, emit) async {
      emit(state.copyWith(blocState: Loading()));

      await Future.delayed(const Duration(seconds: 1)); //Fake delay

      if (event.jobs == null) {
        emit(state.copyWith(
            blocState: Error(message: "Gerekli bilgiler verilmedi.")));
        return;
      }

      final unitPrices = _fetchUnitPrices();
      //Fetch currency rates
      emit(state.copyWith(
        tableName: event.tableName,
        jobs: event.jobs,
        unitPrices: unitPrices,
      ));

      _refreshCostTable(emit);
    });
    on<ExpandCollapseMainCategory>((event, emit) {
      final categoryVisibilities = state.categoryVisibilities;
      categoryVisibilities[event.mainCategory] =
          !(categoryVisibilities[event.mainCategory] ?? false);
      emit(state.copyWith(categoryVisibilities: Map.of(categoryVisibilities)));
    });
    on<ExpandCollapseAllMainCategory>((event, emit) {
      final categoryVisibilities = state.categoryVisibilities;
      if (categoryVisibilities.values.any((visible) => visible)) {
        categoryVisibilities.updateAll((key, value) => value = false);
      } else {
        categoryVisibilities.updateAll((key, value) => value = true);
      }
      emit(state.copyWith(categoryVisibilities: Map.of(categoryVisibilities)));
    });
    on<ExportAsPdf>((event, emit) async {

      final font = await rootBundle.load("fonts/roboto/Roboto-Medium.ttf");
      final fontData = font.buffer.asUint8List(font.offsetInBytes,font.lengthInBytes);

      final headerStyle = PdfGridRowStyle(
        backgroundBrush: PdfBrushes.ghostWhite,
        textBrush: PdfBrushes.black,
        font: PdfTrueTypeFont(fontData, 8)
      );

      final gridStyle = PdfGridStyle(
        cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
        backgroundBrush: PdfBrushes.white,
        textBrush: PdfBrushes.black,
        font: PdfTrueTypeFont(fontData, 6)
      );

      PdfGrid grid = PdfGrid();
      grid.style = gridStyle;
      grid.columns.add(count: 5);

      final header = grid.rows.add();
      header.style = headerStyle;
      header.cells[0].value = "İşlerin Tanımı";
      header.cells[1].value = "Malzeme / Marka / Model / İşlem";
      header.cells[2].value = "Birim Fiyat";
      header.cells[3].value = "Miktar";
      header.cells[4].value = "Toplam Fiyat";

      MainCategory lastMainCategory = MainCategory.excavationJobs;
      final categoryRow = grid.rows.add();
      categoryRow.style = headerStyle;
      categoryRow.cells[0].value = lastMainCategory.nameTr;

      for (var cost in state.costs) {

        if(lastMainCategory != cost.mainCategory) {
          final categoryRow = grid.rows.add();
          categoryRow.style = headerStyle;
          categoryRow.cells[0].value = cost.mainCategory.nameTr;
        }

        final costRow = grid.rows.add();
        costRow.cells[0].value = cost.jobName;
        costRow.cells[1].value = cost.unitPriceNameText;
        costRow.cells[2].value = cost.unitPriceAmountText;
        costRow.cells[3].value = "${cost.quantityText} ${cost.quantityUnitText}";
        costRow.cells[4].value = cost.formattedTotalPriceTRY;

        lastMainCategory = cost.mainCategory;
      }

      //Create Pdf
      final PdfDocument document = PdfDocument();
      final PdfPage page = document.pages.add();
      grid.draw(page: page, bounds: const Rect.fromLTWH(0, 0, 0, 0));
      List<int> bytes = document.saveSync();
      downloadPdf(state.tableName, bytes);
      document.dispose();
    });
    on<ReplaceUnitPrice>((event, emit) {
      state.jobs
          .firstWhere((element) => element.id == event.jobId)
          .replacedUnitPriceId = event.replacedUnitPriceId;
      _refreshCostTable(emit);
    });
    on<DeleteJob>((event, emit) async {
      state.jobs.removeWhere((job) => job.id == event.jobId);
      _refreshCostTable(emit);
    });
    on<ChangeQuantityManually>((event, emit) {
      final quantity = event.quantityText.toNumber();
      state.jobs.firstWhere((e) => e.id == event.jobId).quantityBuilder = (){return quantity;};
      _refreshCostTable(emit);
    });
  }

  final UnitPriceRepository _unitPriceRepository = UnitPriceRepository();

  List<UnitPrice> _fetchUnitPrices() {
    return _unitPriceRepository.getAllUnitPrices();
  }

  void _refreshCostTable(Emitter<CostTableState> emit) {
    final costs = _createCosts(state.jobs);
    emit(state.copyWith(
      blocState: Completed(data: null),
      costs: costs,
      categoryVisibilities: _createCategoryVisibilities(costs),
      formattedSubTotalsTRY: _createFormattedSubTotalsTRY(costs),
      formattedGrandTotalTRY: _createFormattedGrandTotalTRY(costs),
    ));
  }

  List<Cost> _createCosts(List<Job> jobs) {
    final List<Cost> costs = [];
    for (var job in jobs) {
      final cost = _createCost(
          job: job,
          unitPrices: state.unitPrices,
          currencyRates: state.currencyRates);
      if (cost != null) {
        costs.add(cost);
      }
    }
    return costs;
  }

  Cost? _createCost(
      {required Job job,
      required List<UnitPrice> unitPrices,
      required CurrencyRates currencyRates}) {
    if (job.disable) {
      return null;
    }

    final enabledUnitPrices = unitPrices
        .where((unitPrice) =>
            job.enabledUnitPriceCategories.contains(unitPrice.category))
        .toList();

    final UnitPrice? unitPrice;
    if (job.replacedUnitPriceId != null) {
      final replacedUnitPrice = unitPrices
          .firstWhere((unitPrice) => unitPrice.id == job.replacedUnitPriceId);
      unitPrice = replacedUnitPrice;
    } else {
      final unitPricesInCategory = unitPrices.where(
        (unitPrice) => unitPrice.category == job.selectedUnitPriceCategory);
      final lastDatedUnitPrice = unitPricesInCategory.reduce((current, next) =>
        current.dateTime.isAfter(next.dateTime) ? current : next);
      unitPrice = lastDatedUnitPrice;
    }

    final formattedFixedAmount =
        unitPrice.fixedAmount.toFormattedText(unit: unitPrice.currency.symbol);
    final formattedAmount = unitPrice.amount.toFormattedText(
        unit: "${unitPrice.currency.symbol}/${unitPrice.category.unit.symbol}");

    final unitAmountText = unitPrice.fixedAmount != 0
        ? "$formattedFixedAmount + $formattedAmount"
        : formattedAmount;

    final fixedPriceTRY = job.quantityBuilder.call() != 0
        ? unitPrice.fixedAmount * currencyRates.getLiraRate(unitPrice.currency)
        : 0;
    final priceTRY = unitPrice.amount *
        job.quantityBuilder.call() *
        currencyRates.getLiraRate(unitPrice.currency);
    final totalPriceTRY = fixedPriceTRY + priceTRY;

    return Cost(
        mainCategory: job.mainCategory,
        jobId: job.id,
        jobName: job.nameTr,
        enabledUnitPrices: enabledUnitPrices,
        unitPriceNameText: unitPrice.category.nameTr,
        unitPriceAmountText: unitAmountText,
        quantityText: job.quantityBuilder.call().toFormattedText(),
        quantityUnitText: unitPrice.category.unit.symbol,
        totalPriceTRY: totalPriceTRY,
        formattedTotalPriceTRY: totalPriceTRY.toFormattedText(unit: "TL"));
  }

  Map<MainCategory, bool> _createCategoryVisibilities(List<Cost> costs) {
    final mainCategorySet = costs.map((cost) => cost.mainCategory).toSet();
    Map<MainCategory, bool> categoryVisibilities = {};
    if (state.categoryVisibilities.isEmpty) {
      for (var mainCategory in mainCategorySet) {
        categoryVisibilities.putIfAbsent(mainCategory, () => false);
      }
    } else {
      categoryVisibilities = state.categoryVisibilities;
    }
    return categoryVisibilities;
  }

  double _calculateSubTotal(List<Cost> costs, MainCategory mainCategory) {
    final categorizedCosts =
        costs.where((cost) => cost.mainCategory == mainCategory).toList();
    return categorizedCosts
        .map((e) => e.totalPriceTRY)
        .toList()
        .fold(0.0, (p, c) => p + c);
  }

  Map<MainCategory, String> _createFormattedSubTotalsTRY(List<Cost> costs) {
    final mainCategorySet = costs.map((cost) => cost.mainCategory).toSet();
    final Map<MainCategory, String> formattedSubTotalsTRY = {};
    for (var mainCategory in mainCategorySet) {
      final subTotal = _calculateSubTotal(costs, mainCategory);
      formattedSubTotalsTRY.putIfAbsent(
          mainCategory, () => subTotal.toFormattedText(unit: "TL"));
    }
    return formattedSubTotalsTRY;
  }

  double _calculateGrandTotal(List<Cost> costs) {
    return costs
        .map((cost) => cost.totalPriceTRY)
        .toList()
        .fold(0, (p, c) => p + c);
  }

  String _createFormattedGrandTotalTRY(List<Cost> costs) {
    final grandTotal = _calculateGrandTotal(costs);
    final formattedGrandTotalTRY = grandTotal.toFormattedText(unit: "TL");
    return formattedGrandTotalTRY;
  }

  void downloadPdf(String name, List<int> bytes) {
    js.context['pdfData'] = base64.encode(bytes);
    js.context['filename'] = '$name.pdf';
    Timer.run(() {
      js.context.callMethod('download');
    });
  }
}
