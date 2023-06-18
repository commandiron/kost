import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/bloc/model/project_constants.dart';
import 'package:kost/bloc/model/cost_item.dart';

import 'model/floor.dart';
import 'project_event.dart';
import 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(
    ProjectState(
      projectConstants: ProjectConstants(),
      projectCalculator: ProjectCalculator(
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
      excavationCostItems: List.empty(),
    )
  ) {
    on<Init>((event, emit) {
      add(const CreateExcavationCostItems());
    });
    on<CreateExcavationCostItems>((event, emit) {
      emit(
        state.copyWith(
          excavationCostItems: [
            Shoring(
              quantity: state.projectCalculator.excavationLength * state.projectCalculator.excavationHeight
            ),
            Excavation(
              quantity: state.projectCalculator.excavationArea * state.projectCalculator.excavationHeight
            ),
            Breaker(
              quantity: state.projectCalculator.excavationArea * state.projectCalculator.excavationHeight * state.projectConstants.breakerHourForOneCubicMeterExcavation
            )
          ]
        )
      );
    });
  }
  void init() {
    add(const Init());
  }

  double calculateShoringQuantity() {
    return 0;
  }

  double calculateExcavationQuantity() {
    return 0;
  }
}
