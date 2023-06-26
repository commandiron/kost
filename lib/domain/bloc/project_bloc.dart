import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kost/data/app_data.dart';
import 'package:kost/domain/calculator/detailed/detailed_quantity_calculator.dart';
import 'package:kost/domain/calculator/detailed/project_constants.dart';
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
      unitPrices: const [],
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
              thickWallLength: 100,
              thinWallLength: 100,
              isCeilingHollowSlab: true,
              windows: [
                Window(width: 17, height: 2.2, hasGuard: true, count: 1),
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
            thickWallLength: 100,
            thinWallLength: 100,
            isCeilingHollowSlab: true,
            windows: [
              Window(width: 14, height: 2.2, hasGuard: true, count: 1),
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
            thickWallLength: 100,
            thinWallLength: 100,
            isCeilingHollowSlab: false,
            type: FloorType.b1,
          ),
        ],
        foundationArea: 477,
        foundationPerimeter: 94.42,
        foundationHeight: 1,
      );
      emit(state.copyWith(quantityCalculator: quantityCalculator));
    });
    on<FetchUnitPrices>((event, emit) {
      emit(state.copyWith(unitPrices: AppData.unitPrices));
    });
    on<FetchCurrencyRates>((event, emit) {
      emit(state.copyWith(currencyRates: DefaultCurrencyRates()));
    });
    on<FetchCostTemplate>((event, emit) {
      emit(state.copyWith(costTemplate: BuildingCostTemplate()));
    });
    on<CreateCostTable>((event, emit) {

      if(!_isAllEnabledUnitPriceCategoriesInUnitPrices) {
        throw Exception("All enabled unit prices in the template are NOT included in fetched unit prices."); //Handle
      }

      final costItems = _createFilteredCostItems(
        unitPrices: state.unitPrices,
        enabledUnitPriceCategories: state.costTemplate.enabledUnitPriceCategories,
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

  bool get _isAllEnabledUnitPriceCategoriesInUnitPrices {
    for (var enabledUnitPriceCategory in state.costTemplate.enabledUnitPriceCategories) {
      if(!state.unitPrices.map((e) => e.category).toList().contains(enabledUnitPriceCategory)) {
        return false;
      }
    }
    return true;
  }

  List<CostItem> _createFilteredCostItems(
    {
      required List<UnitPrice> unitPrices,
      required List<UnitPriceCategory> enabledUnitPriceCategories,
      required QuantityCalculator quantityCalculator,
      required CurrencyRates currencyRates,
    }
  ) {
    List<CostItem> costItems = [];

    for (var unitPrice in unitPrices) {
      if(enabledUnitPriceCategories.contains(unitPrice.category)) {
        final costItem = CostItem(
          unitPrice: unitPrice,
          quantity: quantityCalculator.getQuantityFromUnitPriceCategory(unitPrice.category),
          quantityExplanation: quantityCalculator.getQuantityExplanationFromUnitPriceCategory(unitPrice.category),
          currencyRates: currencyRates
        );
        final sameCategoryCostItem = costItems.firstWhereOrNull((costItem) => costItem.unitPrice.category == unitPrice.category);
        if(sameCategoryCostItem != null) {
          if(sameCategoryCostItem.unitPrice.dateTime.isBefore(unitPrice.dateTime)) {
            costItems.remove(sameCategoryCostItem);
            costItems.add(costItem);
          }
        } else {
          costItems.add(costItem);
        }
      }
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