import '../constants.dart';
import 'floor/floor.dart';

class ProjectProperties {
  final double plotAreaM2;
  final List<ArchitecturalFloor> architecturalFloors;
  final List<StructuralFloor> structuralFloors;
  ProjectProperties._(
    {
      required this.plotAreaM2,
      required this.architecturalFloors,
      required this.structuralFloors,
    }
  );

  static List<StructuralFloor> architecturalFloorsToStructuralFloors(List<ArchitecturalFloor> architecturalFloors) {
    final List<StructuralFloor> structuralFloors = [];

    final ArchitecturalFloor lastBasementFloor;
    lastBasementFloor = architecturalFloors.firstWhere(
          (element) => element.floorType == ArchitecturalFloorType.b3 || element.floorType == ArchitecturalFloorType.b2 || element.floorType == ArchitecturalFloorType.b1,
    );

    final ArchitecturalFloor firstNormalFloor;
    firstNormalFloor = architecturalFloors.firstWhere(
          (element) => element.floorType == ArchitecturalFloorType.k1,
    );

    //Foundation
    structuralFloors.add(
        StructuralFloor(
            ceilingAreaM2: lastBasementFloor.floorAreaM2,
            lengthM: lastBasementFloor.lengthM,
            floorToFloorHeightM: 1,
            floorType: StructuralFloorType.foundation
        )
    );

    //Floors
    for (var architecturalFloor in architecturalFloors) {
      switch(architecturalFloor.floorType) {
        case ArchitecturalFloorType.b3 : structuralFloors.add(
            StructuralFloor(
                ceilingAreaM2: architecturalFloor.floorAreaM2,
                lengthM: architecturalFloor.lengthM,
                floorToFloorHeightM: architecturalFloor.floorToCeilingHeightM + Constants.basementSlabThicknessM,
                floorType: architecturalFloor.floorType.toStructuralFloorType
            )
        );
        case ArchitecturalFloorType.b2 : structuralFloors.add(
            StructuralFloor(
                ceilingAreaM2: architecturalFloor.floorAreaM2,
                lengthM: architecturalFloor.lengthM,
                floorToFloorHeightM: architecturalFloor.floorToCeilingHeightM + Constants.basementSlabThicknessM,
                floorType: architecturalFloor.floorType.toStructuralFloorType
            )
        );
        case ArchitecturalFloorType.b1 : structuralFloors.add(
            StructuralFloor(
                ceilingAreaM2: architecturalFloor.floorAreaM2,
                lengthM: architecturalFloor.lengthM,
                floorToFloorHeightM: architecturalFloor.floorToCeilingHeightM + Constants.basementSlabThicknessM,
                floorType: architecturalFloor.floorType.toStructuralFloorType
            )
        );
        case ArchitecturalFloorType.z : structuralFloors.add(
            StructuralFloor(
                ceilingAreaM2: firstNormalFloor.floorAreaM2,
                lengthM: architecturalFloor.lengthM,
                floorToFloorHeightM: architecturalFloor.floorToCeilingHeightM + Constants.slabThicknessM,
                floorType: architecturalFloor.floorType.toStructuralFloorType
            )
        );
        default : structuralFloors.add(
            StructuralFloor(
                ceilingAreaM2: architecturalFloor.floorAreaM2,
                lengthM: architecturalFloor.lengthM,
                floorToFloorHeightM: architecturalFloor.floorToCeilingHeightM + Constants.slabThicknessM,
                floorType: architecturalFloor.floorType.toStructuralFloorType
            )
        );
      }
    }

    //Elevator Tower
    structuralFloors.add(
        StructuralFloor(
            ceilingAreaM2: 25,
            lengthM: 5,
            floorToFloorHeightM: 3.30,
            floorType: StructuralFloorType.elevatorTower
        )
    );

    return structuralFloors;
  }

  factory ProjectProperties(double plotArea, List<ArchitecturalFloor> architecturalFloors,) {
    return ProjectProperties._(
      plotAreaM2: plotArea,
      architecturalFloors: architecturalFloors,
      structuralFloors: architecturalFloorsToStructuralFloors(architecturalFloors),
    );
  }
}