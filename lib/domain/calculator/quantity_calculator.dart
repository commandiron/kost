import 'package:kost/domain/calculator/project_constants.dart';
import '../model/category.dart';
import 'floor.dart';

abstract class QuantityCalculator {
  double get _totalExcavationSurfaceArea;
  double get _totalExcavationVolume;
  double get _totalBreakerHour;
  double get _totalStabilizationVolume;
  double get _totalFillingConcrete;
  double get _totalStructuralConcrete;
  double get _totalStructuralSteel;
  double get _totalFormWorkArea;
  double get _totalHollowVolume;
  double get _foundationWetArea;
  double get _totalBasementsWetSurfaceArea;
  double get _basementCurtainArea;
  double get _totalWallVolume;
  double get _totalWallArea;

  double getQuantityFromUnitPriceCategory(UnitPriceCategory unitPriceCategory) {
    switch(unitPriceCategory) {
      case UnitPriceCategory.shutCrete : return _totalExcavationSurfaceArea;
      case UnitPriceCategory.excavation : return _totalExcavationVolume;
      case UnitPriceCategory.breaker : return _totalBreakerHour;
      case UnitPriceCategory.foundationStabilizationGravel : return _totalStabilizationVolume;
      case UnitPriceCategory.c16Concrete : return _totalFillingConcrete;
      case UnitPriceCategory.c30Concrete : return _totalStructuralConcrete;
      case UnitPriceCategory.c35Concrete : return _totalStructuralConcrete;
      case UnitPriceCategory.s420Steel : return _totalStructuralSteel;
      case UnitPriceCategory.plywood : return _totalFormWorkArea;
      case UnitPriceCategory.eps : return _totalHollowVolume;
      case UnitPriceCategory.doubleLayerBitumenMembrane : return _foundationWetArea;
      case UnitPriceCategory.bitumenSliding : return _totalBasementsWetSurfaceArea;
      case UnitPriceCategory.drainPlate : return _basementCurtainArea;
      case UnitPriceCategory.aeratedConcreteMaterial : return _totalWallVolume;
      case UnitPriceCategory.aeratedConcreteWorkmanShip : return _totalWallArea;
    }
  }
}

class DetailedQuantityCalculator extends QuantityCalculator {
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

  DetailedQuantityCalculator(
    {
      required this.projectConstants,
      required this.excavationLength,
      required this.excavationArea,
      required this.foundationArea,
      required this.foundationLength,
      required this.foundationHeight,
      required this.floors,
      this.insulationConcreteHeight = 0.05,
      this.leanConcreteHeight = 0.10,
      this.stabilizationHeight = 0.30,
      this.elevationTowerArea = 30,
      this.hollowFillingThickness = 0.2
    }
  );

  //Calculations
  Floor get _topMostBasementFloor {

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
  Floor get _groundFloor {
    return floors.firstWhere((e) => e.type == FloorType.z);
  }
  List<Floor> get _basementFloors {
    return floors.where((floor) => floor.type == FloorType.b3 || floor.type == FloorType.b2 || floor.type == FloorType.b1).toList();
  }
  double get _excavationHeight {
    return stabilizationHeight + leanConcreteHeight + insulationConcreteHeight + foundationHeight + _basementsHeight;
  }
  double get _basementsHeight {
    double basementsHeight = 0;
    for (var basementFloor in _basementFloors) {
      basementsHeight += basementFloor.height;
    }
    return basementsHeight;
  }
  double get _roughConstructionArea {
    double roughConstructionArea = 0;
    roughConstructionArea += foundationArea;
    for (var floor in floors) {
      roughConstructionArea += floor.ceilingArea;
    }
    roughConstructionArea += elevationTowerArea;
    return roughConstructionArea;
  }
  double get _wetAreaAboveBasement {
    return _topMostBasementFloor.ceilingArea - _groundFloor.area;
  }
  double get _outerWallArea {
    return floors.map((e) => e.outerWallLength * e.height).toList().fold(0.0, (p, c) => p + c);
  }
  double get _outerWallVolume {
    return _outerWallArea * projectConstants.outerWallThickness;
  }
  double get _innerWallArea {
    return floors.map((e) => e.innerWallLength * e.height).toList().fold(0.0, (p, c) => p + c);
  }
  double get _innerWallVolume {
    return _innerWallArea * projectConstants.innerWallThickness;
  }

  //Final Results
  @override
  double get _totalExcavationSurfaceArea {
    return excavationLength * _excavationHeight;
  }
  @override
  double get _totalExcavationVolume {
    return excavationArea * _excavationHeight;
  }
  @override
  double get _totalBreakerHour {
    return excavationArea * _excavationHeight * projectConstants.breakerHourForOneCubicMeterExcavation;
  }
  @override
  double get _totalStabilizationVolume {
    return excavationArea * stabilizationHeight;
  }
  @override
  double get _totalFillingConcrete {
    return excavationArea * (leanConcreteHeight + insulationConcreteHeight);
  }
  @override
  double get _totalStructuralConcrete {
    return _totalFormWorkArea * projectConstants.concreteCubicMeterForOneSquareMeterFormWork;
  }
  @override
  double get _totalStructuralSteel {
    return _totalStructuralConcrete * projectConstants.rebarTonForOneCubicMeterConcrete;
  }
  @override
  double get _totalFormWorkArea {
    return _roughConstructionArea;
  }
  @override
  double get _totalHollowVolume {
    return projectConstants.hollowAreaForOneSquareMeterConstructionArea * _roughConstructionArea * hollowFillingThickness;
  }
  @override
  double get _foundationWetArea {
    return foundationArea + (foundationLength * (foundationHeight));
  }
  @override
  double get _totalBasementsWetSurfaceArea {
    return _basementCurtainArea + _wetAreaAboveBasement;
  }
  @override
  double get _basementCurtainArea {
    return _basementFloors.map((e) => e.height * e.ceilingLength).toList().fold(0.0, (p, c) => p + c);
  }
  @override
  double get _totalWallVolume {
    return _outerWallVolume + _innerWallVolume;
  }
  @override
  double get _totalWallArea {
    return _outerWallArea + _innerWallArea;
  }
}