import 'package:collection/collection.dart';
import 'package:kost/quantity_details/domain/model/calculator/project_constants.dart';
import 'package:kost/quantity_details/domain/model/calculator/room.dart';
import '../../../../cost_table/domain/model/unit_price/unit_price.dart';
import '../job.dart';
import '../../../../../quantity_details/domain/model/calculator/floor.dart';

abstract class JobCalculator {
  final String name;
  final ProjectConstants projectConstants;
  final double landArea;
  final double landPerimeter;
  final double excavationArea;
  final double excavationPerimeter;
  final double coreCurtainLength;
  final double curtainsExceeding1MeterLength;
  final double basementCurtainLength;
  final double columnsLess1MeterPerimeter;
  final double elevationTowerArea;
  final double elevationTowerHeightWithoutSlab;
  List<Floor> floors;
  final double foundationArea;
  final double foundationPerimeter;
  final double foundationHeight;

  JobCalculator({
    required this.name,
    required this.projectConstants,
    required this.landArea,
    required this.landPerimeter,
    required this.excavationArea,
    required this.excavationPerimeter,
    required this.coreCurtainLength,
    required this.curtainsExceeding1MeterLength,
    required this.basementCurtainLength,
    required this.columnsLess1MeterPerimeter,
    required this.elevationTowerArea,
    required this.elevationTowerHeightWithoutSlab,
    required this.floors,
    required this.foundationArea,
    required this.foundationPerimeter,
    required this.foundationHeight,
  }) {
    sortFloors();
  }

  void sortFloors() {
    floors = floors.sorted((a, b) => a.no.compareTo(b.no)).reversed.toList();
  }

  JobCalculator get newInstance;

  List<Job> createJobs();
}

class ApartmentJobsCalculator extends JobCalculator {
  ApartmentJobsCalculator(
      {super.name = "Apartman Maliyeti",
      required super.projectConstants,
      required super.landArea,
      required super.landPerimeter,
      required super.excavationArea,
      required super.excavationPerimeter,
      required super.coreCurtainLength,
      required super.curtainsExceeding1MeterLength,
      required super.basementCurtainLength,
      required super.columnsLess1MeterPerimeter,
      required super.elevationTowerArea,
      required super.elevationTowerHeightWithoutSlab,
      required super.floors,
      required super.foundationArea,
      required super.foundationPerimeter,
      required super.foundationHeight});

  @override
  JobCalculator get newInstance {
    return ApartmentJobsCalculator(
        projectConstants: projectConstants,
        landArea: landArea,
        landPerimeter: landPerimeter,
        excavationArea: excavationArea,
        excavationPerimeter: excavationPerimeter,
        coreCurtainLength: coreCurtainLength,
        curtainsExceeding1MeterLength: curtainsExceeding1MeterLength,
        basementCurtainLength: basementCurtainLength,
        columnsLess1MeterPerimeter: columnsLess1MeterPerimeter,
        elevationTowerArea: elevationTowerArea,
        elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab,
        floors: floors,
        foundationArea: foundationArea,
        foundationPerimeter: foundationPerimeter,
        foundationHeight: foundationHeight);
  }

  @override
  List<Job> createJobs() {
    final roughConstructionQuantityCalculator = RoughConstructionJobsCalculator(
        projectConstants: projectConstants,
        landArea: landArea,
        landPerimeter: landPerimeter,
        excavationArea: excavationArea,
        excavationPerimeter: excavationPerimeter,
        coreCurtainLength: coreCurtainLength,
        curtainsExceeding1MeterLength: curtainsExceeding1MeterLength,
        basementCurtainLength: basementCurtainLength,
        columnsLess1MeterPerimeter: columnsLess1MeterPerimeter,
        elevationTowerArea: elevationTowerArea,
        elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab,
        floors: floors,
        foundationArea: foundationArea,
        foundationPerimeter: foundationPerimeter,
        foundationHeight: foundationHeight);
    final roofQuantityCalculator = RoofJobsCalculator(
        projectConstants: projectConstants,
        landArea: landArea,
        landPerimeter: landPerimeter,
        excavationArea: excavationArea,
        excavationPerimeter: excavationPerimeter,
        coreCurtainLength: coreCurtainLength,
        curtainsExceeding1MeterLength: curtainsExceeding1MeterLength,
        basementCurtainLength: basementCurtainLength,
        columnsLess1MeterPerimeter: columnsLess1MeterPerimeter,
        elevationTowerArea: elevationTowerArea,
        elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab,
        floors: floors,
        foundationArea: foundationArea,
        foundationPerimeter: foundationPerimeter,
        foundationHeight: foundationHeight);
    final interiorQuantityCalculator = InteriorJobsCalculator(
        projectConstants: projectConstants,
        landArea: landArea,
        landPerimeter: landPerimeter,
        excavationArea: excavationArea,
        excavationPerimeter: excavationPerimeter,
        coreCurtainLength: coreCurtainLength,
        curtainsExceeding1MeterLength: curtainsExceeding1MeterLength,
        basementCurtainLength: basementCurtainLength,
        columnsLess1MeterPerimeter: columnsLess1MeterPerimeter,
        elevationTowerArea: elevationTowerArea,
        elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab,
        floors: floors,
        foundationArea: foundationArea,
        foundationPerimeter: foundationPerimeter,
        foundationHeight: foundationHeight);
    final landscapeQuantityCalculator = LandscapeJobsCalculator(
        projectConstants: projectConstants,
        landArea: landArea,
        landPerimeter: landPerimeter,
        excavationArea: excavationArea,
        excavationPerimeter: excavationPerimeter,
        coreCurtainLength: coreCurtainLength,
        curtainsExceeding1MeterLength: curtainsExceeding1MeterLength,
        basementCurtainLength: basementCurtainLength,
        columnsLess1MeterPerimeter: columnsLess1MeterPerimeter,
        elevationTowerArea: elevationTowerArea,
        elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab,
        floors: floors,
        foundationArea: foundationArea,
        foundationPerimeter: foundationPerimeter,
        foundationHeight: foundationHeight);
    final generalExpensesQuantityCalculator = GeneralExpensesJobsCalculator(
        projectConstants: projectConstants,
        landArea: landArea,
        landPerimeter: landPerimeter,
        excavationArea: excavationArea,
        excavationPerimeter: excavationPerimeter,
        coreCurtainLength: coreCurtainLength,
        curtainsExceeding1MeterLength: curtainsExceeding1MeterLength,
        basementCurtainLength: basementCurtainLength,
        columnsLess1MeterPerimeter: columnsLess1MeterPerimeter,
        elevationTowerArea: elevationTowerArea,
        elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab,
        floors: floors,
        foundationArea: foundationArea,
        foundationPerimeter: foundationPerimeter,
        foundationHeight: foundationHeight);
    return [
      ...roughConstructionQuantityCalculator.createJobs(),
      ...roofQuantityCalculator.createJobs(),
      ...interiorQuantityCalculator.createJobs(),
      ...landscapeQuantityCalculator.createJobs(),
      ...generalExpensesQuantityCalculator.createJobs()
    ];
  }
}

