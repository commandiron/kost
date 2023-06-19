import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/data/app_data.dart';
import 'package:kost/domain/calculator/project_constants.dart';

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
      costItems: const []
    ),
  ){
    on<Init>((event, emit) {
      add(const FetchUnitPrices());
      add(const CreateCostItems());
    });
    on<FetchUnitPrices>((event, emit) {
      emit(state.copyWith(unitPrices: AppData.unitPrices));
    });
    on<CreateCostItems>((event, emit) {
      List<CostItem> costItems = [];
      for (var unitPrice in state.unitPrices) {
        costItems.add(
          CostItem(
            jobUnitPrice: unitPrice,
            quantity: state.quantityCalculator.getQuantityFromJobId(unitPrice.jobId)
          )
        );
      }
      emit(state.copyWith(costItems: costItems));
    });
  }
  void init() {
    add(const Init());
  }
}
