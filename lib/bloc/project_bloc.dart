import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/bloc/model/project_constants.dart';

import 'model/cost_item.dart';
import 'model/floor.dart';
import 'model/project_dim_calculator.dart';
import 'project_event.dart';
import 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(
    ProjectState(
      projectConstants: ProjectConstants(),
      projectDimCalculator: ProjectDimCalculator(
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
      excavationCostItems: const []
    ),
  ){
    on<Init>((event, emit) {
      add(const CreateExcavationCostItems());
    });
    on<CreateExcavationCostItems>((event, emit) {
      emit(
        state.copyWith(
          excavationCostItems: [
            Shoring(
                quantity: state.projectDimCalculator.excavationLength * state.projectDimCalculator.excavationHeight
            ),
            Excavation(
                quantity: state.projectDimCalculator.excavationArea * state.projectDimCalculator.excavationHeight
            ),
            Breaker(
                quantity: state.projectDimCalculator.excavationArea * state.projectDimCalculator.excavationHeight * state.projectConstants.breakerHourForOneCubicMeterExcavation
            )
          ]
        )
      );
    });
  }

  void init() {
    add(const Init());
  }
}
