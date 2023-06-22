import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kost/data/app_data.dart';
import 'package:kost/domain/calculator/project_constants.dart';
import 'package:kost/domain/model/currency.dart';
import 'package:kost/domain/model/unit_price_template.dart';

import '../../presentation/model/cost_item.dart';
import '../calculator/floor.dart';
import '../calculator/quantity_calculator.dart';
import 'project_event.dart';
import 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(
    ProjectState(
      quantityCalculator: QuantityCalculator(
        projectConstants: ProjectConstants(),
        excavationLength: 113.71,
        excavationArea: 798.74,
        floors: [
          Floor(
            ceilingArea: 249,
            type: FloorType.k2,
          ),
          Floor(
            ceilingArea: 249,
            type: FloorType.k1,
          ),
          Floor(
            ceilingArea: 249,
            type: FloorType.z,
          ),
          Floor(
            ceilingArea: 689,
            height: 3.15,
            type: FloorType.b1,
          ),
          Floor(
            ceilingArea: 689,
            height: 3.15,
            type: FloorType.b2,
          ),
        ],
      ),
      unitPrices: const [],
      currencyRates: DefaultCurrencyRates(),
      costTemplate: EmptyCostTemplate(),
      groupedUiCostItems: const {},
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
      emit(state.copyWith(costTemplate: BuildingCostTemplate()));
    });
    on<CreateCostTable>((event, emit) {
      List<CostItem> costItems = [];

      if(!_isAllEnabledUnitPriceCategoriesInUnitPrices) {
        throw Exception("All enabled unit prices in the template are NOT included in fetched unit prices."); //Handle
      }

      for (var unitPrice in state.unitPrices) {
        if(state.costTemplate.enabledUnitPriceCategories.contains(unitPrice.category)) {
          final costItem = CostItem(
            unitPrice: unitPrice,
            quantity: state.quantityCalculator.getQuantityFromUnitPriceCategory(unitPrice.category),
            currencyRates: state.currencyRates
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

      final uiCostItems = costItems.map((costItem) => costItem.toUiCostItem()).toList();
      final groupedUiCostItems = uiCostItems.groupListsBy((uiCostItem) => uiCostItem.mainCategory,);
      final grandTotalTRY = _calculateGrandTotal(costItems.map((costItem) => costItem.totalPriceTRY).toList());
      final formattedGrandTotalTRY = "${NumberFormat("#,##0.00", "tr_TR").format(grandTotalTRY)} TL";
      emit(state.copyWith(groupedUiCostItems: groupedUiCostItems, formattedGrandTotalTRY: formattedGrandTotalTRY));
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

  double _calculateGrandTotal(List<double> totalPricesTRY) {
    return totalPricesTRY.fold(0, (p, c) => p + c);
  }

  void init() {
    add(const Init());
  }
}
