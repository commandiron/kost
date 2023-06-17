import 'package:collection/collection.dart';

class BuildingStructureProp {
  final List<StructuralFloor> structuralFloors;

  BuildingStructureProp(
    {
      required this.structuralFloors
    }
  );

  StructuralFloor? getFoundation() {
    return structuralFloors.firstWhereOrNull(
      (element) => element.structuralFloorType == StructuralFloorType.foundation,
    );
  }

  StructuralFloor? getFirstBasementFloor() {
    return structuralFloors.firstWhereOrNull(
      (element) => element.structuralFloorType == StructuralFloorType.b3 || element.structuralFloorType == StructuralFloorType.b2 || element.structuralFloorType == StructuralFloorType.b1,
    );
  }

  List<StructuralFloor>? getBasementFloors() {
    return structuralFloors.where((element) => element.structuralFloorType == StructuralFloorType.b3 || element.structuralFloorType == StructuralFloorType.b2 || element.structuralFloorType == StructuralFloorType.b1).toList();
  }

  double getExcavationHeight() {
    final double subFoundationHeight = _find(StructuralFloorType.subFoundation)?.height ?? 0;
    final double foundationHeight = _find(StructuralFloorType.foundation)?.height ?? 0;
    double basementsHeight = 0;
    final basementFloors = getBasementFloors();
    if(basementFloors != null) {
      for (var element in basementFloors) {
        basementsHeight += element.height;
      }
    }
    return subFoundationHeight + foundationHeight + basementsHeight;
  }



  StructuralFloor? _find(StructuralFloorType structuralFloorType) {
    return structuralFloors.firstWhereOrNull((element) => element.structuralFloorType == structuralFloorType);
  }
}


class StructuralFloor {
  final double area;
  final double height;
  final StructuralFloorType structuralFloorType;

  StructuralFloor (
    {
      required this.area,
      this.height = 3.3,
      required this.structuralFloorType
    }
  );
}

enum StructuralFloorType {
  subFoundation, foundation, b3, b2, b1, z, k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k20
}