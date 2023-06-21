import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/data/app_data.dart';
import 'package:kost/domain/calculator/project_constants.dart';
import 'package:kost/domain/model/cost_template.dart';
import 'package:kost/domain/model/currency.dart';

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
            area: 249,
            type: FloorType.k2,
          ),
          Floor(
            area: 249,
            type: FloorType.k1,
          ),
          Floor(
            area: 249,
            type: FloorType.z,
          ),
          Floor(
            area: 689,
            height: 3.15,
            type: FloorType.b1,
          ),
          Floor(
            area: 689,
            height: 3.15,
            type: FloorType.b2,
          ),
        ],
      ),
      unitPrices: const [],
      currencyRates: DefaultCurrencyRates(),
      enabledJobCategories: const [],
      costItems: const [],
      grandTotalTRY: 0
    ),
  ){
    on<Init>((event, emit) {
      add(const FetchUnitPrices());
      add(const FetchCurrencyRates());
      add(const FetchEnabledJobCategories());
    });
    on<FetchUnitPrices>((event, emit) {
      emit(state.copyWith(unitPrices: AppData.unitPrices));
    });
    on<FetchCurrencyRates>((event, emit) {
      emit(state.copyWith(currencyRates: DefaultCurrencyRates()));
    });
    on<FetchEnabledJobCategories>((event, emit) {
      emit(state.copyWith(enabledJobCategories: RoughConstructionTemplate().jobCategories));
      _refresh();
    });
    on<CreateGroupedCostItems>((event, emit) {
      List<CostItem> costItems = [];
      for (var unitPrice in state.unitPrices) {
        if(state.enabledJobCategories.contains(unitPrice.jobCategory)) {
          costItems.add(
            CostItem(
              jobCategory: unitPrice.jobCategory,
              unitPrice: unitPrice,
              quantity: state.quantityCalculator.getQuantityFromJobCategory(unitPrice.jobCategory),
              currencyRates: state.currencyRates
            )
          );
        }
      }
      emit(state.copyWith(costItems: costItems));
    });
    on<CalculateGrandTotal>((event, emit) {
      double grandTotalTRY = 0;
      for (var costItem in state.costItems) {
        grandTotalTRY += costItem.totalPriceTRY;
      }
      emit(state.copyWith(grandTotalTRY: grandTotalTRY));
    });
    on<ReplaceJobCategory>((event, emit) {
      for (var enabledJobCategory in state.enabledJobCategories) {
        if(enabledJobCategory.mainCategory == event.jobCategory.mainCategory) {
          state.enabledJobCategories.remove(enabledJobCategory);
          state.enabledJobCategories.add(event.jobCategory);
        }
      }
      _refresh();
    });
  }

  void _refresh() {
    add(const CreateGroupedCostItems());
    add(const CalculateGrandTotal());
  }

  void init() {
    add(const Init());
  }
}
