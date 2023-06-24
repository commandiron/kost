import 'package:kost/domain/calculator/detailed/project_constants.dart';

import '../quantity_calculator.dart';
import 'floor.dart';

class DetailedQuantityCalculator extends QuantityCalculator {
  final ProjectConstants projectConstants;
  final double excavationLength;
  final double excavationArea;
  final double coreCurtainLength;
  final double curtainsExceeding1MeterLength;
  final double elevationTowerArea;
  final double elevationTowerHeightWithoutSlab;
  final List<Floor> floors;
  final double foundationArea;
  final double foundationLength;
  final double foundationHeight;
  final double insulationConcreteHeight;
  final double leanConcreteHeight;
  final double stabilizationHeight;
  final double hollowFillingThickness;

  DetailedQuantityCalculator(
    {
      required this.projectConstants,
      required this.excavationLength,
      required this.excavationArea,
      required this.coreCurtainLength,
      required this.curtainsExceeding1MeterLength,
      required this.elevationTowerArea,
      required this.elevationTowerHeightWithoutSlab,
      required this.floors,
      required this.foundationArea,
      required this.foundationLength,
      required this.foundationHeight,
      this.insulationConcreteHeight = 0.05,
      this.leanConcreteHeight = 0.10,
      this.stabilizationHeight = 0.30,
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
  Floor get _topFloor {
    return floors.first;
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
  double get _basementsOuterCurtainAreaWithoutSlab {
    double resultArea = 0;
    for (var basementFloor in _basementFloors) {
      resultArea += basementFloor.length * basementFloor.heightWithoutSlab;
    }
    return resultArea;
  }
  double get _basementsOuterCurtainArea {
    double resultArea = 0;
    for (var basementFloor in _basementFloors) {
      resultArea += basementFloor.length * basementFloor.fullHeight;
    }
    return resultArea;
  }
  double get _wetAreaAboveBasement {
    return _topMostBasementFloor.ceilingArea - _groundFloor.area;
  }
  double get _outerWallArea {
    return floors.map((e) => e.outerWallLength * e.heightWithoutSlab).toList().fold(0.0, (p, c) => p + c);
  }
  double get _outerWallVolume {
    return _outerWallArea * projectConstants.outerWallThickness;
  }
  double get _innerWallArea {
    return floors.map((e) => e.innerWallLength * e.heightWithoutSlab).toList().fold(0.0, (p, c) => p + c);
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
  String get totalExcavationSurfaceAreaExplanation {
    return "Hafriyat uzunluğu: $excavationLength x Hafriyat yüksekliği: $_excavationHeight";
  }

  @override
  double get totalExcavationVolume {
    return excavationArea * _excavationHeight;
  }
  @override
  String get totalExcavationVolumeExplanation {
    return "Hafriyat alanı: $excavationArea x Hafriyat yüksekliği: $_excavationHeight";
  }

  @override
  double get totalBreakerHour {
    return excavationArea * _excavationHeight * projectConstants.breakerHourForOneCubicMeterMediumRockExcavation;
  }
  @override
  String get totalBreakerHourExplanation {
    return "Hafriyat alanı: $excavationArea x Hafriyat yüksekliği: $_excavationHeight x Bir m3 orta sertlikte kaya içeren hafriyat için kırıcı çalışma süresi: ${projectConstants.breakerHourForOneCubicMeterMediumRockExcavation}";
  }

  @override
  double get totalStabilizationVolume {
    return excavationArea * stabilizationHeight;
  }
  @override
  String get totalStabilizationVolumeExplanation {
    return "Hafriyat alanı: $excavationArea x Temel altı stabilizasyon malzemesi yüksekliği: $stabilizationHeight";
  }

  @override
  double get totalFillingConcreteVolume {
    return excavationArea * (leanConcreteHeight + insulationConcreteHeight);
  }
  @override
  String get totalFillingConcreteVolumeExplanation {
    return "Hafriyat alanı: $excavationArea x (Grobeton yüksekliği: $leanConcreteHeight + Yalıtım koruma betonu yüksekliği: $insulationConcreteHeight)";
  }

  @override
  double get totalFormWorkArea {
    return _roughConstructionArea + _coreCurtainArea + _curtainsExceeding1MeterArea + _basementsOuterCurtainAreaWithoutSlab;
  }
  @override
  String get totalFormWorkAreaExplanation {
    return "Kaba inşaat alanı: $_roughConstructionArea + Çekirdek perdesi alanı: $_coreCurtainArea + 1 metreyi geçen perdelerin alanı: $_curtainsExceeding1MeterArea + Bodrum dış perdeleri alanı: $_basementsOuterCurtainAreaWithoutSlab";
  }

  @override
  double get totalStructuralConcreteVolume {
    return totalFormWorkArea * projectConstants.concreteCubicMeterForOneSquareMeterFormWork;
  }
  @override
  String get totalStructuralConcreteVolumeExplanation {
    return "Kalıp alanı (Düz ölçü): $totalFormWorkArea x 1 m2 kalıp için m3 biriminde beton hacmi: ${projectConstants.concreteCubicMeterForOneSquareMeterFormWork}";
  }

  @override
  double get totalStructuralSteelWeight {
    return totalStructuralConcreteVolume * projectConstants.rebarTonForOneCubicMeterConcrete;
  }
  @override
  String get totalStructuralSteelWeightExplanation {
    return "Beton hacmi: $totalStructuralConcreteVolume x 1 m3 beton için ton biriminde demir ağırlığı: ${projectConstants.rebarTonForOneCubicMeterConcrete}";
  }

  @override
  double get totalHollowVolume {
    return projectConstants.hollowAreaForOneSquareMeterConstructionArea * _roughConstructionArea * hollowFillingThickness;
  }
  @override
  String get totalHollowVolumeExplanation {
    return "1 m2 kaba inşaat alanı için m2 biriminde asmolen alanı: ${projectConstants.hollowAreaForOneSquareMeterConstructionArea} x Kaba inşaat alanı: $_roughConstructionArea x Asmolen kalınlığı: $hollowFillingThickness";
  }

  @override
  double get totalFoundationWetArea {
    return foundationArea + (foundationLength * foundationHeight);
  }
  @override
  String get totalFoundationWetAreaExplanation {
    return "Temel alanı: $foundationArea + (Temel uzunluğu: $foundationLength x Temel yüksekliği: $foundationHeight)";
  }

  @override
  double get totalBasementsWetSurfaceArea {
    return _basementsOuterCurtainArea + _wetAreaAboveBasement;
  }
  @override
  String get totalBasementsWetSurfaceAreaExplanation {
    return "Bodrum dış perdesi ıslak alanı: $_basementsOuterCurtainArea + Bodrum üstü ıslak alanı: $_wetAreaAboveBasement";
  }

  @override
  double get totalBasementsWetCurtainArea {
    return _basementsOuterCurtainArea;
  }
  @override
  String get totalBasementsWetCurtainAreaExplanation {
    return "Bodrum dış perdesi ıslak alanı: $_basementsOuterCurtainArea";
  }

  @override
  double get totalWallVolume {
    return _outerWallVolume + _innerWallVolume;
  }
  @override
  String get totalWallVolumeExplanation {
    return "Dış duvar hacmi (kalınlık: ${projectConstants.outerWallThickness}): $_outerWallVolume + İç duvar hacmi(kalınlık: ${projectConstants.innerWallThickness}): $_innerWallVolume";
  }

  @override
  double get totalWallArea {
    return _outerWallArea + _innerWallArea;
  }
  @override
  String get totalWallAreaExplanation {
    return "Dış duvar alanı: $_outerWallArea + İç duvar alanı: $_innerWallArea";
  }

  @override
  double get totalRoofArea {
   return _topFloor.ceilingArea;
  }
  @override
  String get totalRoofAreaExplanation {
   return "En üst kat tavan alanı: ${_topFloor.ceilingArea}";
  }
}