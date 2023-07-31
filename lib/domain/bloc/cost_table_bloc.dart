import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/data/unit_price_repository.dart';
import 'package:kost/domain/calculator/detailed/detailed_quantity_calculator.dart';
import 'package:kost/domain/calculator/detailed/project_constants.dart';
import 'package:kost/domain/calculator/detailed/room.dart';
import 'package:kost/domain/calculator/detailed/window.dart';
import 'package:kost/domain/calculator/quantity_calculator.dart';
import 'package:kost/domain/helper/formattedNumber.dart';
import 'package:kost/domain/model/unit_price/currency.dart';
import 'package:kost/domain/model/cost/cost_template.dart';
import 'package:kost/domain/model/unit_price/unit.dart';
import 'package:kost/domain/model/cost/cost.dart';
import 'package:kost/presentation/cost_table/cost_table_screen.dart';

import '../calculator/detailed/floor.dart';
import '../model/cost/category.dart';
import '../model/unit_price/unit_price.dart';
import 'cost_table_event.dart';
import 'cost_table_state.dart';

class CostTableBloc extends Bloc<CostTableEvent, CostTableState> {
  CostTableBloc()
    : super(
      CostTableState(
        costTemplate: EmptyCostTemplate(),
        unitPricePool: const [],
        currencyRates: ManualCurrencyRates(),
        quantityCalculator: EmptyQuantityCalculator(projectConstants: ProjectConstants()),
        costs: const [],
        formattedSubTotalsTRY: const {},
        formattedGrandTotalTRY: ""
      ),
    ) {
    on<Init>((event, emit) {
      final costTemplate = _fetchCostTemplate();
      final unitPricePool = _fetchUnitPricePool();
      // final currencyRates = _fetchCurrencyRates();
      final quantityCalculator = _createQuantityCalculator();
      emit(state.copyWith(
          costTemplate: costTemplate,
          unitPricePool: unitPricePool,
          quantityCalculator: quantityCalculator));
      _refresh();
    });
    on<CreateCostTable>((event, emit) {
      if (!_isAllUnitPricesInCostTemplateIncludedInUnitPricePool) {
        throw Exception(
            "All enabled unit prices in the cost template are NOT included in fetched unit prices."); //Handle
      }

      final costs = _createCosts(
          costTemplate: state.costTemplate,
          unitPricePool: state.unitPricePool,
          quantityCalculator: state.quantityCalculator,
          currencyRates: state.currencyRates);

      final mainCategorySet = costs.map((e) => e.category.mainCategory).toSet();
      final Map<MainCategory, String> formattedSubTotalsTRY = {};
      for (var mainCategory in mainCategorySet) {
        final subTotal = _calculateSubTotal(costs, mainCategory);
        formattedSubTotalsTRY.putIfAbsent(mainCategory,
            () => getFormattedNumber(number: subTotal, unit: "TL"));
      }

      final grandTotal = _calculateGrandTotal(costs);
      final formattedGrandTotalTRY =
          getFormattedNumber(number: grandTotal, unit: "TL");

      emit(state.copyWith(
        costs: costs,
        formattedSubTotalsTRY: formattedSubTotalsTRY,
        formattedGrandTotalTRY: formattedGrandTotalTRY,
      ));
    });
    on<ExpandCollapseMainCategory>((event, emit) {
      state.costs.where((cost) => cost.category.mainCategory == event.mainCategory).forEach(
        (cost) {
          cost.visible = !cost.visible;
        }
      );
      emit(state.copyWith(costs: List.of(state.costs)));
    });
    on<ExpandCollapseAllMainCategory>((event, emit) {
      if(state.costs.any((cost) => cost.visible)) {
        for (var cost in state.costs) {
          cost.visible = false;
        }
      } else {
        for (var cost in state.costs) {
          cost.visible = true;
        }
      }
      emit(state.copyWith(costs: List.of(state.costs)));
    });
    on<ReplaceUnitPrice>((event, emit) {
      final replacedIndex = state.costTemplate.enabledCostCategories
          .indexWhere((element) => element == event.oldCostCategory);
      state.costTemplate.enabledCostCategories[replacedIndex] = CostCategory(
          event.oldCostCategory.mainCategory,
          event.oldCostCategory.jobCategory,
          event.newUnitPriceCategory);
      _refresh();
    });
    on<DeleteCostCategory>((event, emit) {
      state.costTemplate.enabledCostCategories.remove(event.costCategory);
      _refresh();
    });
    on<ChangeQuantityManually>((event, emit) {
      final quantity = parseFormattedNumber(value: event.quantityText);
      state.quantityCalculator.setQuantityManually(event.jobCategory, quantity);
      _refresh();
    });
    on<FloorAreaChanged>((event, emit) {
      final floorArea = parseFormattedNumber(value: event.floorAreaText);
      state.quantityCalculator.floors[event.index].area = floorArea;
    });
    on<CalculateCost>((event, emit) {
      _refresh();
      Navigator.of(event.context).pushNamed(CostTableScreen.route);
    });
  }

