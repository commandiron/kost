import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kost/data/app_data.dart';
import 'package:kost/domain/calculator/detailed/detailed_quantity_calculator.dart';
import 'package:kost/domain/calculator/detailed/project_constants.dart';
import 'package:kost/domain/calculator/detailed/room.dart';
import 'package:kost/domain/calculator/detailed/window.dart';
import 'package:kost/domain/calculator/quantity_calculator.dart';
import 'package:kost/domain/model/unit_price/currency.dart';
import 'package:kost/domain/model/template/unit_price_template.dart';

import '../../presentation/model/cost_item.dart';
import '../calculator/detailed/floor.dart';
import '../model/category/category.dart';
import '../model/unit_price/unit_price.dart';
import 'project_event.dart';
import 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(
    ProjectState(
      quantityCalculator: InitialQuantityCalculator(),
      unitPricePool: const [],
      currencyRates: DefaultCurrencyRates(),
      costTemplate: EmptyCostTemplate(),
      uiCostItems: const [],
      formattedGrandTotalTRY: ""
    ),
  ){
    on<Init>((event, emit) {
      add(const CreateQuantityCalculator());
      add(const FetchUnitPrices());
      add(const FetchCurrencyRates());
      add(const FetchCostTemplate());
      _refresh();
    });
    on<CreateQuantityCalculator>((event, emit) {
      final quantityCalculator = DetailedQuantityCalculator(
        projectConstants: ProjectConstants(),
        excavationPerimeter: 103.07,
        excavationArea: 581.47,
        coreCurtainLength: 30,
        curtainsExceeding1MeterLength: 10,
        columnsLess1MeterLengthPerimeter: 20,
        elevationTowerArea: 30,
        elevationTowerHeightWithoutSlab: 3,
        floors: [
          ...Floor.duplicateFloors(
            Floor(
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
                Window(width: 17, height: 2.2, hasGuard: true, count: 1),
              ],
              rooms: [
                NormalRoom(area: 30.87, perimeter: 32),
                NormalRoom(area: 12.95, perimeter: 14.4),
                NormalRoom(area: 8.93, perimeter: 12),
                NormalRoom(area: 33, perimeter: 30.7),
                NormalRoom(area: 15.4, perimeter: 16.5),
                NormalRoom(area: 10.88, perimeter: 13.2),
                Bathroom(area: 3.19, perimeter: 7.5),
                Bathroom(area: 3.19, perimeter: 7.5),
                Bathroom(area: 5.08, perimeter: 9.3),
                Bathroom(area: 4.38, perimeter: 8.5),
                BuildingHall(area: 11.1, perimeter: 20.9),
                BuildingHall(area: 8.1, perimeter: 13.8),
              ],
              type: FloorType.k1,
            ),
            11
          ),
          Floor(
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
              Window(width: 14, height: 2.2, hasGuard: true, count: 1),
            ],
            rooms: [
              NormalRoom(area: 33.61, perimeter: 29.3),
              NormalRoom(area: 12.6, perimeter: 14.2),
              NormalRoom(area: 33.5, perimeter: 29.2),
              NormalRoom(area: 13.29, perimeter: 15.3),
              Bathroom(area: 3.18, perimeter: 7.5),
              Bathroom(area: 3.18, perimeter: 7.5),
              Bathroom(area: 4.13, perimeter: 8.3),
              Bathroom(area: 4.13, perimeter: 8.3),
              BuildingHall(area: 11.1, perimeter: 20.9),
              BuildingHall(area: 15.92, perimeter: 21.1),
            ],
            type: FloorType.z,
          ),
          Floor(
            ceilingArea: 477,
            ceilingPerimeter: 94.42,
            fullHeight: 3.15,
            area: 477,
            perimeter: 94.42,
            heightWithoutSlab: 3,
            thickWallLength: 75,
            thinWallLength: 0,
            isCeilingHollowSlab: false,
            type: FloorType.b1,
            rooms: [
              ParkingArea(area: 296.25, perimeter: 94.82),
              TechnicalArea(area: 7.15, perimeter: 10.7),
              TechnicalArea(area: 7.25, perimeter: 10.8),
              TechnicalArea(area: 17, perimeter: 16.6),
              TechnicalArea(area: 52.6, perimeter: 33.6),
              BuildingHall(area: 11.1, perimeter: 20.9),
              BuildingHall(area: 6.07, perimeter: 11.1),
              ElevatorShaft(area: 18.9, perimeter: 18.3),
              ElevatorShaft(area: 8.61, perimeter: 12.8),
            ]
          ),
        ],
        foundationArea: 477,
        foundationPerimeter: 94.42,
        foundationHeight: 1,
      );
      emit(state.copyWith(quantityCalculator: quantityCalculator));
    });
    on<FetchUnitPrices>((event, emit) {
      emit(state.copyWith(unitPricePool: AppData.unitPrices));
    });
    on<FetchCurrencyRates>((event, emit) {
      emit(state.copyWith(currencyRates: DefaultCurrencyRates()));
    });
    on<FetchCostTemplate>((event, emit) {
      emit(state.copyWith(costTemplate: BuildingCostTemplate()));
    });
    on<CreateCostTable>((event, emit) {

      if(!_isAllUnitPricesInCostTemplateIncludedInUnitPricePool) {
        throw Exception("All enabled unit prices in the cost template are NOT included in fetched unit prices."); //Handle
      }

      final costItems = _createFilteredCostItems(
        unitPricePool: state.unitPricePool,
        enabledCostCategories: state.costTemplate.enabledCostCategories,
        quantityCalculator: state.quantityCalculator,
        currencyRates: state.currencyRates
      );

      final uiCostItems = costItems.map((costItem) => costItem.toUiCostItem()).toList();
      final formattedGrandTotalTRY = "${NumberFormat("#,##0.00", "tr_TR").format(_calculateGrandTotal(costItems))} TL";
      emit(state.copyWith(uiCostItems: uiCostItems, formattedGrandTotalTRY: formattedGrandTotalTRY));
    });
  }

  void init() {
    add(const Init());
  }

  bool get _isAllUnitPricesInCostTemplateIncludedInUnitPricePool {
    for (var enabledCostCategory in state.costTemplate.enabledCostCategories) {
      if(!state.unitPricePool.map((e) => e.category).toList().contains(enabledCostCategory.unitPriceCategory)) {
        return false;
      }
    }
    return true;
  }

  List<CostItem> _createFilteredCostItems(
    {
      required List<UnitPrice> unitPricePool,
      required List<CostCategory> enabledCostCategories,
      required QuantityCalculator quantityCalculator,
      required CurrencyRates currencyRates,
    }
  ) {
    List<CostItem> costItems = [];

    for (var enabledCostCategory in enabledCostCategories) {
      final unitPrices =  unitPricePool.where((unitPrice) => unitPrice.category == enabledCostCategory.unitPriceCategory).toList();
      final lastDatedUnitPrice = unitPrices.reduce((current, next) => current.dateTime.isAfter(next.dateTime) ? current : next);
      final costItem = CostItem(
        costCategory: enabledCostCategory,
        unitPrice: lastDatedUnitPrice,
        quantity: quantityCalculator.getQuantityFromJobCategory(enabledCostCategory.jobCategory),
        quantityExplanation: quantityCalculator.getQuantityExplanationFromJobCategory(enabledCostCategory.jobCategory),
        currencyRates: currencyRates
      );
      costItems.add(costItem);
    }
    return costItems;
  }

  double _calculateGrandTotal(List<CostItem> costItems) {
    return costItems.map((costItem) => costItem.totalPriceTRY).toList().fold(0, (p, c) => p + c);
  }

  void _refresh() {
    add(const CreateCostTable());
  }
}