class RoughConstructionJobsCalculator extends JobCalculator {
  RoughConstructionJobsCalculator({
    super.name = "Kaba İnşaat Maliyeti",
    required super.projectConstants,
    required super.landArea,
    required super.landPerimeter,
    required super.excavationArea,
    required super.excavationPerimeter,
    required super.coreCurtainLength,
    required super.curtainsExceeding1MeterLength,
    required super.basementCurtainLength,
    required super.columnsLess1MeterPerimeter,
    required super.elevationTowerArea,
    required super.elevationTowerHeightWithoutSlab,
    required super.floors,
    required super.foundationArea,
    required super.foundationPerimeter,
    required super.foundationHeight,
  });

  @override
  JobCalculator get newInstance {
    return RoughConstructionJobsCalculator(
        projectConstants: projectConstants,
        landArea: landArea,
        landPerimeter: landPerimeter,
        excavationArea: excavationArea,
        excavationPerimeter: excavationPerimeter,
        coreCurtainLength: coreCurtainLength,
        curtainsExceeding1MeterLength: curtainsExceeding1MeterLength,
        basementCurtainLength: basementCurtainLength,
        columnsLess1MeterPerimeter: columnsLess1MeterPerimeter,
        elevationTowerArea: elevationTowerArea,
        elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab,
        floors: floors,
        foundationArea: foundationArea,
        foundationPerimeter: foundationPerimeter,
        foundationHeight: foundationHeight);
  }

