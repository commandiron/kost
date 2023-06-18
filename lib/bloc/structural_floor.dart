import 'package:collection/collection.dart';

class BuildingStructureProp {
  final List<StructuralFloor> structuralFloors;

  BuildingStructureProp(
    {
      required this.structuralFloors
    }
  );

  StructuralFloor? get foundation => structuralFloors.firstWhereOrNull(
      (element) => element.structuralFloorType == StructuralFloorType.foundation,
  );
  StructuralFloor? get firstBasementFloor => structuralFloors.firstWhereOrNull(
      (element) => element.structuralFloorType == StructuralFloorType.b3 || element.structuralFloorType == StructuralFloorType.b2 || element.structuralFloorType == StructuralFloorType.b1,
  );
  List<StructuralFloor>? get basementFloors => structuralFloors.where((element) => element.structuralFloorType == StructuralFloorType.b3 || element.structuralFloorType == StructuralFloorType.b2 || element.structuralFloorType == StructuralFloorType.b1).toList();

  double get excavationHeight => stabilizationHeight + leanConcreteHeight + insulationConcreteHeight + foundationHeight + basementsHeight;
  double get basementsHeight {
    double basementsHeight = 0;
    if(basementFloors != null) {
      for (var basementFloor in basementFloors!) {
        basementsHeight += basementFloor.columnHeight + basementFloor.slapThickness;
      }
    }
    return basementsHeight;
  }
  double get foundationHeight => _find(StructuralFloorType.foundation)?.slapThickness ?? 0;
  double get insulationConcreteHeight => _find(StructuralFloorType.insulationConcrete)?.slapThickness ?? 0;
  double get leanConcreteHeight => _find(StructuralFloorType.leanConcrete)?.slapThickness ?? 0;
  double get stabilizationHeight => _find(StructuralFloorType.stabilization)?.slapThickness ?? 0;

  StructuralFloor? _find(StructuralFloorType structuralFloorType) {
    return structuralFloors.firstWhereOrNull((element) => element.structuralFloorType == structuralFloorType);
  }
}

abstract class StructuralFloor {
  final double ceilingSlabArea;
  final double columnHeight;
  final double slapThickness;
  final StructuralFloorType structuralFloorType;

  StructuralFloor (
    {
      required this.ceilingSlabArea,
      this.columnHeight = 0,
      required this.slapThickness,
      required this.structuralFloorType
    }
  );
}

enum StructuralFloorType {
  stabilization, leanConcrete, insulationConcrete, foundation, b3, b2, b1, z, k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k20
}

class DefaultStructuralFloor extends StructuralFloor {
  DefaultStructuralFloor({required super.ceilingSlabArea, super.columnHeight = 3, super.slapThickness = 0.30, super.structuralFloorType = StructuralFloorType.foundation});
}

class DefaultBasementStructuralFloor extends StructuralFloor {
  DefaultBasementStructuralFloor({required super.ceilingSlabArea, super.columnHeight = 3, super.slapThickness = 0.15, super.structuralFloorType = StructuralFloorType.foundation});
}

class Foundation extends StructuralFloor {
  Foundation({required super.ceilingSlabArea, super.slapThickness = 1, super.structuralFloorType = StructuralFloorType.foundation});
}

class InsulationConcrete extends StructuralFloor {
  InsulationConcrete({required super.ceilingSlabArea, super.slapThickness = 0.05, super.structuralFloorType = StructuralFloorType.insulationConcrete});
}

class LeanConcrete extends StructuralFloor {
  LeanConcrete({required super.ceilingSlabArea, super.slapThickness = 0.10, super.structuralFloorType = StructuralFloorType.leanConcrete});
}

class Stabilization extends StructuralFloor {
  Stabilization({required super.ceilingSlabArea, super.slapThickness = 0.3, super.structuralFloorType = StructuralFloorType.stabilization});
}