  final UnitPriceRepository _unitPriceRepository = UnitPriceRepository();

  void init() {
    add(const Init());
  }

  CostTemplate _fetchCostTemplate() {
    return BuildingCostTemplate();
  }

  List<UnitPrice> _fetchUnitPricePool() {
    return _unitPriceRepository.getAllUnitPrices();
  }

  QuantityCalculator _createQuantityCalculator() {
    final quantityCalculator = DetailedQuantityCalculator(
      projectConstants: ProjectConstants(),
      landArea: 806.24,
      landPerimeter: 117.93,
      excavationArea: 576.52,
      excavationPerimeter: 102.46,
      coreCurtainLength: 19.36,
      curtainsExceeding1MeterLength: 15.7,
      basementCurtainLength: 108.12,
      columnsLess1MeterPerimeter: 9,
      elevationTowerArea: 30,
      elevationTowerHeightWithoutSlab: 3,
      floors: [
        ...Floor.duplicateFloors(
            Floor(
              no: 1,
              ceilingArea: 213,
              ceilingPerimeter: 64.3,
              fullHeight: 3.3,
              area: 213,
              perimeter: 64.3,
              heightWithoutSlab: 3,
              thickWallLength: 72.97,
              thinWallLength: 36.28,
              isCeilingHollowSlab: true,
              windows: [
                Window(
                  width: 17,
                  height: 2.5,
                  hasRailing: true,
                  hasWindowsill: true,
                  count: 1
                ),
              ],
              rooms: [
                ElevatorShaft(area: 8.61, perimeter: 12.8),
                Shaft(area: 1.05, perimeter: 5.2,),
                FloorHall(area: 8.1, perimeter: 13.8),
                FireEscapeHall(area: 11.1, perimeter: 20.9),
                Stairs(area: 7.2, perimeter: 10.9),
                Stairs(area: 5.1, perimeter: 10.9),

                ApartmentEntree(area: 0, perimeter: 0),
                SaloonWithKitchen(area: 39.38, perimeter: 35.3,),
                NormalRoom(area: 18.37, perimeter: 18.5),
                NormalRoom(area: 10.76, perimeter: 13.6),
                Bathroom(area: 6.41, perimeter: 11.1),
                Bathroom(area: 3.16, perimeter: 7.5),

                ApartmentEntree(area: 0, perimeter: 0),
                SaloonWithKitchen(area: 35.7, perimeter: 34.2,),
                NormalRoom(area: 15.56, perimeter: 16.2),
                NormalRoom(area: 10.06, perimeter: 13.2),
                Bathroom(area: 5.63, perimeter: 10.10),
                Bathroom(area: 3.16, perimeter: 7.5),
              ],
            ),
            11
        ),
        Floor(
          no: 0,
          ceilingArea: 177.15,
          ceilingPerimeter: 61.3,
          fullHeight: 3.3,
          area: 177.15,
          perimeter: 61.3,
          heightWithoutSlab: 3,
          thickWallLength: 66.29,
          thinWallLength: 21.67,
          isCeilingHollowSlab: true,
          windows: [
            Window(
              width: 14,
              height: 2.5,
              hasRailing: true,
              hasWindowsill: true,
              count: 1
            ),
          ],
          rooms: [
            ElevatorShaft(area: 8.61, perimeter: 12.8),
            Shaft(area: 1.05, perimeter: 5.2,),
            FireEscapeHall(area: 11.1, perimeter: 20.9),
            BuildingHall(area: 15.92, perimeter: 21.1),
            Stairs(area: 7.2, perimeter: 10.9),
            Stairs(area: 5.1, perimeter: 10.9),

            ApartmentEntree(area: 0, perimeter: 0),
            SaloonWithKitchen(area: 33.40, perimeter: 30.65,),
            NormalRoom(area: 12.43, perimeter: 14.2),
            Bathroom(area: 4.26, perimeter: 8.6),
            Bathroom(area: 3.16, perimeter: 7.5),

            ApartmentEntree(area: 0, perimeter: 0),
            SaloonWithKitchen(area: 33.40, perimeter: 30.65,),
            NormalRoom(area: 12.43, perimeter: 14.2),
            Bathroom(area: 4.26, perimeter: 8.6),
            Bathroom(area: 3.16, perimeter: 7.5),
          ],
        ),
        Floor(
          no: -1,
          ceilingArea: 477,
          ceilingPerimeter: 94.42,
          fullHeight: 3.15,
          area: 477,
          perimeter: 94.42,
          heightWithoutSlab: 3,
          thickWallLength: 39.13,
          thinWallLength: 0,
          isCeilingHollowSlab: false,
          windows: [],
          rooms: [
            ElevatorShaft(area: 8.61, perimeter: 12.8),
            Shaft(area: 1.05, perimeter: 5.2,),
            Stairs(area: 7.2, perimeter: 10.9),
            Stairs(area: 5.1, perimeter: 10.9),

            FloorHall(area: 6.07, perimeter: 11.1, doors: [Door(count: 1, doorType: DoorType.fire)]),
            FireEscapeHall(area: 17.62, perimeter: 20.9, doors: [Door(count: 1, doorType: DoorType.fire)]),
            ParkingArea(area: 296.25, perimeter: 94.82),
            TechnicalArea(area: 7.10, perimeter: 10.7),
            TechnicalArea(area: 7.25, perimeter: 10.8),
            TechnicalArea(area: 17, perimeter: 16.6),
            TechnicalArea(area: 52.6, perimeter: 33.6),
          ],
        ),
      ],
      foundationArea: 477,
      foundationPerimeter: 94.42,
      foundationHeight: 1,
    );
    return quantityCalculator;
  }

