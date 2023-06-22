import 'package:kost/domain/calculator/project_constants.dart';
import '../model/category.dart';
import 'floor.dart';

class QuantityCalculator {
  final ProjectConstants projectConstants;
  final double excavationLength;
  final double excavationArea;
  final double foundationArea;
  final double foundationLength;
  final double foundationHeight;
  final List<Floor> floors;
  final double insulationConcreteHeight;
  final double leanConcreteHeight;
  final double stabilizationHeight;
  final double elevationTowerArea;
  final double hollowFillingThickness;

  QuantityCalculator(
    {
      required this.projectConstants,
      required this.excavationLength,
      required this.excavationArea,
      required this.foundationArea,
      required this.foundationLength,
      this.foundationHeight = 1,
      required this.floors,
      this.insulationConcreteHeight = 0.05,
      this.leanConcreteHeight = 0.10,
      this.stabilizationHeight = 0.30,
      this.elevationTowerArea = 30,
      this.hollowFillingThickness = 0.2
    }
  );

  Floor get bottomMostBasementFloor {

    final List<FloorType> basementTypes = [
      FloorType.b3,
      FloorType.b2,
      FloorType.b1,
    ];

    for (var basementType in basementTypes) {
      if(floors.any((floor) => floor.type == basementType)) {
        return floors.firstWhere((floor) => floor.type == basementType);
      }
    }

    throw Exception("No bottom Most Basement.");
  }
  Floor get topMostBasementFloor {

    final List<FloorType> basementTypes = [
      FloorType.b1,
      FloorType.b2,
      FloorType.b3,
    ];

    for (var basementType in basementTypes) {
      if(floors.any((floor) => floor.type == basementType)) {
        return floors.firstWhere((floor) => floor.type == basementType);
      }
    }

    throw Exception("No top most basement.");
  }
  Floor get groundFloor {
    return floors.firstWhere((e) => e.type == FloorType.z);
  }
  List<Floor> get basementFloors => floors.where((floor) => floor.type == FloorType.b3 || floor.type == FloorType.b2 || floor.type == FloorType.b1).toList();

  double get excavationHeight => stabilizationHeight + leanConcreteHeight + insulationConcreteHeight + foundationHeight + basementsHeight;
  double get basementsHeight {
    double basementsHeight = 0;
    for (var basementFloor in basementFloors) {
      basementsHeight += basementFloor.height;
    }
    return basementsHeight;
  }

  double get roughConstructionArea {
    double roughConstructionArea = 0;
    roughConstructionArea += foundationArea;
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

  double get totalHollowVolume {
    return projectConstants.hollowAreaForOneSquareMeterConstructionArea * roughConstructionArea * hollowFillingThickness;
  }

  double get foundationWetArea {
    return foundationArea + (foundationLength * (foundationHeight));
  }

  double get basementCurtainArea {
    return basementFloors.map((e) => e.height * e.ceilingLength).toList().fold(0.0, (p, c) => p + c);
  }

  double get wetAreaAboveBasement {
    return topMostBasementFloor.ceilingArea - groundFloor.area;
  }

  double getQuantityFromUnitPriceCategory(UnitPriceCategory unitPriceCategory) {
    switch(unitPriceCategory) {
      case UnitPriceCategory.shutCrete : return excavationLength * excavationHeight;
      case UnitPriceCategory.excavation : return excavationArea * excavationHeight;
      case UnitPriceCategory.breaker : return excavationArea * excavationHeight * projectConstants.breakerHourForOneCubicMeterExcavation;
      case UnitPriceCategory.foundationStabilizationGravel : return excavationArea * stabilizationHeight;
      case UnitPriceCategory.c16Concrete : return excavationArea * (leanConcreteHeight + insulationConcreteHeight);
      case UnitPriceCategory.c30Concrete : return totalStructuralConcrete;
      case UnitPriceCategory.c35Concrete : return totalStructuralConcrete;
      case UnitPriceCategory.s420Steel : return totalStructuralSteel;
      case UnitPriceCategory.plywood : return totalFormWorkArea;
      case UnitPriceCategory.eps : return totalHollowVolume;
      case UnitPriceCategory.doubleLayerBitumenMembrane : return foundationWetArea;
      case UnitPriceCategory.bitumenSliding : return basementCurtainArea + wetAreaAboveBasement;
    }
  }
}