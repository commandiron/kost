import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/bloc/structural_floor.dart';
import 'package:kost/logic/cost_item/cost_item.dart';

import 'project_event.dart';
import 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(
    ProjectState(
      excavationCostItems: List.empty(),
      buildingStructureProp: BuildingStructureProp(
        structuralFloors: []
      )
    )
  ) {
    on<Init>((event, emit) {
      add(const CreateBuildingStructure());
      add(const CreateExcavationCostItems());
    });
    on<CreateBuildingStructure>((event, emit) {
      state.buildingStructureProp.structuralFloors.addAll(
        [
          StructuralFloor(
              area: 200,
              structuralFloorType: StructuralFloorType.k2
          ),
          StructuralFloor(
              area: 200,
              structuralFloorType: StructuralFloorType.k1
          ),
          StructuralFloor(
              area: 200,
              structuralFloorType: StructuralFloorType.z
          ),
          StructuralFloor(
              area: 250,
              structuralFloorType: StructuralFloorType.b1
          ),
          StructuralFloor(
              area: 250,
              structuralFloorType: StructuralFloorType.b2
          ),
          StructuralFloor(
              area: 300,
              height: 1,
              structuralFloorType: StructuralFloorType.foundation
          ),
          StructuralFloor(
              area: 300,
              height: 0.45,
              structuralFloorType: StructuralFloorType.subFoundation
          ),
        ]
      );
    });
    on<CreateExcavationCostItems>((event, emit) {
      emit(
        state.copyWith(
          excavationCostItems: [
            Shoring(
              quantity: 1000 * state.buildingStructureProp.getExcavationHeight()
            ),
            Excavation(),
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
