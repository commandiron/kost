
import 'package:kost/domain/calculator/detailed/project_constants.dart';
import 'package:kost/domain/model/unit_price/unit_price.dart';

import '../../calculator/detailed/floor.dart';
import 'job.dart';

abstract class JobQuantityCalculator {
  List<Job> jobs;
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

  JobQuantityCalculator(
    {
      this.jobs = const [],
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
    }
  );
}

class ApartmentJobsQuantityCalculator extends JobQuantityCalculator {
  ApartmentJobsQuantityCalculator({
    super.name = "Apartman Maliyeti",
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
    required super.foundationHeight
  }){
    final roughConstructionQuantityCalculator = RoughConstructionJobsQuantityCalculator(projectConstants: projectConstants, landArea: landArea, landPerimeter: landPerimeter, excavationArea: excavationArea, excavationPerimeter: excavationPerimeter, coreCurtainLength: coreCurtainLength, curtainsExceeding1MeterLength: curtainsExceeding1MeterLength, basementCurtainLength: basementCurtainLength, columnsLess1MeterPerimeter: columnsLess1MeterPerimeter, elevationTowerArea: elevationTowerArea, elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab, floors: floors, foundationArea: foundationArea, foundationPerimeter: foundationPerimeter, foundationHeight: foundationHeight);
    final roofQuantityCalculator = RoofJobsQuantityCalculator(projectConstants: projectConstants, landArea: landArea, landPerimeter: landPerimeter, excavationArea: excavationArea, excavationPerimeter: excavationPerimeter, coreCurtainLength: coreCurtainLength, curtainsExceeding1MeterLength: curtainsExceeding1MeterLength, basementCurtainLength: basementCurtainLength, columnsLess1MeterPerimeter: columnsLess1MeterPerimeter, elevationTowerArea: elevationTowerArea, elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab, floors: floors, foundationArea: foundationArea, foundationPerimeter: foundationPerimeter, foundationHeight: foundationHeight);
    final interiorQuantityCalculator = InteriorJobsQuantityCalculator(projectConstants: projectConstants, landArea: landArea, landPerimeter: landPerimeter, excavationArea: excavationArea, excavationPerimeter: excavationPerimeter, coreCurtainLength: coreCurtainLength, curtainsExceeding1MeterLength: curtainsExceeding1MeterLength, basementCurtainLength: basementCurtainLength, columnsLess1MeterPerimeter: columnsLess1MeterPerimeter, elevationTowerArea: elevationTowerArea, elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab, floors: floors, foundationArea: foundationArea, foundationPerimeter: foundationPerimeter, foundationHeight: foundationHeight);
    final landscapeQuantityCalculator = LandscapeJobsQuantityCalculator(projectConstants: projectConstants, landArea: landArea, landPerimeter: landPerimeter, excavationArea: excavationArea, excavationPerimeter: excavationPerimeter, coreCurtainLength: coreCurtainLength, curtainsExceeding1MeterLength: curtainsExceeding1MeterLength, basementCurtainLength: basementCurtainLength, columnsLess1MeterPerimeter: columnsLess1MeterPerimeter, elevationTowerArea: elevationTowerArea, elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab, floors: floors, foundationArea: foundationArea, foundationPerimeter: foundationPerimeter, foundationHeight: foundationHeight);
    final generalExpensesQuantityCalculator = GeneralExpensesJobsQuantityCalculator(projectConstants: projectConstants, landArea: landArea, landPerimeter: landPerimeter, excavationArea: excavationArea, excavationPerimeter: excavationPerimeter, coreCurtainLength: coreCurtainLength, curtainsExceeding1MeterLength: curtainsExceeding1MeterLength, basementCurtainLength: basementCurtainLength, columnsLess1MeterPerimeter: columnsLess1MeterPerimeter, elevationTowerArea: elevationTowerArea, elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab, floors: floors, foundationArea: foundationArea, foundationPerimeter: foundationPerimeter, foundationHeight: foundationHeight);
    jobs = [
      ...roughConstructionQuantityCalculator.jobs,
      ...roofQuantityCalculator.jobs,
      ...interiorQuantityCalculator.jobs,
      ...landscapeQuantityCalculator.jobs,
      ...generalExpensesQuantityCalculator.jobs
    ];
  }
}