  @override
  List<Job> createJobs() {
    return [
      Shoring(
          quantity: shoringArea, quantityExplanation: shoringAreaExplanation),
      Excavation(
          quantity: excavationVolume,
          quantityExplanation: excavationVolumeExplanation),
      Breaker(
          quantity: breakerHour, quantityExplanation: breakerHourExplanation),
      FoundationStabilization(
          quantity: foundationStabilizationWeight,
          quantityExplanation: foundationStabilizationWeightExplanation),
      SubFoundationConcreteMaterial(
          quantity: subFoundationConcreteVolume,
          quantityExplanation: subFoundationConcreteVolumeExplanation),
      ReinforcedConcreteWorkmanshipWithFormWorkMaterial(
          quantity: formWorkArea, quantityExplanation: formWorkAreaExplanation),
      ConcreteMaterial(
          quantity: concreteVolume,
          quantityExplanation: concreteVolumeExplanation),
      RebarMaterial(
          quantity: rebarWeight, quantityExplanation: rebarWeightExplanation),
      HollowFloorFillingMaterial(
          quantity: hollowFloorFillingVolume,
          quantityExplanation: hollowFloorFillingVolumeExplanation),
      FoundationWaterproofing(
          quantity: foundationWaterProofingArea,
          quantityExplanation: foundationWaterProofingAreaExplanation),
      CurtainWaterproofing(
          quantity: curtainWaterProofingArea,
          quantityExplanation: curtainWaterProofingAreaExplanation),
      CurtainProtectionBeforeFilling(
          quantity: curtainProtectionBeforeFillingArea,
          quantityExplanation: curtainProtectionBeforeFillingAreaExplanation),
      Wall(
          quantity: wallMaterialVolume,
          quantityExplanation: wallMaterialVolumeExplanation),
      WallWorkmanShip(
          quantity: wallWorkmanShipArea,
          quantityExplanation: wallWorkmanShipAreaExplanation),
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
        .map((floor) => floor.fullHeight)
        .fold(0.0, (p, c) => p + c);
  }

  double get _excavationHeight {
    return projectConstants.stabilizationHeight +
        projectConstants.leanConcreteHeight +
        projectConstants.insulationConcreteHeight +
        foundationHeight +
        _basementsHeight;
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
    return floors
        .map((floor) => floor.heightWithoutSlab)
        .fold(0.0, (p, c) => p + c);
  }

  double get _coreCurtainAreaWithoutSlab {
    return coreCurtainLength *
        (_buildingHeightWithoutSlabs + elevationTowerHeightWithoutSlab);
  }

  double get _curtainsExceeding1MeterAreaWithoutSlab {
    return curtainsExceeding1MeterLength * _buildingHeightWithoutSlabs;
  }

  double get _basementsHeightWithoutSlab {
    return _basementFloors
        .map((floor) => floor.heightWithoutSlab)
        .fold(0.0, (p, c) => p + c);
  }

  double get _basementsCurtainAreaWithoutSlab {
    return basementCurtainLength * _basementsHeightWithoutSlab;
  }

  double get _hollowSlabRoughConstructionArea {
    return floors
        .where((floor) => floor.isCeilingHollowSlab)
        .map((ceilingSlabFloor) => ceilingSlabFloor.ceilingArea)
        .fold(0.0, (p, c) => p + c);
  }

  double get _basementsOuterCurtainArea {
    return _basementFloors
        .map((floor) => floor.perimeter * floor.fullHeight)
        .fold(0.0, (p, c) => p + c);
  }

  Floor get _topMostBasementFloor {
    final topMostBasementFloor = _basementFloors.reduce((current, next) {
      return current.no > next.no ? current : next;
    });
    return topMostBasementFloor;
  }

  Floor get _groundFloor {
    final groundFloor = floors.firstWhere(
      (floor) => floor.no == 0,
      orElse: () => throw Exception("No ground floor"),
    );
    return groundFloor;
  }

  double get _wetAreaAboveBasement {
    return _topMostBasementFloor.ceilingArea - _groundFloor.area;
  }

  double get _thickWallArea {
    return floors
        .map((floor) => floor.thickWallLength * floor.heightWithoutSlab)
        .fold(0.0, (p, c) => p + c);
  }

  double get _thickWallVolume {
    return _thickWallArea * projectConstants.thickWallThickness;
  }

  double get _thinWallArea {
    return floors
        .map((floor) => floor.thinWallLength * floor.heightWithoutSlab)
        .fold(0.0, (p, c) => p + c);
  }

  double get _thinWallVolume {
    return _thinWallArea * projectConstants.thinWallThickness;
  }

  //Calculations
  double get shoringArea {
    return excavationPerimeter * _excavationHeight;
  }

  String get shoringAreaExplanation {
    return "Hafriyat çevre uzunluğu: $excavationPerimeter x Hafriyat yüksekliği: $_excavationHeight";
  }

  double get excavationVolume {
    return excavationArea * _excavationHeight;
  }

  String get excavationVolumeExplanation {
    return "Hafriyat alanı: $excavationArea x Hafriyat yüksekliği: $_excavationHeight";
  }

  double get breakerHour {
    return excavationArea *
        _excavationHeight *
        projectConstants.breakerHourForOneCubicMeterMediumRockExcavation;
  }

  String get breakerHourExplanation {
    return "Hafriyat alanı: $excavationArea x Hafriyat yüksekliği: $_excavationHeight x Bir m3 orta sertlikte kaya içeren hafriyat için kırıcı çalışma süresi: ${projectConstants.breakerHourForOneCubicMeterMediumRockExcavation}";
  }

  double get foundationStabilizationWeight {
    return excavationArea *
        projectConstants.stabilizationHeight *
        projectConstants.gravelTonForOneCubicMeter;
  }

  String get foundationStabilizationWeightExplanation {
    return "Hafriyat alanı: $excavationArea x Temel altı stabilizasyon malzemesi yüksekliği: ${projectConstants.stabilizationHeight} x 1 m3 mıcır: ${projectConstants.gravelTonForOneCubicMeter} ton";
  }

  double get subFoundationConcreteVolume {
    return excavationArea *
        (projectConstants.leanConcreteHeight +
            projectConstants.insulationConcreteHeight);
  }

  String get subFoundationConcreteVolumeExplanation {
    return "Hafriyat alanı: $excavationArea x (Grobeton yüksekliği: ${projectConstants.leanConcreteHeight} + Yalıtım koruma betonu yüksekliği: ${projectConstants.insulationConcreteHeight})";
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
    return foundationArea + (foundationPerimeter * foundationHeight);
  }

  String get foundationWaterProofingAreaExplanation {
    return "Temel alanı: $foundationArea + (Temel çevre uzunluğu: $foundationPerimeter x Temel yüksekliği: $foundationHeight)";
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

class RoofJobsCalculator extends JobCalculator {
  RoofJobsCalculator(
      {super.name = "Çatı Maliyeti",
      required super.projectConstants,
      required super.landArea,
      required super.landPerimeter,
      required super.excavationArea,
      required super.excavationPerimeter,
      required super.coreCurtainLength,
      required super.curtainsExceeding1MeterLength,
      required super.basementCurtainLength,
      required super.columnsLess1MeterPerimeter,
      required super.elevationTowerArea,
      required super.elevationTowerHeightWithoutSlab,
      required super.floors,
      required super.foundationArea,
      required super.foundationPerimeter,
      required super.foundationHeight});

  @override
  JobCalculator get newInstance {
    return RoofJobsCalculator(
        projectConstants: projectConstants,
        landArea: landArea,
        landPerimeter: landPerimeter,
        excavationArea: excavationArea,
        excavationPerimeter: excavationPerimeter,
        coreCurtainLength: coreCurtainLength,
        curtainsExceeding1MeterLength: curtainsExceeding1MeterLength,
        basementCurtainLength: basementCurtainLength,
        columnsLess1MeterPerimeter: columnsLess1MeterPerimeter,
        elevationTowerArea: elevationTowerArea,
        elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab,
        floors: floors,
        foundationArea: foundationArea,
        foundationPerimeter: foundationPerimeter,
        foundationHeight: foundationHeight);
  }

  @override
  List<Job> createJobs() {
    return [
      Roofing(
          quantity: roofingArea, quantityExplanation: roofingAreaExplanation)
    ];
  }

  Floor get _topFloor {
    final topFloor = floors.reduce((current, next) {
      return current.no > next.no ? current : next;
    });
    return topFloor;
  }

  double get roofingArea {
    return _topFloor.ceilingArea;
  }

  String get roofingAreaExplanation {
    return "En üst kat tavan alanı: ${_topFloor.ceilingArea}";
  }
}

class FacadeJobsCalculator extends JobCalculator {
  FacadeJobsCalculator(
      {super.name = "Cephe Maliyeti",
      required super.projectConstants,
      required super.landArea,
      required super.landPerimeter,
      required super.excavationArea,
      required super.excavationPerimeter,
      required super.coreCurtainLength,
      required super.curtainsExceeding1MeterLength,
      required super.basementCurtainLength,
      required super.columnsLess1MeterPerimeter,
      required super.elevationTowerArea,
      required super.elevationTowerHeightWithoutSlab,
      required super.floors,
      required super.foundationArea,
      required super.foundationPerimeter,
      required super.foundationHeight});

  @override
  JobCalculator get newInstance {
    return FacadeJobsCalculator(
        projectConstants: projectConstants,
        landArea: landArea,
        landPerimeter: landPerimeter,
        excavationArea: excavationArea,
        excavationPerimeter: excavationPerimeter,
        coreCurtainLength: coreCurtainLength,
        curtainsExceeding1MeterLength: curtainsExceeding1MeterLength,
        basementCurtainLength: basementCurtainLength,
        columnsLess1MeterPerimeter: columnsLess1MeterPerimeter,
        elevationTowerArea: elevationTowerArea,
        elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab,
        floors: floors,
        foundationArea: foundationArea,
        foundationPerimeter: foundationPerimeter,
        foundationHeight: foundationHeight);
  }

  @override
  List<Job> createJobs() {
    return [
      FacadeScaffolding(
          quantity: facadeScaffoldingArea,
          quantityExplanation: facadeScaffoldingAreaExplanation),
      Windows(
          quantity: windowsArea, quantityExplanation: windowAreaExplanation),
      FacadeRails(
          quantity: facadeRailsLength,
          quantityExplanation: facadeRailsLengthExplanation),
      FacadeSystem(
          quantity: facadeSystemArea,
          quantityExplanation: facadeSystemAreaExplanation)
    ];
  }

  List<Floor> get _aboveBasementFloors {
    return floors.where((floor) => floor.no >= 0).toList();
  }

  double get _totalFacadeArea {
    return _aboveBasementFloors
        .map((floor) => floor.perimeter * floor.fullHeight)
        .fold(0.0, (p, c) => p + c);
  }

  double get _totalWindowArea {
    double totalWindowArea = 0;
    for (var floor in floors) {
      final windowAreas = floor.windows
          .map((window) => window.width * window.height * window.count);
      totalWindowArea += windowAreas.fold(0.0, (p, c) => p + c);
    }
    return totalWindowArea;
  }

  double get _totalFacadeRailingLength {
    double totalFacadeRailingLength = 0;
    for (var floor in floors) {
      final facadeRailingLengths = floor.windows
          .map((window) => window.hasRailing ? window.width * window.count : 0);
      totalFacadeRailingLength +=
          facadeRailingLengths.fold(0.0, (p, c) => p + c);
    }
    return totalFacadeRailingLength;
  }

  //Calculations
  double get facadeScaffoldingArea {
    return _totalFacadeArea;
  }

  String get facadeScaffoldingAreaExplanation {
    return "Toplam cephe alanı: $_totalFacadeArea";
  }

  double get windowsArea {
    return _totalWindowArea;
  }

  String get windowAreaExplanation {
    return "Toplam pencere alanı: $_totalWindowArea";
  }

  double get facadeRailsLength {
    return _totalFacadeRailingLength;
  }

  String get facadeRailsLengthExplanation {
    return "Toplam cephe korkuluğu uzunluğu: $_totalFacadeRailingLength";
  }

  double get facadeSystemArea {
    return _totalFacadeArea;
  }

  String get facadeSystemAreaExplanation {
    return "Toplam cephe alanı: $_totalFacadeArea";
  }
}

class InteriorJobsCalculator extends JobCalculator {
  InteriorJobsCalculator(
      {super.name = "İç İmalat Maliyeti",
      required super.projectConstants,
      required super.landArea,
      required super.landPerimeter,
      required super.excavationArea,
      required super.excavationPerimeter,
      required super.coreCurtainLength,
      required super.curtainsExceeding1MeterLength,
      required super.basementCurtainLength,
      required super.columnsLess1MeterPerimeter,
      required super.elevationTowerArea,
      required super.elevationTowerHeightWithoutSlab,
      required super.floors,
      required super.foundationArea,
      required super.foundationPerimeter,
      required super.foundationHeight});

  @override
  JobCalculator get newInstance {
    return InteriorJobsCalculator(
        projectConstants: projectConstants,
        landArea: landArea,
        landPerimeter: landPerimeter,
        excavationArea: excavationArea,
        excavationPerimeter: excavationPerimeter,
        coreCurtainLength: coreCurtainLength,
        curtainsExceeding1MeterLength: curtainsExceeding1MeterLength,
        basementCurtainLength: basementCurtainLength,
        columnsLess1MeterPerimeter: columnsLess1MeterPerimeter,
        elevationTowerArea: elevationTowerArea,
        elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab,
        floors: floors,
        foundationArea: foundationArea,
        foundationPerimeter: foundationPerimeter,
        foundationHeight: foundationHeight);
  }

  @override
  List<Job> createJobs() {
    return [
      InteriorPlastering(
          quantity: interiorPlasteringArea,
          quantityExplanation: interiorPlasteringAreaExplanation),
      InteriorPainting(
          quantity: interiorPaintingArea,
          quantityExplanation: interiorPaintingAreaExplanation),
      InteriorWaterproofing(
          quantity: interiorWaterproofingArea,
          quantityExplanation: interiorWaterproofingAreaExplanation),
      CeilingCovering(
          quantity: ceilingCoveringArea,
          quantityExplanation: ceilingCoveringAreaExplanation),
      CovingPlaster(
          quantity: covingPlasterLength,
          quantityExplanation: covingPlasterLengthExplanation),
      Screeding(
          quantity: screedingArea,
          quantityExplanation: screedingAreaExplanation),
      Marble(quantity: marbleArea, quantityExplanation: marbleAreaExplanation),
      MarbleStep(
          quantity: marbleStepLength,
          quantityExplanation: marbleStepLengthExplanation),
      MarbleWindowsill(
          quantity: marbleWindowsillLength,
          quantityExplanation: marbleWindowsillLengthExplanation),
      StairRailings(
          quantity: stairRailingsLength,
          quantityExplanation: stairRailingsLengthExplanation),
      CeramicTile(
          quantity: ceramicTileArea,
          quantityExplanation: ceramicTileAreaExplanation),
      ParquetTile(
          quantity: parquetTileArea,
          quantityExplanation: parquetTileAreaExplanation),
      SteelDoor(
          quantity: steelDoorNumber,
          quantityExplanation: steelDoorNumberExplanation),
      EntranceDoor(
          quantity: entranceDoorArea,
          quantityExplanation: entranceDoorAreaExplanation),
      FireDoor(
          quantity: fireDoorNumber,
          quantityExplanation: fireDoorNumberExplanation),
      WoodenDoor(
          quantity: woodenDoorNumber,
          quantityExplanation: woodenDoorNumberExplanation),
      KitchenCupboard(
          quantity: kitchenCupboardLength,
          quantityExplanation: kitchenCupboardLengthExplanation),
      KitchenCounter(
          quantity: kitchenCounterLength,
          quantityExplanation: kitchenCounterLengthExplanation),
      CoatCabinet(
          quantity: coatCabinetArea,
          quantityExplanation: coatCabinetAreaExplanation),
      BathroomCabinet(
          quantity: bathroomCabinetArea,
          quantityExplanation: bathroomCabinetAreaExplanation),
      FloorPlinth(
          quantity: floorPlinthLength,
          quantityExplanation: floorPlinthLengthExplanation),
      MechanicalInfrastructure(
          quantity: mechanicalInfrastructureApartment,
          quantityExplanation: mechanicalInfrastructureApartmentExplanation),
      AirConditioner(
          quantity: airConditionerNumber,
          quantityExplanation: airConditionerNumberExplanation),
      Ventilation(
          quantity: ventilationArea,
          quantityExplanation: ventilationAreaExplanation),
      WaterTank(
          quantity: waterTankNumber,
          quantityExplanation: waterTankNumberExplanation),
      Elevation(
          quantity: elevationStop,
          quantityExplanation: elevationStopExplanation,
          selectedUnitPriceCategory: UnitPriceCategory.elevation10PersonKone),
      Elevation(
          quantity: elevationStop,
          quantityExplanation: elevationStopExplanation,
          selectedUnitPriceCategory: UnitPriceCategory.elevation6PersonKone),
      Sink(quantity: sinkNumber, quantityExplanation: sinkNumberExplanation),
      SinkBattery(
          quantity: sinkBatteryNumber,
          quantityExplanation: sinkBatteryNumberExplanation),
      ConcealedCistern(
          quantity: concealedCisternNumber,
          quantityExplanation: concealedCisternNumberExplanation),
      Shower(
          quantity: showerNumber, quantityExplanation: showerNumberExplanation),
      ShowerBattery(
          quantity: showerBatteryNumber,
          quantityExplanation: showerBatteryNumberExplanation),
      KitchenFaucetAndSink(
          quantity: kitchenFaucetAndSinkNumber,
          quantityExplanation: kitchenFaucetAndSinkNumberExplanation),
      ElectricalInfrastructure(
          quantity: electricalInfrastructureApartment,
          quantityExplanation: electricalInfrastructureApartmentExplanation),
      Generator(
          quantity: generatorNumber,
          quantityExplanation: generatorNumberExplanation),
      HouseholdAppliances(
          quantity: householdAppliancesApartment,
          quantityExplanation: householdAppliancesApartmentExplanation),
    ];
  }

  double get _totalPlasterArea {
    double area = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.wallMaterial == WallMaterial.painting) {
          area += (room.perimeter * floor.heightWithoutSlab);
        }
        if (room.ceilingMaterial == CeilingMaterial.plaster) {
          area += room.area;
        }
      }
    }
    return area;
  }

