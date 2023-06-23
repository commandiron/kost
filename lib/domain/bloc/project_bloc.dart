import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kost/data/app_data.dart';
import 'package:kost/domain/calculator/detailed/detailed_quantity_calculator.dart';
import 'package:kost/domain/calculator/detailed/project_constants.dart';
import 'package:kost/domain/calculator/quantity_calculator.dart';
import 'package:kost/domain/model/currency.dart';
import 'package:kost/domain/model/unit_price_template.dart';

import '../../presentation/model/cost_item.dart';
import '../calculator/detailed/floor.dart';
import '../model/category.dart';
import '../model/unit_price.dart';
import 'project_event.dart';
import 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(
    ProjectState(
      quantityCalculator: DetailedQuantityCalculator(
        projectConstants: ProjectConstants(),
        excavationLength: 113.71,
        excavationArea: 798.74,
        floors: [
          Floor(
            ceilingArea: 249,
            ceilingLength: 60,
            area: 249,
            length: 60,
            height: 3.3,
            outerWallLength: 100,
            innerWallLength: 100,
            type: FloorType.k2,
          ),
          Floor(
            ceilingArea: 249,
            ceilingLength: 60,
            area: 249,
            length: 60,
            height: 3.3,
            outerWallLength: 100,
            innerWallLength: 100,
            type: FloorType.k1,
          ),
          Floor(
            ceilingArea: 249,
            ceilingLength: 60,
            area: 689,
            length: 105,
            height: 3.3,
            outerWallLength: 100,
            innerWallLength: 100,
            type: FloorType.z,
          ),
          Floor(
            ceilingArea: 689,
            ceilingLength: 105,
            area: 689,
            length: 105,
            height: 3.15,
            outerWallLength: 100,
            innerWallLength: 100,
            type: FloorType.b1,
          ),
          Floor(
            ceilingArea: 689,
            ceilingLength: 105,
            area: 689,
            length: 105,
            height: 3.15,
            outerWallLength: 100,
            innerWallLength: 100,
            type: FloorType.b2,
          ),
        ],
        foundationArea: 689,
        foundationLength: 105,
        foundationHeight: 1,
      ),
      unitPrices: const [],
      currencyRates: DefaultCurrencyRates(),
      costTemplate: EmptyCostTemplate(),
      uiCostItems: const [],
      formattedGrandTotalTRY: ""
    ),
  ){
    on<Init>((event, emit) {
      add(const FetchUnitPrices());
      add(const FetchCurrencyRates());
      add(const FetchCostTemplate());
      _refresh();
    });
    on<FetchUnitPrices>((event, emit) {
      emit(state.copyWith(unitPrices: AppData.unitPrices));
    });
    on<FetchCurrencyRates>((event, emit) {
      emit(state.copyWith(currencyRates: DefaultCurrencyRates()));
    });
    on<FetchCostTemplate>((event, emit) {
      emit(state.copyWith(costTemplate: RoughConstructionCostTemplate()));
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
    on<ReplaceUnitPriceCategory>((event, emit) {
      for (var enabledUnitPriceCategory in state.costTemplate.enabledUnitPriceCategories) {
        if(enabledUnitPriceCategory.jobCategory == event.unitPriceCategory.jobCategory) {
          state.costTemplate.enabledUnitPriceCategories.remove(enabledUnitPriceCategory);
          state.costTemplate.enabledUnitPriceCategories.add(event.unitPriceCategory);
        }
      }
      _refresh();
    });
  }

  void _refresh() {
    add(const CreateCostTable());
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

  void init() {
    add(const Init());
  }
}