  bool get _isAllUnitPricesInCostTemplateIncludedInUnitPricePool {
    for (var enabledCostCategory in state.costTemplate.enabledCostCategories) {
      if (!state.unitPricePool
          .map((e) => e.category)
          .toList()
          .contains(enabledCostCategory.unitPriceCategory)) {
        return false;
      }
    }
    return true;
  }

  List<Cost> _createCosts({
    required CostTemplate costTemplate,
    required List<UnitPrice> unitPricePool,
    required QuantityCalculator quantityCalculator,
    required CurrencyRates currencyRates,
  }) {
    List<Cost> costs = [];

    for (var enabledCostCategory in costTemplate.enabledCostCategories) {
      final unitPrices = unitPricePool
          .where((unitPrice) =>
              unitPrice.category == enabledCostCategory.unitPriceCategory)
          .toList();
      final lastDatedUnitPrice = unitPrices.reduce((current, next) =>
          current.dateTime.isAfter(next.dateTime) ? current : next);

      final unitPriceNameText = lastDatedUnitPrice.nameTr;

      final formattedFixedAmount = getFormattedNumber(
          number: lastDatedUnitPrice.fixedAmount,
          unit: lastDatedUnitPrice.currency.symbol);
      final formattedAmount = getFormattedNumber(
          number: lastDatedUnitPrice.amount,
          unit: "${lastDatedUnitPrice.currency.symbol}/${lastDatedUnitPrice.unit.symbol}");

      final unitAmountText = lastDatedUnitPrice.fixedAmount != 0
          ? "$formattedFixedAmount + $formattedAmount"
          : formattedAmount;

      final quantity =
          quantityCalculator.calculateQuantity(enabledCostCategory.jobCategory);
      final quantityText = getFormattedNumber(number: quantity);

      final quantityUnitText = lastDatedUnitPrice.unit.symbol;

      final quantityExplanationText = quantityCalculator
          .getQuantityExplanation(enabledCostCategory.jobCategory);

      final totalPriceTRY = (lastDatedUnitPrice.fixedAmount *
              lastDatedUnitPrice.currency.toLiraRate(currencyRates)) +
          (lastDatedUnitPrice.amount *
              quantity *
              lastDatedUnitPrice.currency.toLiraRate(currencyRates));
      final formattedTotalPriceTRY =
          getFormattedNumber(number: totalPriceTRY, unit: "TL");

      final cost = Cost(
        category: enabledCostCategory,
        unitPriceNameText: unitPriceNameText,
        unitPriceAmountText: unitAmountText,
        quantityText: quantityText,
        quantityUnitText: quantityUnitText,
        quantityExplanationText: quantityExplanationText,
        formattedTotalPriceTRY: formattedTotalPriceTRY,
        totalPriceTRY: totalPriceTRY,
        visible: state.costs.isNotEmpty
          ? state.costs.firstWhereOrNull((cost) => cost.category == enabledCostCategory)?.visible ?? true
          : true
      );

      costs.add(cost);
    }
    return costs;
  }

  double _calculateGrandTotal(List<Cost> costs) {
    return costs
        .map((cost) => cost.totalPriceTRY)
        .toList()
        .fold(0, (p, c) => p + c);
  }

  double _calculateSubTotal(List<Cost> costs, MainCategory mainCategory) {
    final categorizedCosts = costs
        .where((cost) => cost.category.mainCategory == mainCategory)
        .toList();
    return categorizedCosts
        .map((e) => e.totalPriceTRY)
        .toList()
        .fold(0.0, (p, c) => p + c);
  }

  void _refresh() {
    add(const CreateCostTable());
  }
}