  double get _totalPaintingArea {
    double area = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.wallMaterial == WallMaterial.painting) {
          area += (room.perimeter * floor.heightWithoutSlab);
        }
        if (room.ceilingMaterial == CeilingMaterial.drywall ||
            room.ceilingMaterial == CeilingMaterial.plaster) {
          area += room.area;
        }
      }
    }
    return area;
  }

  double get _totalInteriorWetFloorArea {
    double area = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.isFloorWet) {
          area += room.area;
        }
      }
    }
    return area;
  }

  double get _totalDryWallArea {
    double area = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.ceilingMaterial == CeilingMaterial.drywall) {
          area += room.area;
        }
      }
    }
    return area;
  }

  double get _totalCovingPlasterLength {
    double length = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.hasCovingPlaster) {
          length += room.perimeter;
        }
      }
    }
    return length;
  }

  double get _totalScreedArea {
    double area = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.hasScreed) {
          area += room.area;
        }
      }
    }
    return area;
  }

  double get _totalMarbleArea {
    double area = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.floorMaterial == FloorMaterial.marble) {
          area += room.area;
        }
      }
    }
    return area;
  }

  double get _totalMarbleStepLength {
    double length = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.floorMaterial == FloorMaterial.marbleStep) {
          final stepCount =
              floor.fullHeight / projectConstants.stairRiserHeight;
          length += (projectConstants.stairLength * stepCount);
        }
      }
    }
    return length;
  }

  double get _totalWindowsillLength {
    double totalWindowsillLength = 0;
    for (var floor in floors) {
      final windowsillLengths = floor.windows.map(
          (window) => window.hasWindowsill ? window.width * window.count : 0);
      totalWindowsillLength += windowsillLengths.fold(0.0, (p, c) => p + c);
    }
    return totalWindowsillLength;
  }

  double get _totalStairRailingsLength {
    double length = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.floorMaterial == FloorMaterial.marbleStep) {
          final stepCount =
              floor.fullHeight / projectConstants.stairRiserHeight;
          length += stepCount * projectConstants.stairTreadDepth;
        }
      }
    }
    return length;
  }

  double get _totalCeramicFloorArea {
    double area = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.floorMaterial == FloorMaterial.ceramic) {
          area += room.area;
        }
      }
    }
    return area;
  }

  double get _totalCeramicWallArea {
    double area = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.wallMaterial == WallMaterial.ceramic) {
          area += room.perimeter * floor.heightWithoutSlab;
        }
      }
    }
    return area;
  }

  double get _totalParquetFloorArea {
    double area = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.floorMaterial == FloorMaterial.parquet) {
          area += room.area;
        }
      }
    }
    return area;
  }

  int get _steelDoorNumber {
    int number = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.doors != null) {
          for (var door in room.doors!) {
            if (door.doorType == DoorType.apartmentEntrance) {
              number += door.count;
            }
          }
        }
      }
    }
    return number;
  }

  int get _buildingEntranceDoorNumber {
    int number = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.doors != null) {
          for (var door in room.doors!) {
            if (door.doorType == DoorType.buildingEntrance) {
              number += door.count;
            }
          }
        }
      }
    }
    return number;
  }

  int get _fireDoorNumber {
    int number = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.doors != null) {
          for (var door in room.doors!) {
            if (door.doorType == DoorType.fire) {
              number += door.count;
            }
          }
        }
      }
    }
    return number;
  }

  int get _woodenDoorNumber {
    int number = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.doors != null) {
          for (var door in room.doors!) {
            if (door.doorType == DoorType.room) {
              number += door.count;
            }
          }
        }
      }
    }
    return number;
  }

  int get _kitchenNumber {
    int number = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room is Kitchen || room is SaloonWithKitchen) {
          number++;
        }
      }
    }
    return number;
  }

  int get _apartmentNumber {
    return _steelDoorNumber;
  }

  int get _toiletNumber {
    int number = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room is Bathroom ||
            room is EscapeHallBathroom ||
            room is Wc ||
            room is EscapeHallWc) {
          number++;
        }
      }
    }
    return number;
  }

  double get _totalFloorPlinthLength {
    double length = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.hasFloorPlinth) {
          length += room.perimeter;
        }
      }
    }
    return length;
  }

  List<Floor> get _basementFloors {
    final basementFloors = floors.where((element) => element.no < 0).toList();
    if (basementFloors.isEmpty) {
      throw Exception("No basement floor");
    }
    return basementFloors;
  }

  double get _basementsArea {
    return _basementFloors
        .map((e) => e.area)
        .toList()
        .fold(0.0, (p, c) => p + c);
  }

  List<Floor> get _normalFloors {
    return floors.where((floor) => floor.no > 0).toList();
  }

  int get _bathroomNumber {
    int number = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room is Bathroom || room is EscapeHallBathroom) {
          number++;
        }
      }
    }
    return number;
  }

  //Calculations
  double get interiorPlasteringArea {
    return _totalPlasterArea;
  }

  String get interiorPlasteringAreaExplanation {
    return "Toplam sıva alanı: $_totalPlasterArea";
  }

  double get interiorPaintingArea {
    return _totalPaintingArea;
  }

  String get interiorPaintingAreaExplanation {
    return "Toplam boya alanı: $_totalPaintingArea";
  }

  double get interiorWaterproofingArea {
    return _totalInteriorWetFloorArea;
  }

  String get interiorWaterproofingAreaExplanation {
    return "Toplam iç mekan ıslak zemin alanı: $_totalInteriorWetFloorArea";
  }

  double get ceilingCoveringArea {
    return _totalDryWallArea;
  }

  String get ceilingCoveringAreaExplanation {
    return "Toplam alçıpan alanı: $_totalDryWallArea";
  }

  double get covingPlasterLength {
    return _totalCovingPlasterLength;
  }

  String get covingPlasterLengthExplanation {
    return "Toplam kartonpiyer uzunluğu: $_totalCovingPlasterLength";
  }

  double get screedingArea {
    return _totalScreedArea;
  }

  String get screedingAreaExplanation {
    return "Toplam şap alanı: $_totalScreedArea";
  }

  double get marbleArea {
    return _totalMarbleArea;
  }

  String get marbleAreaExplanation {
    return "Toplam mermer alanı: $_totalMarbleArea";
  }

  double get marbleStepLength {
    return _totalMarbleStepLength;
  }

  String get marbleStepLengthExplanation {
    return "Toplam basamak uzunluğu: $_totalMarbleStepLength";
  }

  double get marbleWindowsillLength {
    return _totalWindowsillLength;
  }

  String get marbleWindowsillLengthExplanation {
    return "Toplam denizlikli pencere uzunluğu: $_totalWindowsillLength";
  }

  double get stairRailingsLength {
    return _totalStairRailingsLength;
  }

  String get stairRailingsLengthExplanation {
    return "Toplam merdiven korkuluğu uzunluğu: $_totalStairRailingsLength";
  }

  double get ceramicTileArea {
    return _totalCeramicFloorArea + _totalCeramicWallArea;
  }

  String get ceramicTileAreaExplanation {
    return "Toplam yer seramik alanı: $_totalCeramicFloorArea + Toplam fayans alanı: $_totalCeramicWallArea";
  }

  double get parquetTileArea {
    return _totalParquetFloorArea;
  }

  String get parquetTileAreaExplanation {
    return "Toplam parke alanı: $_totalParquetFloorArea";
  }

  double get steelDoorNumber {
    return _steelDoorNumber.toDouble();
  }

  String get steelDoorNumberExplanation {
    return "Toplam çelik kapı adedi: $_steelDoorNumber";
  }

  double get entranceDoorArea {
    return _buildingEntranceDoorNumber *
        projectConstants.buildingEntranceDoorArea;
  }

  String get entranceDoorAreaExplanation {
    return "Apartman giriş kapısı sayısı: $_buildingEntranceDoorNumber + Toplam apartman giriş kapısı alanı: ${projectConstants.buildingEntranceDoorArea}";
  }

  double get fireDoorNumber {
    return _fireDoorNumber.toDouble();
  }

  String get fireDoorNumberExplanation {
    return "Toplam yangın kapısı adedi: $_fireDoorNumber";
  }

  double get woodenDoorNumber {
    return _woodenDoorNumber.toDouble();
  }

  String get woodenDoorNumberExplanation {
    return "Toplam ahşap kapı adedi: $_woodenDoorNumber";
  }

  double get kitchenCupboardLength {
    return _kitchenNumber * projectConstants.kitchenLength * 2;
  }

  String get kitchenCupboardLengthExplanation {
    return "Mutfak sayısı: $_kitchenNumber x Mutfak uzunluğu: ${projectConstants.kitchenLength} x 2(Alt - Üst dolap)";
  }

  double get kitchenCounterLength {
    return _kitchenNumber * projectConstants.kitchenLength;
  }

  String get kitchenCounterLengthExplanation {
    return "Mutfak sayısı: $_kitchenNumber x Mutfak uzunluğu: ${projectConstants.kitchenLength}";
  }

  double get coatCabinetArea {
    return _apartmentNumber * projectConstants.coatCabinetArea;
  }

  String get coatCabinetAreaExplanation {
    return "Daire sayısı: $_apartmentNumber x Portmanto alanı: ${projectConstants.coatCabinetArea}";
  }

  double get bathroomCabinetArea {
    return _toiletNumber * projectConstants.bathroomCabinetArea;
  }

  String get bathroomCabinetAreaExplanation {
    return "Tuvalet sayısı: $_toiletNumber x Banyo dolabı alanı: ${projectConstants.bathroomCabinetArea}";
  }

  double get floorPlinthLength {
    return _totalFloorPlinthLength;
  }

  String get floorPlinthLengthExplanation {
    return "Toplam süpürgelik uzunluğu: $_totalFloorPlinthLength";
  }

  double get mechanicalInfrastructureApartment {
    return _apartmentNumber.toDouble();
  }

  String get mechanicalInfrastructureApartmentExplanation {
    return "Daire sayısı: $_apartmentNumber";
  }

  double get airConditionerNumber {
    return _apartmentNumber *
        projectConstants.airConditionerNumberForOneApartment.toDouble();
  }

  String get airConditionerNumberExplanation {
    return "Toplam daire sayısı: $_apartmentNumber x 1 daire için klima sayısı: ${projectConstants.airConditionerNumberForOneApartment}";
  }

  double get ventilationArea {
    return _basementsArea;
  }

  String get ventilationAreaExplanation {
    return "Bodrumlar toplam alanı: $_basementsArea";
  }

  //BURAYA BAK!!!!!!!!!!!!!!!!
  double get waterTankNumber {
    return 1;
  }

  String get waterTankNumberExplanation {
    return "Götürü bedel";
  }

  double get elevationStop {
    return (_basementFloors.length + 1 + _normalFloors.length).toDouble();
  }

  String get elevationStopExplanation {
    return "Bodrum kat adedi: ${_basementFloors.length} + Zemin kat adedi: 1 + Normal kat adedi: ${_normalFloors.length}";
  }

  double get sinkNumber {
    return _toiletNumber.toDouble();
  }

  String get sinkNumberExplanation {
    return "Toplam tuvalet sayısı: $_toiletNumber";
  }

  double get sinkBatteryNumber {
    return _toiletNumber.toDouble();
  }

  String get sinkBatteryNumberExplanation {
    return "Toplam tuvalet sayısı: $_toiletNumber";
  }

  double get concealedCisternNumber {
    return _toiletNumber.toDouble();
  }

  String get concealedCisternNumberExplanation {
    return "Toplam tuvalet sayısı: $_toiletNumber";
  }

  double get showerNumber {
    return _bathroomNumber.toDouble();
  }

  String get showerNumberExplanation {
    return "Toplam banyo sayısı: $_bathroomNumber";
  }

  double get showerBatteryNumber {
    return _bathroomNumber.toDouble();
  }

  String get showerBatteryNumberExplanation {
    return "Toplam banyo sayısı: $_bathroomNumber";
  }

  double get kitchenFaucetAndSinkNumber {
    return _kitchenNumber.toDouble();
  }

  String get kitchenFaucetAndSinkNumberExplanation {
    return "Toplam mutfak sayısı: $_kitchenNumber";
  }

  double get electricalInfrastructureApartment {
    return _apartmentNumber.toDouble();
  }

  String get electricalInfrastructureApartmentExplanation {
    return "Toplam daire sayısı: $_apartmentNumber";
  }

  //BURAYA BAK !!!!!!!!!!!!!!!!!!
  double get generatorNumber {
    return 1;
  }

  String get generatorNumberExplanation {
    return "Götürü bedel";
  }

  double get householdAppliancesApartment {
    return _apartmentNumber.toDouble();
  }

  String get householdAppliancesApartmentExplanation {
    return "Toplam daire sayısı: $_apartmentNumber";
  }
}