class RoughConstructionJobsQuantityCalculator extends JobQuantityCalculator {
  RoughConstructionJobsQuantityCalculator(
    {
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
    }
  ){
    jobs = [
      Shoring(quantity: shoringArea, quantityExplanation: shoringAreaExplanation),
      Excavation(quantity: excavationVolume, quantityExplanation: excavationVolumeExplanation),
      Breaker(quantity: breakerHour, quantityExplanation: breakerHourExplanation),
      FoundationStabilization(quantity: foundationStabilizationWeight, quantityExplanation: foundationStabilizationWeightExplanation),
      SubFoundationConcreteMaterial(quantity: subFoundationConcreteVolume, quantityExplanation: subFoundationConcreteVolumeExplanation),
      ReinforcedConcreteWorkmanshipWithFormWorkMaterial(quantity: formWorkArea, quantityExplanation: formWorkAreaExplanation),
      ConcreteMaterial(quantity: concreteVolume, quantityExplanation: concreteVolumeExplanation),
      RebarMaterial(quantity: rebarWeight, quantityExplanation: rebarWeightExplanation),
      HollowFloorFillingMaterial(quantity: hollowFloorFillingVolume, quantityExplanation: hollowFloorFillingVolumeExplanation),
      FoundationWaterproofing(quantity: foundationWaterProofingArea, quantityExplanation: foundationWaterProofingAreaExplanation),
      CurtainWaterproofing(quantity: curtainWaterProofingArea, quantityExplanation: curtainWaterProofingAreaExplanation),
      CurtainProtectionBeforeFilling(quantity: curtainProtectionBeforeFillingArea, quantityExplanation: curtainProtectionBeforeFillingAreaExplanation),
      WallMaterial(quantity: wallMaterialVolume, quantityExplanation: wallMaterialVolumeExplanation),
      WallWorkmanShip(quantity: wallWorkmanShipArea, quantityExplanation: wallWorkmanShipAreaExplanation),
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
    return _basementFloors.map((floor) => floor.fullHeight).fold(0.0, (p, c) => p + c);
  }
  double get _excavationHeight {
    return projectConstants.stabilizationHeight
      + projectConstants.leanConcreteHeight
      + projectConstants.insulationConcreteHeight
      + foundationHeight
      + _basementsHeight;
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
    return floors.map((floor) => floor.heightWithoutSlab).fold(0.0, (p, c) => p + c);
  }
  double get _coreCurtainAreaWithoutSlab {
    return coreCurtainLength * (_buildingHeightWithoutSlabs + elevationTowerHeightWithoutSlab);
  }
  double get _curtainsExceeding1MeterAreaWithoutSlab {
    return curtainsExceeding1MeterLength * _buildingHeightWithoutSlabs;
  }
  double get _basementsHeightWithoutSlab {
    return _basementFloors.map((floor) => floor.heightWithoutSlab).fold(0.0, (p, c) => p + c);
  }
  double get _basementsCurtainAreaWithoutSlab {
    return basementCurtainLength * _basementsHeightWithoutSlab;
  }
  double get _hollowSlabRoughConstructionArea {
    return floors.where((floor) => floor.isCeilingHollowSlab).map((ceilingSlabFloor) => ceilingSlabFloor.ceilingArea).fold(0.0, (p, c) => p + c);
  }
  double get _basementsOuterCurtainArea {
    return _basementFloors.map((floor) => floor.perimeter * floor.fullHeight).fold(0.0, (p, c) => p + c);
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
    return floors.map((floor) => floor.thickWallLength * floor.heightWithoutSlab).fold(0.0, (p, c) => p + c);
  }
  double get _thickWallVolume {
    return _thickWallArea * projectConstants.thickWallThickness;
  }
  double get _thinWallArea {
    return floors.map((floor) => floor.thinWallLength * floor.heightWithoutSlab).fold(0.0, (p, c) => p + c);
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
    return excavationArea * _excavationHeight * projectConstants.breakerHourForOneCubicMeterMediumRockExcavation;
  }
  String get breakerHourExplanation {
    return "Hafriyat alanı: $excavationArea x Hafriyat yüksekliği: $_excavationHeight x Bir m3 orta sertlikte kaya içeren hafriyat için kırıcı çalışma süresi: ${projectConstants.breakerHourForOneCubicMeterMediumRockExcavation}";
  }

  double get foundationStabilizationWeight {
    return excavationArea * projectConstants.stabilizationHeight * projectConstants.gravelTonForOneCubicMeter;
  }
  String get foundationStabilizationWeightExplanation {
    return "Hafriyat alanı: $excavationArea x Temel altı stabilizasyon malzemesi yüksekliği: ${projectConstants.stabilizationHeight} x 1 m3 mıcır: ${projectConstants.gravelTonForOneCubicMeter} ton";
  }

  double get subFoundationConcreteVolume {
    return excavationArea * (projectConstants.leanConcreteHeight + projectConstants.insulationConcreteHeight);
  }
  String get subFoundationConcreteVolumeExplanation {
    return "Hafriyat alanı: $excavationArea x (Grobeton yüksekliği: ${projectConstants.leanConcreteHeight} + Yalıtım koruma betonu yüksekliği: ${projectConstants.insulationConcreteHeight})";
  }

  double get formWorkArea {
    return _roughConstructionArea + _coreCurtainAreaWithoutSlab + _curtainsExceeding1MeterAreaWithoutSlab + _basementsCurtainAreaWithoutSlab;
  }
  String get formWorkAreaExplanation {
    return "Kaba inşaat alanı: $_roughConstructionArea + Çekirdek perdesi alanı: $_coreCurtainAreaWithoutSlab + 1 metreyi geçen perdelerin alanı: $_curtainsExceeding1MeterAreaWithoutSlab + Bodrum perdeleri alanı: $_basementsCurtainAreaWithoutSlab";
  }

  double get concreteVolume {
    return formWorkArea * projectConstants.concreteCubicMeterForOneSquareMeterFormWork;
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
    return projectConstants.hollowAreaForOneSquareMeterConstructionArea * _hollowSlabRoughConstructionArea * projectConstants.hollowFillingThickness;
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

class RoofJobsQuantityCalculator extends JobQuantityCalculator {
  RoofJobsQuantityCalculator({
    super.name = "Çatı Maliyeti",
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
    required super.foundationHeight
  }){
    jobs = [
      Roofing(quantity: 100, quantityExplanation: "quantityExplanation")
    ];
  }
}

class FacadeJobsQuantityCalculator extends JobQuantityCalculator {
  FacadeJobsQuantityCalculator({
    super.name = "Cephe Maliyeti",
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
    required super.foundationHeight
  }){
    jobs = [
      FacadeScaffolding(quantity: 100, quantityExplanation: "quantityExplanation"),
      Windows(quantity: 100, quantityExplanation: "quantityExplanation"),
      FacadeRails(quantity: 100, quantityExplanation: "quantityExplanation"),
      FacadeSystem(quantity: 100, quantityExplanation: "quantityExplanation")
    ];
  }
}

class InteriorJobsQuantityCalculator extends JobQuantityCalculator {
  InteriorJobsQuantityCalculator({
    super.name = "İç İmalat Maliyeti",
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
    required super.foundationHeight
  }){
    jobs = [
      InteriorPlastering(quantity: 100, quantityExplanation: "quantityExplanation"),
      InteriorPainting(quantity: 100, quantityExplanation: "quantityExplanation"),
      InteriorWaterproofing(quantity: 100, quantityExplanation: "quantityExplanation"),
      CeilingCovering(quantity: 100, quantityExplanation: "quantityExplanation"),
      CovingPlaster(quantity: 100, quantityExplanation: "quantityExplanation"),
      Screeding(quantity: 100, quantityExplanation: "quantityExplanation"),
      Marble(quantity: 100, quantityExplanation: "quantityExplanation"),
      MarbleStep(quantity: 100, quantityExplanation: "quantityExplanation"),
      MarbleWindowsill(quantity: 100, quantityExplanation: "quantityExplanation"),
      StairRailings(quantity: 100, quantityExplanation: "quantityExplanation"),
      CeramicTile(quantity: 100, quantityExplanation: "quantityExplanation"),
      ParquetTile(quantity: 100, quantityExplanation: "quantityExplanation"),
      SteelDoor(quantity: 100, quantityExplanation: "quantityExplanation"),
      EntranceDoor(quantity: 100, quantityExplanation: "quantityExplanation"),
      FireDoor(quantity: 100, quantityExplanation: "quantityExplanation"),
      WoodenDoor(quantity: 100, quantityExplanation: "quantityExplanation"),
      KitchenCupboard(quantity: 100, quantityExplanation: "quantityExplanation"),
      KitchenCounter(quantity: 100, quantityExplanation: "quantityExplanation"),
      CoatCabinet(quantity: 100, quantityExplanation: "quantityExplanation"),
      BathroomCabinet(quantity: 100, quantityExplanation: "quantityExplanation"),
      FloorPlinth(quantity: 100, quantityExplanation: "quantityExplanation"),
      MechanicalInfrastructure(quantity: 100, quantityExplanation: "quantityExplanation"),
      AirConditioner(quantity: 100, quantityExplanation: "quantityExplanation"),
      Ventilation(quantity: 100, quantityExplanation: "quantityExplanation"),
      WaterTank(quantity: 100, quantityExplanation: "quantityExplanation"),
      Elevation(quantity: 100, quantityExplanation: "quantityExplanation", selectedUnitPriceCategory: UnitPriceCategory.elevation10PersonKone),
      Elevation(quantity: 100, quantityExplanation: "quantityExplanation", selectedUnitPriceCategory: UnitPriceCategory.elevation6PersonKone),
      Sink(quantity: 100, quantityExplanation: "quantityExplanation"),
      SinkBattery(quantity: 100, quantityExplanation: "quantityExplanation"),
      ConcealedCistern(quantity: 100, quantityExplanation: "quantityExplanation"),
      Shower(quantity: 100, quantityExplanation: "quantityExplanation"),
      ShowerBattery(quantity: 100, quantityExplanation: "quantityExplanation"),
      KitchenFaucetAndSink(quantity: 100, quantityExplanation: "quantityExplanation"),
      ElectricalInfrastructure(quantity: 100, quantityExplanation: "quantityExplanation"),
      Generator(quantity: 100, quantityExplanation: "quantityExplanation"),
      HouseholdAppliances(quantity: 100, quantityExplanation: "quantityExplanation"),
    ];
  }
}

class LandscapeJobsQuantityCalculator extends JobQuantityCalculator {
  LandscapeJobsQuantityCalculator({
    super.name = "Peysaj Maliyeti",
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
    required super.foundationHeight
  }){
    jobs = [
      LandScapeGarden(quantity: 100, quantityExplanation: "quantityExplanation"),
      OutdoorParkingTile(quantity: 100, quantityExplanation: "quantityExplanation"),
      CarLift(quantity: 100, quantityExplanation: "quantityExplanation"),
      AutomaticBarrier(quantity: 100, quantityExplanation: "quantityExplanation"),
    ];
  }
}
class GeneralExpensesJobsQuantityCalculator extends JobQuantityCalculator {
  GeneralExpensesJobsQuantityCalculator({
    super.name = "Genel Giderler",
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
    required super.foundationHeight
  }){
    jobs = [
      EnclosingTheLand(quantity: 100, quantityExplanation: "quantityExplanation"),
      MobilizationDemobilization(quantity: 100, quantityExplanation: "quantityExplanation"),
      Crane(quantity: 100, quantityExplanation: "quantityExplanation"),
      SiteSafety(quantity: 100, quantityExplanation: "quantityExplanation"),
      SiteExpenses(quantity: 100, quantityExplanation: "quantityExplanation"),
      Sergeant(quantity: 100, quantityExplanation: "quantityExplanation"),
      SiteChief(quantity: 100, quantityExplanation: "quantityExplanation"),
      ProjectsFeesPayments(quantity: 100, quantityExplanation: "quantityExplanation"),
    ];
  }
}