import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/data/unit_price_repository.dart';
import 'package:kost/domain/calculator/detailed/detailed_quantity_calculator.dart';
import 'package:kost/domain/calculator/detailed/project_constants.dart';
import 'package:kost/domain/calculator/detailed/room.dart';
import 'package:kost/domain/calculator/detailed/window.dart';
import 'package:kost/domain/calculator/quantity_calculator.dart';
import 'package:kost/domain/helper/formattedNumber.dart';
import 'package:kost/domain/model/category/category.dart';
import 'package:kost/domain/model/cost/cost_category.dart';
import 'package:kost/domain/model/unit_price/currency.dart';
import 'package:kost/domain/model/cost/cost_template.dart';
import 'package:kost/domain/model/unit_price/unit.dart';
import 'package:kost/domain/model/cost/cost.dart';

import '../calculator/detailed/floor.dart';
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
              quantityCalculator:
                  EmptyQuantityCalculator(projectConstants: ProjectConstants()),
              costs: const [],
              formattedSubTotalsTRY: const {},
              formattedGrandTotalTRY: ""),
        ) {
    on<Init>((event, emit) {
      add(const FetchCostTemplate());
      add(const FetchUnitPricePool());
      add(const FetchCurrencyRates());
      add(const CreateQuantityCalculator());
      _refresh();
    });
    on<FetchCostTemplate>((event, emit) {
      emit(state.copyWith(costTemplate: BuildingCostTemplate()));
    });
    on<FetchUnitPricePool>((event, emit) {
      final unitPricePool = _unitPriceRepository.getAllUnitPrices();
      emit(state.copyWith(unitPricePool: unitPricePool));
    });
    on<FetchCurrencyRates>((event, emit) {
      //Fetch currency rates.
    });
    on<CreateQuantityCalculator>((event, emit) {
      final quantityCalculator = DetailedQuantityCalculator(
        projectConstants: ProjectConstants(),
        landArea: 806.24,
        landPerimeter: 117.23,
        excavationArea: 581.47,
        excavationPerimeter: 103.07,
        coreCurtainLength: 30,
        curtainsExceeding1MeterLength: 10,
        columnsLess1MeterPerimeter: 20,
        elevationTowerArea: 30,
        elevationTowerHeightWithoutSlab: 3,
        floors: [
          ...Floor.duplicateFloors(
              Floor(
                no: 1,
                ceilingArea: 190,
                ceilingPerimeter: 62.8,
                fullHeight: 3.3,
                area: 188.75,
                perimeter: 62.8,
                heightWithoutSlab: 3,
                thickWallLength: 77.05,
                thinWallLength: 39.3,
                isCeilingHollowSlab: true,
                windows: [
                  Window(
                      width: 17,
                      height: 2.2,
                      hasRailing: true,
                      hasWindowsill: true,
                      count: 1),
                ],
                rooms: [
                  ApartmentEntree(area: 0, perimeter: 0),
                  SaloonWithKitchen(
                    area: 30.87,
                    perimeter: 32,
                  ),
                  NormalRoom(area: 12.95, perimeter: 14.4),
                  NormalRoom(area: 8.93, perimeter: 12),
                  Bathroom(area: 3.19, perimeter: 7.5),
                  Bathroom(area: 4.38, perimeter: 8.5),
                  ApartmentEntree(area: 0, perimeter: 0),
                  SaloonWithKitchen(
                    area: 33,
                    perimeter: 30.7,
                  ),
                  NormalRoom(area: 15.4, perimeter: 16.5),
                  NormalRoom(area: 10.88, perimeter: 13.2),
                  Bathroom(area: 3.19, perimeter: 7.5),
                  Bathroom(area: 5.08, perimeter: 9.3),
                  FloorHall(area: 8.1, perimeter: 13.8),
                  FireEscapeHall(area: 11.1, perimeter: 20.9),
                ],
              ),
              11),
          Floor(
            no: 0,
            ceilingArea: 177.15,
            ceilingPerimeter: 61.3,
            fullHeight: 3.3,
            area: 177.15,
            perimeter: 61.3,
            heightWithoutSlab: 3,
            thickWallLength: 77.05,
            thinWallLength: 39.3,
            isCeilingHollowSlab: true,
            windows: [
              Window(
                  width: 14,
                  height: 2.2,
                  hasRailing: true,
                  hasWindowsill: true,
                  count: 1),
            ],
            rooms: [
              ApartmentEntree(area: 0, perimeter: 0),
              SaloonWithKitchen(
                area: 33.61,
                perimeter: 29.3,
              ),
              NormalRoom(area: 12.6, perimeter: 14.2),
              Bathroom(area: 3.18, perimeter: 7.5),
              Bathroom(area: 4.13, perimeter: 8.3),
              ApartmentEntree(area: 0, perimeter: 0),
              SaloonWithKitchen(
                area: 33.5,
                perimeter: 29.2,
              ),
              NormalRoom(area: 13.29, perimeter: 15.3),
              Bathroom(area: 3.18, perimeter: 7.5),
              Bathroom(area: 4.13, perimeter: 8.3),
              FireEscapeHall(area: 11.1, perimeter: 20.9),
              BuildingHall(area: 15.92, perimeter: 21.1),
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
            thickWallLength: 75,
            thinWallLength: 0,
            isCeilingHollowSlab: false,
            rooms: [
              ParkingArea(area: 296.25, perimeter: 94.82),
              TechnicalArea(area: 7.15, perimeter: 10.7),
              TechnicalArea(area: 7.25, perimeter: 10.8),
              TechnicalArea(area: 17, perimeter: 16.6),
              TechnicalArea(area: 52.6, perimeter: 33.6),
              ElevatorShaft(area: 18.9, perimeter: 18.3),
              ElevatorShaft(area: 8.61, perimeter: 12.8),
              FloorHall(area: 6.07, perimeter: 11.1),
              FireEscapeHall(area: 11.1, perimeter: 20.9),
            ],
          ),
        ],
        foundationArea: 477,
        foundationPerimeter: 94.42,
        foundationHeight: 1,
      );
      emit(state.copyWith(quantityCalculator: quantityCalculator));
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
    on<ShowHideMainCategory>((event, emit) {
      for (var costCategory in state.costTemplate.enabledCostCategories) {
        if (costCategory.mainCategory == event.mainCategory) {
          costCategory.visible = !costCategory.visible;
        }
      }
      _refresh();
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
  }

  final UnitPriceRepository _unitPriceRepository = UnitPriceRepository();

  void init() {
    add(const Init());
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

      final formattedFixedAmount = getFormattedNumber(
          number: lastDatedUnitPrice.fixedAmount,
          unit: lastDatedUnitPrice.currency.symbol);
      final formattedAmount = getFormattedNumber(
          number: lastDatedUnitPrice.amount,
          unit:
              "${lastDatedUnitPrice.currency.symbol}/${lastDatedUnitPrice.category.unit.symbol}");

      final formattedUnitPrice = lastDatedUnitPrice.fixedAmount != 0
          ? "$formattedFixedAmount + $formattedAmount"
          : formattedAmount;

      final quantity =
          quantityCalculator.calculateQuantity(enabledCostCategory.jobCategory);
      final formattedQuantity = getFormattedNumber(number: quantity);

      final quantityExplanation = quantityCalculator
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
        formattedUnitPrice: formattedUnitPrice,
        formattedQuantity: formattedQuantity,
        quantityExplanation: quantityExplanation,
        totalPriceTRY: totalPriceTRY,
        formattedTotalPriceTRY: formattedTotalPriceTRY,
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