class LandscapeJobsCalculator extends JobCalculator {
  LandscapeJobsCalculator(
      {super.name = "Peysaj Maliyeti",
      required super.projectConstants,
      required super.landArea,
      required super.landPerimeter,
      required super.excavationArea,
      required super.excavationPerimeter,
      required super.coreCurtainLength,
      required super.curtainsExceeding1MeterLength,
      required super.basementCurtainLength,
      required super.columnsLess1MeterPerimeter,
      required super.elevationTowerArea,
      required super.elevationTowerHeightWithoutSlab,
      required super.floors,
      required super.foundationArea,
      required super.foundationPerimeter,
      required super.foundationHeight});

  @override
  JobCalculator get newInstance {
    return LandscapeJobsCalculator(
        projectConstants: projectConstants,
        landArea: landArea,
        landPerimeter: landPerimeter,
        excavationArea: excavationArea,
        excavationPerimeter: excavationPerimeter,
        coreCurtainLength: coreCurtainLength,
        curtainsExceeding1MeterLength: curtainsExceeding1MeterLength,
        basementCurtainLength: basementCurtainLength,
        columnsLess1MeterPerimeter: columnsLess1MeterPerimeter,
        elevationTowerArea: elevationTowerArea,
        elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab,
        floors: floors,
        foundationArea: foundationArea,
        foundationPerimeter: foundationPerimeter,
        foundationHeight: foundationHeight);
  }

