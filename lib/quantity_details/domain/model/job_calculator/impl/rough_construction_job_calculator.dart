import 'package:kost/quantity_details/domain/model/project_constants.dart';
import 'package:kost/quantity_details/domain/model/project_variables.dart';

import '../../floor/floor.dart';
import '../../../../../common/model/job.dart';
import '../job_calculator.dart';

class RoughConstructionJobCalculator extends JobCalculator {
  RoughConstructionJobCalculator(
      {super.name = "Kaba İnşaat Maliyeti",
      required this.projectConstants,
      required this.projectVariables,
      required this.floors});

  final ProjectConstants projectConstants;
  final ProjectVariables projectVariables;
  final List<Floor> floors;

  @override
  List<Job> createJobs() {
    return [
      Shoring(
        quantity: shoringArea,
        quantityExplanation: shoringAreaExplanation,
      ),
      Excavation(
        quantity: excavationVolume,
        quantityExplanation: excavationVolumeExplanation,
      ),
      Breaker(
        quantity: breakerHour,
        quantityExplanation: breakerHourExplanation,
      ),
      FoundationStabilization(
        quantity: foundationStabilizationWeight,
        quantityExplanation: foundationStabilizationWeightExplanation,
      ),
      SubFoundationConcreteMaterial(
        quantity: subFoundationConcreteVolume,
        quantityExplanation: subFoundationConcreteVolumeExplanation,
      ),
      ReinforcedConcreteWorkmanshipWithFormWorkMaterial(
        quantity: formWorkArea,
        quantityExplanation: formWorkAreaExplanation,
      ),
      ConcreteMaterial(
        quantity: concreteVolume,
        quantityExplanation: concreteVolumeExplanation,
      ),
      RebarMaterial(
        quantity: rebarWeight,
        quantityExplanation: rebarWeightExplanation,
      ),
      HollowFloorFillingMaterial(
        quantity: hollowFloorFillingVolume,
        quantityExplanation: hollowFloorFillingVolumeExplanation,
      ),
      FoundationWaterproofing(
        quantity: foundationWaterProofingArea,
        quantityExplanation: foundationWaterProofingAreaExplanation,
      ),
      CurtainWaterproofing(
        quantity: curtainWaterProofingArea,
        quantityExplanation: curtainWaterProofingAreaExplanation,
      ),
      CurtainProtectionBeforeFilling(
        quantity: curtainProtectionBeforeFillingArea,
        quantityExplanation: curtainProtectionBeforeFillingAreaExplanation,
      ),
      Wall(
        quantity: wallMaterialVolume,
        quantityExplanation: wallMaterialVolumeExplanation,
      ),
      WallWorkmanShip(
        quantity: wallWorkmanShipArea,
        quantityExplanation: wallWorkmanShipAreaExplanation,
      ),
    ];
  }

  List<Floor> get _basementFloors {
    final basementFloors = floors.where((element) => element.no < 0).toList();
    if (basementFloors.isEmpty) {
      throw Exception("No basement floor");
    }
    return basementFloors;
  }

  double get _basementsHeight {
    return _basementFloors
        .map((floor) => floor.heightWithSlab)
        .fold(0.0, (p, c) => p + c);
  }

  double get _excavationHeight {
    return projectConstants.stabilizationHeight +
        projectConstants.leanConcreteHeight +
        projectConstants.insulationConcreteHeight +
        projectConstants.foundationHeight +
        _basementsHeight;
  }

  Floor get _topFloor {
    final topFloor = floors.reduce((current, next) {
      return current.no > next.no ? current : next;
    });
    return topFloor;
  }

  double get _roughConstructionArea {
    double roughConstructionArea = 0;
    for (var floor in floors) {
      if (floor.no == 0) {
        roughConstructionArea +=
            floors.firstWhere((floor) => floor.no == -1).area;
      } else {
        roughConstructionArea += floor.area;
      }
    }
    roughConstructionArea += _topFloor.area;
    roughConstructionArea += projectVariables.elevationTowerArea;
    return roughConstructionArea;
  }

  double get _buildingHeightWithoutSlabs {
    return floors
        .map((floor) => floor.heightWithSlab - floor.slabHeight)
        .fold(0.0, (p, c) => p + c);
  }

