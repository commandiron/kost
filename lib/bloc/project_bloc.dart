import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/bloc/model/project_prop.dart';
import 'package:kost/bloc/model/cost_item.dart';

import 'model/floor.dart';
import 'project_event.dart';
import 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(
    ProjectState(
      projectProp: ProjectProp(
        excavationLength: 113.71,
        excavationArea: 798.74
      ),
      buildingPropCalculator: BuildingPropCalculator(
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
              quantity: state.projectProp.excavationLength * state.buildingPropCalculator.excavationHeight
            ),
            Excavation(
              quantity: state.projectProp.excavationArea * state.buildingPropCalculator.excavationHeight
            ),
            Breaker()
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