  @override
  List<Job> createJobs() {
    return [
      LandScapeGarden(
          quantity: landScapeGardenArea,
          quantityExplanation: landScapeGardenAreaExplanation),
      OutdoorParkingTile(
          quantity: outdoorParkingTileArea,
          quantityExplanation: outdoorParkingTileAreaExplanation),
      CarLift(
          quantity: carLiftStop, quantityExplanation: carLiftStopExplanation),
      AutomaticBarrier(
          quantity: automaticBarrierNumber,
          quantityExplanation: automaticBarrierNumberExplanation),
    ];
  }

  Floor get _groundFloor {
    final groundFloor = floors.firstWhere(
      (floor) => floor.no == 0,
      orElse: () => throw Exception("No ground floor"),
    );
    return groundFloor;
  }

  List<Floor> get _basementFloors {
    final basementFloors = floors.where((element) => element.no < 0).toList();
    if (basementFloors.isEmpty) {
      throw Exception("No basement floor");
    }
    return basementFloors;
  }

  //Calculations
  double get landScapeGardenArea {
    return (landArea - _groundFloor.area) *
        projectConstants.gardenOutdoorParkingAreaRate;
  }

  String get landScapeGardenAreaExplanation {
    return "Arsa alanı: $landArea - Zemin kat alanı: ${_groundFloor.area} x Bahçe Oranı: ${projectConstants.gardenOutdoorParkingAreaRate}";
  }

