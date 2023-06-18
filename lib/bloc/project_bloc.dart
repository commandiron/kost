import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/bloc/structural_floor.dart';
import 'package:kost/logic/cost_item/cost_item.dart';

import 'project_event.dart';
import 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(
    ProjectState(
      buildingStructureProp: BuildingStructureProp(
        structuralFloors: []
      ),
      excavationCostItems: List.empty(),
    )
  ) {
    on<Init>((event, emit) {
      add(const CreateStructuralFloors());
      add(const CreateExcavationCostItems());
    });
    on<CreateStructuralFloors>((event, emit) {
      state.buildingStructureProp.structuralFloors.addAll(
        [
          DefaultStructuralFloor(
            ceilingSlabArea: 249,
            structuralFloorType: StructuralFloorType.k2
          ),
          DefaultStructuralFloor(
            ceilingSlabArea: 249,
            structuralFloorType: StructuralFloorType.k1
          ),
          DefaultStructuralFloor(
            ceilingSlabArea: 249,
            structuralFloorType: StructuralFloorType.z
          ),
          DefaultBasementStructuralFloor(
            ceilingSlabArea: 689,
            structuralFloorType: StructuralFloorType.b1
          ),
          DefaultBasementStructuralFloor(
            ceilingSlabArea: 689,
            structuralFloorType: StructuralFloorType.b2
          ),
          Foundation(ceilingSlabArea: 689),
          InsulationConcrete(ceilingSlabArea: 689),
          LeanConcrete(ceilingSlabArea: 689),
          Stabilization(ceilingSlabArea: 689)
        ]
      );
    });
    on<CreateExcavationCostItems>((event, emit) {
      emit(
        state.copyWith(
          excavationCostItems: [
            Shoring(
              quantity: 106 * state.buildingStructureProp.excavationHeight
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