  double get _coreCurtainAreaWithoutSlab {
    return projectVariables.coreCurtainLength *
        (_buildingHeightWithoutSlabs +
            projectVariables.elevationTowerHeightWithoutSlab);
  }

  double get _curtainsExceeding1MeterAreaWithoutSlab {
    return projectVariables.curtainsExceeding1MeterLength *
        _buildingHeightWithoutSlabs;
  }

  double get _basementsHeightWithoutSlab {
    return _basementFloors
        .map((floor) => floor.heightWithSlab - floor.slabHeight)
        .fold(0.0, (p, c) => p + c);
  }

  double get _basementsCurtainAreaWithoutSlab {
    return projectVariables.basementCurtainLength * _basementsHeightWithoutSlab;
  }

  double get _hollowSlabRoughConstructionArea {
    return floors
        .where((floor) => floor.isHollowSlab)
        .map((ceilingSlabFloor) => ceilingSlabFloor.area)
        .fold(0.0, (p, c) => p + c);
  }

  double get _basementsOuterCurtainArea {
    return _basementFloors
        .map((floor) => floor.perimeter * floor.heightWithSlab)
        .fold(0.0, (p, c) => p + c);
  }

  Floor get _topMostBasementFloor {
    final topMostBasementFloor = _basementFloors.reduce((current, next) {
      return current.no > next.no ? current : next;
    });
    return topMostBasementFloor;
  }

  Floor get _bottomMostBasementFloor {
    final bottomMostBasementFloor = _basementFloors.reduce((current, next) {
      return current.no < next.no ? current : next;
    });
    return bottomMostBasementFloor;
  }

  Floor get _groundFloor {
    final groundFloor = floors.firstWhere(
      (floor) => floor.no == 0,
      orElse: () => throw Exception("No ground floor"),
    );
    return groundFloor;
  }

  double get _wetAreaAboveBasement {
    return _topMostBasementFloor.area - _groundFloor.area;
  }

  double get _thickWallArea {
    return floors
        .map((floor) =>
            floor.thickWallLength * (floor.heightWithSlab - floor.slabHeight))
        .fold(0.0, (p, c) => p + c);
  }

  double get _thickWallVolume {
    return _thickWallArea * projectConstants.thickWallThickness;
  }

  double get _thinWallArea {
    return floors
        .map((floor) =>
            floor.thinWallLength * (floor.heightWithSlab - floor.slabHeight))
        .fold(0.0, (p, c) => p + c);
  }

  double get _thinWallVolume {
    return _thinWallArea * projectConstants.thinWallThickness;
  }

  //Calculations
  double get shoringArea {
    return projectVariables.excavationPerimeter * _excavationHeight;
  }

  String get shoringAreaExplanation {
    return "Hafriyat çevre uzunluğu: ${projectVariables.excavationPerimeter} x Hafriyat yüksekliği: $_excavationHeight";
  }

  double get excavationVolume {
    return projectVariables.excavationArea * _excavationHeight;
  }

  String get excavationVolumeExplanation {
    return "Hafriyat alanı: ${projectVariables.excavationArea} x Hafriyat yüksekliği: $_excavationHeight";
  }

  double get breakerHour {
    return projectVariables.excavationArea *
        _excavationHeight *
        projectConstants.breakerHourForOneCubicMeterMediumRockExcavation;
  }

  String get breakerHourExplanation {
    return "Hafriyat alanı: ${projectVariables.excavationArea} x Hafriyat yüksekliği: $_excavationHeight x Bir m3 orta sertlikte kaya içeren hafriyat için kırıcı çalışma süresi: ${projectConstants.breakerHourForOneCubicMeterMediumRockExcavation}";
  }

  double get foundationStabilizationWeight {
    return projectVariables.excavationArea *
        projectConstants.stabilizationHeight *
        projectConstants.gravelTonForOneCubicMeter;
  }

  String get foundationStabilizationWeightExplanation {
    return "Hafriyat alanı: ${projectVariables.excavationArea} x Temel altı stabilizasyon malzemesi yüksekliği: ${projectConstants.stabilizationHeight} x 1 m3 mıcır: ${projectConstants.gravelTonForOneCubicMeter} ton";
  }

