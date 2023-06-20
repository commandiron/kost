import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/data/app_data.dart';
import 'package:kost/domain/calculator/project_constants.dart';
import 'package:kost/domain/model/category.dart';
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
      enabledJobCategories: [],
      costItems: const []
    ),
  ){
    on<Init>((event, emit) {
      add(const FetchUnitPrices());
      add(const FetchCurrencyRates());
      add(const FetchEnabledJobCategories());
      add(const CreateGroupedCostItems());
    });
    on<FetchUnitPrices>((event, emit) {
      emit(state.copyWith(unitPrices: AppData.unitPrices));
    });
    on<FetchCurrencyRates>((event, emit) {
      emit(state.copyWith(currencyRates: DefaultCurrencyRates()));
    });
    on<FetchEnabledJobCategories>((event, emit) {
      emit(
        state.copyWith(
          enabledJobCategories: [
            JobCategory.shutcrete,
            JobCategory.excavation,
            JobCategory.breaker,
          ]
        )
      );
    });
    on<ReplaceJobCategory>((event, emit) {
      for (var enabledJobCategory in state.enabledJobCategories) {
        if(enabledJobCategory.mainCategory == event.jobCategory.mainCategory) {
          state.enabledJobCategories.remove(enabledJobCategory);
          state.enabledJobCategories.add(event.jobCategory);
        }
      }
      emit(state);
      add(const CreateGroupedCostItems());
    });
    on<CreateGroupedCostItems>((event, emit) {
      final costItems = _createCostItemsFromUnitPrices();
      emit(state.copyWith(costItems: costItems));
    });
  }
  void init() {
    add(const Init());
  }

  List<CostItem> _createCostItemsFromUnitPrices() {
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
    return costItems;
  }
}