  double get outdoorParkingTileArea {
    return (landArea - _groundFloor.area) *
        (1 - projectConstants.gardenOutdoorParkingAreaRate);
  }

  String get outdoorParkingTileAreaExplanation {
    return "Arsa alanı: $landArea - Zemin kat alanı: ${_groundFloor.area} x Açık otopark oranı: 1 - Bahçe Oranı: ${projectConstants.gardenOutdoorParkingAreaRate}";
  }

  double get carLiftStop {
    return _basementFloors.length + 1;
  }

  String get carLiftStopExplanation {
    return "Bodrum kat adedi: ${_basementFloors.length} + Zemin kat adedi: 1";
  }

  double get automaticBarrierNumber {
    return projectConstants.automaticBarrierNumber.toDouble();
  }

  String get automaticBarrierNumberExplanation {
    return "Otomatik bariyer adedi: ${projectConstants.automaticBarrierNumber}";
  }
}

class GeneralExpensesJobsCalculator extends JobCalculator {
  GeneralExpensesJobsCalculator(
      {super.name = "Genel Giderler",
      required super.projectConstants,
      required super.landArea,
      required super.landPerimeter,
      required super.excavationArea,
      required super.excavationPerimeter,
      required super.coreCurtainLength,
      required super.curtainsExceeding1MeterLength,
      required super.basementCurtainLength,
      required super.columnsLess1MeterPerimeter,
      required super.elevationTowerArea,
      required super.elevationTowerHeightWithoutSlab,
      required super.floors,
      required super.foundationArea,
      required super.foundationPerimeter,
      required super.foundationHeight});

