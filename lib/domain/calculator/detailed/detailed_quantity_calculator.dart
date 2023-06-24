import 'package:kost/domain/calculator/detailed/project_constants.dart';

import '../quantity_calculator.dart';
import 'floor.dart';

class DetailedQuantityCalculator extends QuantityCalculator {
  final ProjectConstants projectConstants;
  final double excavationLength;
  final double excavationArea;
  final double coreCurtainLength;
  final double curtainsExceeding1MeterLength;
  final List<Floor> floors;
  final double foundationArea;
  final double foundationLength;
  final double foundationHeight;
  final double insulationConcreteHeight;
  final double leanConcreteHeight;
  final double stabilizationHeight;
  final double elevationTowerArea;
  final double elevationTowerHeightWithoutSlab;
  final double hollowFillingThickness;

  DetailedQuantityCalculator(
    {
      required this.projectConstants,
      required this.excavationLength,
      required this.excavationArea,
      required this.coreCurtainLength,
      required this.curtainsExceeding1MeterLength,
      required this.floors,
      required this.foundationArea,
      required this.foundationLength,
      required this.foundationHeight,
      this.insulationConcreteHeight = 0.05,
      this.leanConcreteHeight = 0.10,
      this.stabilizationHeight = 0.30,
      this.elevationTowerArea = 30,
      this.elevationTowerHeightWithoutSlab = 3,
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
      basementsHeight += basementFloor.fullHeight;
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
  double get _buildingHeightWithoutSlabs {
    return floors.map((e) => e.heightWithoutSlab).toList().fold(0.0, (p, c) => p + c);
  }
  double get _coreCurtainArea {
    return coreCurtainLength * (_buildingHeightWithoutSlabs + elevationTowerHeightWithoutSlab);
  }
  double get _curtainsExceeding1MeterArea {
    return curtainsExceeding1MeterLength * _buildingHeightWithoutSlabs;
  }
  double get _basementsOuterCurtainArea {
    double resultArea = 0;
    for (var basementFloor in _basementFloors) {
      resultArea += basementFloor.length * basementFloor.heightWithoutSlab;
    }
    return resultArea;
  }
  double get _wetAreaAboveBasement {
    return _topMostBasementFloor.ceilingArea - _groundFloor.area;
  }
  double get _outerWallArea {
    return floors.map((e) => e.outerWallLength * e.fullHeight).toList().fold(0.0, (p, c) => p + c);
  }
  double get _outerWallVolume {
    return _outerWallArea * projectConstants.outerWallThickness;
  }
  double get _innerWallArea {
    return floors.map((e) => e.innerWallLength * e.fullHeight).toList().fold(0.0, (p, c) => p + c);
  }
  double get _innerWallVolume {
    return _innerWallArea * projectConstants.innerWallThickness;
  }

  //Final Results
  @override
  double get totalExcavationSurfaceArea {
    return excavationLength * _excavationHeight;
  }
  @override
  double get totalExcavationVolume {
    return excavationArea * _excavationHeight;
  }
  @override
  double get totalBreakerHour {
    return excavationArea * _excavationHeight * projectConstants.breakerHourForOneCubicMeterExcavation;
  }
  @override
  double get totalStabilizationVolume {
    return excavationArea * stabilizationHeight;
  }
  @override
  double get totalFillingConcreteVolume {
    return excavationArea * (leanConcreteHeight + insulationConcreteHeight);
  }
  @override
  double get totalStructuralConcreteVolume {
    return totalFormWorkArea * projectConstants.concreteCubicMeterForOneSquareMeterFormWork;
  }
  @override
  double get totalStructuralSteelWeight {
    return totalStructuralConcreteVolume * projectConstants.rebarTonForOneCubicMeterConcrete;
  }
  @override
  double get totalFormWorkArea {
    return _roughConstructionArea + _coreCurtainArea + _curtainsExceeding1MeterArea + _basementsOuterCurtainArea; //Toplam Perde alanı eklenecek.
  }
  @override
  double get totalHollowVolume {
    return projectConstants.hollowAreaForOneSquareMeterConstructionArea * _roughConstructionArea * hollowFillingThickness;
  }
  @override
  double get totalFoundationWetArea {
    return foundationArea + (foundationLength * foundationHeight);
  }
  @override
  double get totalBasementsWetSurfaceArea {
    return totalBasementsCurtainArea + _wetAreaAboveBasement;
  }
  @override
  double get totalBasementsCurtainArea {
    return _basementFloors.map((e) => e.fullHeight * e.ceilingLength).toList().fold(0.0, (p, c) => p + c);
  }
  @override
  double get totalWallVolume {
    return _outerWallVolume + _innerWallVolume;
  }
  @override
  double get totalWallArea {
    return _outerWallArea + _innerWallArea;
  }
}