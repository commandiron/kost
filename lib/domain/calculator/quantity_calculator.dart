import 'package:collection/collection.dart';
import 'package:kost/domain/calculator/project_constants.dart';
import '../model/category.dart';
import 'floor.dart';

class QuantityCalculator {
  final ProjectConstants projectConstants;
  final double excavationLength;
  final double excavationArea;
  final List<Floor> floors;
  final double foundationHeight;
  final double insulationConcreteHeight;
  final double leanConcreteHeight;
  final double stabilizationHeight;
  final double elevationTowerArea;

  QuantityCalculator(
    {
      required this.projectConstants,
      required this.excavationLength,
      required this.excavationArea,
      required this.floors,
      this.foundationHeight = 1,
      this.insulationConcreteHeight = 0.05,
      this.leanConcreteHeight = 0.10,
      this.stabilizationHeight = 0.30,
      this.elevationTowerArea = 30,
    }
  );

  Floor? get firstBasementFloor {

    final List<FloorType> basementTypes = [
      FloorType.b3,
      FloorType.b2,
      FloorType.b1,
    ];

    for (var basementType in basementTypes) {
      if(floors.any((floor) => floor.type == basementType)) {
        return floors.firstWhereOrNull((floor) => floor.type == basementType);
      }
    }

    return null;
  }
  Floor? get groundFloor {
    return floors.firstWhereOrNull((e) => e.type == FloorType.z);
  }
  Floor? get firstFloor {
    return floors.firstWhereOrNull((e) => e.type == FloorType.k1);
  }
  List<Floor>? get basementFloors => floors.where((floor) => floor.type == FloorType.b3 || floor.type == FloorType.b2 || floor.type == FloorType.b1).toList();

  double get excavationHeight => stabilizationHeight + leanConcreteHeight + insulationConcreteHeight + foundationHeight + basementsHeight;
  double get basementsHeight {
    double basementsHeight = 0;
    if(basementFloors != null) {
      for (var basementFloor in basementFloors!) {
        basementsHeight += basementFloor.height;
      }
    }
    return basementsHeight;
  }
  double get roughConstructionArea {
    double roughConstructionArea = 0;
    roughConstructionArea += firstBasementFloor?.ceilingArea ?? 0; //Foundation
    for (var floor in floors) {
      roughConstructionArea += floor.ceilingArea;
    }
    roughConstructionArea += elevationTowerArea;
    return roughConstructionArea;
  }

  double get totalFormWorkArea {
    return roughConstructionArea;
  }

  double get totalStructuralConcrete {
    return totalFormWorkArea * projectConstants.concreteCubicMeterForOneSquareMeterFormWork;
  }

  double get totalStructuralSteel {
    return totalStructuralConcrete * projectConstants.rebarTonForOneCubicMeterConcrete;
  }

  double getQuantityFromUnitPriceCategory(UnitPriceCategory unitPriceCategory) {
    switch(unitPriceCategory) {
      case UnitPriceCategory.shutcrete : return excavationLength * excavationHeight;
      case UnitPriceCategory.excavation : return excavationArea * excavationHeight;
      case UnitPriceCategory.breaker : return excavationArea * excavationHeight * projectConstants.breakerHourForOneCubicMeterExcavation;
      case UnitPriceCategory.foundationStabilizationGravel : return excavationArea * stabilizationHeight;
      case UnitPriceCategory.c16Concrete : return excavationArea * (leanConcreteHeight + insulationConcreteHeight);
      case UnitPriceCategory.c30Concrete : return totalStructuralConcrete;
      case UnitPriceCategory.c35Concrete : return totalStructuralConcrete;
      case UnitPriceCategory.s420Steel : return totalStructuralSteel;
      case UnitPriceCategory.plywood : return totalFormWorkArea;
    }
  }
}