  @override
  JobCalculator get newInstance {
    return GeneralExpensesJobsCalculator(
        projectConstants: projectConstants,
        landArea: landArea,
        landPerimeter: landPerimeter,
        excavationArea: excavationArea,
        excavationPerimeter: excavationPerimeter,
        coreCurtainLength: coreCurtainLength,
        curtainsExceeding1MeterLength: curtainsExceeding1MeterLength,
        basementCurtainLength: basementCurtainLength,
        columnsLess1MeterPerimeter: columnsLess1MeterPerimeter,
        elevationTowerArea: elevationTowerArea,
        elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab,
        floors: floors,
        foundationArea: foundationArea,
        foundationPerimeter: foundationPerimeter,
        foundationHeight: foundationHeight);
  }

  @override
  List<Job> createJobs() {
    return [
      EnclosingTheLand(
          quantity: enclosingTheLandLength,
          quantityExplanation: enclosingTheLandLengthExplanation),
      MobilizationDemobilization(
          quantity: mobilizationDemobilizationNumber,
          quantityExplanation: mobilizationDemobilizationNumberExplanation),
      Crane(quantity: craneHour, quantityExplanation: craneHourExplanation),
      SiteSafety(
          quantity: siteSafetyMonth,
          quantityExplanation: siteSafetyMonthExplanation),
      SiteExpenses(
          quantity: siteExpensesMonth,
          quantityExplanation: siteExpensesMonthExplanation),
      Sergeant(
          quantity: sergeantMonth,
          quantityExplanation: sergeantMonthExplanation),
      SiteChief(
          quantity: siteChiefMonth,
          quantityExplanation: siteChiefMonthExplanation),
      ProjectsFeesPayments(
          quantity: projectsFeesPaymentsNumber,
          quantityExplanation: projectsFeesPaymentsNumberExplanation),
    ];
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

  //Calculations
  double get enclosingTheLandLength {
    return landPerimeter;
  }

  String get enclosingTheLandLengthExplanation {
    return "Arsa çevresi: $landPerimeter";
  }

  //BURAYA BAK!!!!!!!!!!!!!!!!!!
  double get mobilizationDemobilizationNumber {
    return 1;
  }

  String get mobilizationDemobilizationNumberExplanation {
    return "Götürü bedel";
  }

  double get craneHour {
    return _roughConstructionArea *
        projectConstants.craneHourForOneSquareMeterRoughConstructionArea;
  }

  String get craneHourExplanation {
    return "Kaba inşaat alanı: $_roughConstructionArea x 1 metre kare kaba inşaat alanı için vinç çalışma saati: ${projectConstants.craneHourForOneSquareMeterRoughConstructionArea}";
  }

  double get siteSafetyMonth {
    return projectConstants.projectDurationMonth;
  }

  String get siteSafetyMonthExplanation {
    return "Proje süresi: ${projectConstants.projectDurationMonth}";
  }

  double get siteExpensesMonth {
    return projectConstants.projectDurationMonth;
  }

  String get siteExpensesMonthExplanation {
    return "Proje süresi: ${projectConstants.projectDurationMonth}";
  }

  double get sergeantMonth {
    return projectConstants.projectDurationMonth;
  }

  String get sergeantMonthExplanation {
    return "Proje süresi: ${projectConstants.projectDurationMonth}";
  }

  double get siteChiefMonth {
    return projectConstants.projectDurationMonth;
  }

  String get siteChiefMonthExplanation {
    return "Proje süresi: ${projectConstants.projectDurationMonth}";
  }

  //BURAYA BAK!!!!!!!!!!!!!!!!!!
  double get projectsFeesPaymentsNumber {
    return 1;
  }

  String get projectsFeesPaymentsNumberExplanation {
    return "Götürü bedel";
  }
}