  double get subFoundationConcreteVolume {
    return projectVariables.excavationArea *
        (projectConstants.leanConcreteHeight +
            projectConstants.insulationConcreteHeight);
  }

  String get subFoundationConcreteVolumeExplanation {
    return "Hafriyat alanı: ${projectVariables.excavationArea} x (Grobeton yüksekliği: ${projectConstants.leanConcreteHeight} + Yalıtım koruma betonu yüksekliği: ${projectConstants.insulationConcreteHeight})";
  }

  double get formWorkArea {
    return _roughConstructionArea +
        _coreCurtainAreaWithoutSlab +
        _curtainsExceeding1MeterAreaWithoutSlab +
        _basementsCurtainAreaWithoutSlab;
  }

  String get formWorkAreaExplanation {
    return "Kaba inşaat alanı: $_roughConstructionArea + Çekirdek perdesi alanı: $_coreCurtainAreaWithoutSlab + 1 metreyi geçen perdelerin alanı: $_curtainsExceeding1MeterAreaWithoutSlab + Bodrum perdeleri alanı: $_basementsCurtainAreaWithoutSlab";
  }

  double get concreteVolume {
    return formWorkArea *
        projectConstants.concreteCubicMeterForOneSquareMeterFormWork;
  }

  String get concreteVolumeExplanation {
    return "Kalıp alanı (Düz ölçü): $formWorkArea x 1 m2 kalıp için m3 biriminde beton hacmi: ${projectConstants.concreteCubicMeterForOneSquareMeterFormWork}";
  }

  double get rebarWeight {
    return concreteVolume * projectConstants.rebarTonForOneCubicMeterConcrete;
  }

  String get rebarWeightExplanation {
    return "Beton hacmi: $concreteVolume x 1 m3 beton için ton biriminde demir ağırlığı: ${projectConstants.rebarTonForOneCubicMeterConcrete}";
  }

  double get hollowFloorFillingVolume {
    return projectConstants.hollowAreaForOneSquareMeterConstructionArea *
        _hollowSlabRoughConstructionArea *
        projectConstants.hollowFillingThickness;
  }

  String get hollowFloorFillingVolumeExplanation {
    return "1 m2 kaba inşaat alanı için m2 biriminde asmolen alanı: ${projectConstants.hollowAreaForOneSquareMeterConstructionArea} x Asmolen döşeme inşaat alanı: $_hollowSlabRoughConstructionArea x Asmolen kalınlığı: ${projectConstants.hollowFillingThickness}";
  }

  double get foundationWaterProofingArea {
    return _bottomMostBasementFloor.area +
        (_bottomMostBasementFloor.perimeter *
            projectConstants.foundationHeight);
  }

  String get foundationWaterProofingAreaExplanation {
    return "En alt bodrum alanı: ${_bottomMostBasementFloor.area} + (En alt bodrum çevre uzunluğu: ${_bottomMostBasementFloor.perimeter} x Temel yüksekliği: ${projectConstants.foundationHeight})";
  }

  double get curtainWaterProofingArea {
    return _basementsOuterCurtainArea + _wetAreaAboveBasement;
  }

  String get curtainWaterProofingAreaExplanation {
    return "Bodrum dış perdesi ıslak alanı: $_basementsOuterCurtainArea + Bodrum üstü ıslak alanı: $_wetAreaAboveBasement";
  }

  double get curtainProtectionBeforeFillingArea {
    return _basementsOuterCurtainArea;
  }

  String get curtainProtectionBeforeFillingAreaExplanation {
    return "Bodrum dış perdesi ıslak alanı: $_basementsOuterCurtainArea";
  }

  double get wallMaterialVolume {
    return _thickWallVolume + _thinWallVolume;
  }

  String get wallMaterialVolumeExplanation {
    return "Kalın duvar hacmi (kalınlık: ${projectConstants.thickWallThickness}): $_thickWallVolume + İnce duvar hacmi(kalınlık: ${projectConstants.thinWallThickness}): $_thinWallVolume";
  }

  double get wallWorkmanShipArea {
    return _thickWallArea + _thinWallArea;
  }

  String get wallWorkmanShipAreaExplanation {
    return "Kalın duvar alanı: $_thickWallArea + İnce duvar alanı: $_thinWallArea";
  }
}
