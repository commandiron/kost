import 'package:kost/domain/calculator/detailed/project_constants.dart';

import '../../calculator/detailed/floor.dart';
import 'job.dart';

abstract class CostCalculator {
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

  CostCalculator(
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

class ApartmentCostCalculator extends CostCalculator {
  ApartmentCostCalculator({
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
    final roughConstructionCostCalculator = RoughConstructionCostCalculator(projectConstants: projectConstants, landArea: landArea, landPerimeter: landPerimeter, excavationArea: excavationArea, excavationPerimeter: excavationPerimeter, coreCurtainLength: coreCurtainLength, curtainsExceeding1MeterLength: curtainsExceeding1MeterLength, basementCurtainLength: basementCurtainLength, columnsLess1MeterPerimeter: columnsLess1MeterPerimeter, elevationTowerArea: elevationTowerArea, elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab, floors: floors, foundationArea: foundationArea, foundationPerimeter: foundationPerimeter, foundationHeight: foundationHeight);
    final roofCostCalculator = RoofCostCalculator(projectConstants: projectConstants, landArea: landArea, landPerimeter: landPerimeter, excavationArea: excavationArea, excavationPerimeter: excavationPerimeter, coreCurtainLength: coreCurtainLength, curtainsExceeding1MeterLength: curtainsExceeding1MeterLength, basementCurtainLength: basementCurtainLength, columnsLess1MeterPerimeter: columnsLess1MeterPerimeter, elevationTowerArea: elevationTowerArea, elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab, floors: floors, foundationArea: foundationArea, foundationPerimeter: foundationPerimeter, foundationHeight: foundationHeight);
    jobs = [
      ...roughConstructionCostCalculator.jobs,
      ...roofCostCalculator.jobs,
    ];
  }
}

class RoughConstructionCostCalculator extends CostCalculator {
  RoughConstructionCostCalculator(
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
      FoundationStabilization(quantity: foundationStabilizationVolume, quantityExplanation: foundationStabilizationWeightExplanation),
      SubFoundationConcrete(quantity: 100, quantityExplanation: "quantityExplanation"),
      ConcreteFormWork(quantity: 100, quantityExplanation: "quantityExplanation"),
      PouringConcrete(quantity: 100, quantityExplanation: "quantityExplanation"),
      Rebar(quantity: 100, quantityExplanation: "quantityExplanation"),
      HollowFloorFilling(quantity: 100, quantityExplanation: "quantityExplanation"),
      FoundationWaterproofing(quantity: 100, quantityExplanation: "quantityExplanation"),
      CurtainWaterproofing(quantity: 100, quantityExplanation: "quantityExplanation"),
      CurtainProtectionBeforeFilling(quantity: 100, quantityExplanation: "quantityExplanation"),
      WallMaterial(quantity: 100, quantityExplanation: "quantityExplanation"),
      WallWorkmanShip(quantity: 100, quantityExplanation: "quantityExplanation"),
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

  double get foundationStabilizationVolume {
    return excavationArea * projectConstants.stabilizationHeight * projectConstants.gravelTonForOneCubicMeter;
  }

  String get foundationStabilizationWeightExplanation {
    return "Hafriyat alanı: $excavationArea x Temel altı stabilizasyon malzemesi yüksekliği: ${projectConstants.stabilizationHeight} x 1 m3 mıcır: ${projectConstants.gravelTonForOneCubicMeter} ton";
  }
}

class RoofCostCalculator extends CostCalculator {
  RoofCostCalculator({
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

class FacadeCostCalculator extends CostCalculator {
  FacadeCostCalculator({
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

class InteriorCostCalculator extends CostCalculator {
  InteriorCostCalculator({
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

    ];
  }
}



// class InteriorCostTemplate extends CostTemplate {
//   InteriorCostTemplate(
//       {
//         super.name = "İç İmalat Maliyeti"
//       }
//       ){
//     enabledCostCategories = [
//       CostCategory(MainCategory.interiorJobs, JobCategory.interiorPlastering, UnitPriceCategory.plaster,),
//       CostCategory(MainCategory.interiorJobs, JobCategory.interiorPainting, UnitPriceCategory.painting,),
//       CostCategory(MainCategory.interiorJobs, JobCategory.interiorWaterproofing, UnitPriceCategory.cementBasedFlexInsulation,),
//       CostCategory(MainCategory.interiorJobs, JobCategory.ceilingCovering, UnitPriceCategory.drywall,),
//       CostCategory(MainCategory.interiorJobs, JobCategory.covingPlaster, UnitPriceCategory.covingPlaster,),
//       CostCategory(MainCategory.interiorJobs, JobCategory.screeding, UnitPriceCategory.screed300Doses,),
//       CostCategory(MainCategory.interiorJobs, JobCategory.marble, UnitPriceCategory.marbleFloorBilecik,),
//       CostCategory(MainCategory.interiorJobs, JobCategory.marbleStep, UnitPriceCategory.marbleStepBilecik,),
//       CostCategory(MainCategory.interiorJobs, JobCategory.marbleWindowsill, UnitPriceCategory.marbleWindowsillBilecik,),
//       CostCategory(MainCategory.interiorJobs, JobCategory.stairRailings, UnitPriceCategory.aluminumRailing,),
//       CostCategory(MainCategory.interiorJobs, JobCategory.ceramicTile, UnitPriceCategory.ceramicTileVitraVersus),
//       CostCategory(MainCategory.interiorJobs, JobCategory.parquetTile, UnitPriceCategory.laminatedSerifoglu),
//       CostCategory(MainCategory.interiorJobs, JobCategory.steelDoor, UnitPriceCategory.steelDoorKale),
//       CostCategory(MainCategory.interiorJobs, JobCategory.entranceDoor, UnitPriceCategory.entranceDoor),
//       CostCategory(MainCategory.interiorJobs, JobCategory.fireDoor, UnitPriceCategory.ironFireDoor),
//       CostCategory(MainCategory.interiorJobs, JobCategory.woodenDoor, UnitPriceCategory.lacqueredDoorArtella),
//       CostCategory(MainCategory.interiorJobs, JobCategory.kitchenCupboard, UnitPriceCategory.shinyLacqueredKitchenCupboardAster),
//       CostCategory(MainCategory.interiorJobs, JobCategory.kitchenCounter, UnitPriceCategory.quartzCountertopCimstone),
//       CostCategory(MainCategory.interiorJobs, JobCategory.coatCabinet, UnitPriceCategory.lacqueredCabinet),
//       CostCategory(MainCategory.interiorJobs, JobCategory.bathroomCabinet, UnitPriceCategory.lacqueredCabinet),
//       CostCategory(MainCategory.interiorJobs, JobCategory.floorPlinth, UnitPriceCategory.lacqueredFloorPlinth),
//       CostCategory(MainCategory.mechanicalJobs, JobCategory.mechanicalInfrastructure, UnitPriceCategory.mechanicalInfrastructure),
//       CostCategory(MainCategory.mechanicalJobs, JobCategory.airConditioner, UnitPriceCategory.airConditionerArcelik),
//       CostCategory(MainCategory.mechanicalJobs, JobCategory.ventilation, UnitPriceCategory.ventilation),
//       CostCategory(MainCategory.mechanicalJobs, JobCategory.waterTank, UnitPriceCategory.galvanize25TonWaterTankEsinoks),
//       CostCategory(MainCategory.mechanicalJobs, JobCategory.elevation, UnitPriceCategory.elevation10PersonKone),
//       CostCategory(MainCategory.mechanicalJobs, JobCategory.elevation, UnitPriceCategory.elevation6PersonKone),
//       CostCategory(MainCategory.mechanicalJobs, JobCategory.sink, UnitPriceCategory.sinkVitra),
//       CostCategory(MainCategory.mechanicalJobs, JobCategory.sinkBattery, UnitPriceCategory.sinkBatteryVitra),
//       CostCategory(MainCategory.mechanicalJobs, JobCategory.concealedCistern, UnitPriceCategory.concealedCisternVitra),
//       CostCategory(MainCategory.mechanicalJobs, JobCategory.shower, UnitPriceCategory.showerHuppe100x100),
//       CostCategory(MainCategory.mechanicalJobs, JobCategory.showerBattery, UnitPriceCategory.showerBatteryVitra),
//       CostCategory(MainCategory.mechanicalJobs, JobCategory.kitchenFaucetAndSink, UnitPriceCategory.kitchenFaucetAndSinkFranke),
//       CostCategory(MainCategory.electricalJobs, JobCategory.electricalInfrastructure, UnitPriceCategory.electricalInfrastructure),
//       CostCategory(MainCategory.electricalJobs, JobCategory.generator, UnitPriceCategory.generatorAksa160),
//       CostCategory(MainCategory.electricalJobs, JobCategory.householdAppliances, UnitPriceCategory.paddleBoxBuiltInOvenCookTopDishwasherFranke),
//     ];
//   }
// }
//
// class LandscapeCostTemplate extends CostTemplate {
//   LandscapeCostTemplate(
//       {
//         super.name = "Peysaj Maliyeti"
//       }
//       ){
//     enabledCostCategories = [
//       CostCategory(MainCategory.landscapeJobs, JobCategory.landScapeGarden, UnitPriceCategory.averageGarden),
//       CostCategory(MainCategory.landscapeJobs, JobCategory.outdoorParkingTile, UnitPriceCategory.interlockingPavingStone),
//       CostCategory(MainCategory.landscapeJobs, JobCategory.automaticBarrier, UnitPriceCategory.automaticBarrier),
//     ];
//   }
// }
//
// class GeneralExpensesCostTemplate extends CostTemplate {
//   GeneralExpensesCostTemplate(
//       {
//         super.name = "Genel Giderler"
//       }
//       ){
//     enabledCostCategories = [
//       CostCategory(MainCategory.generalExpenses, JobCategory.enclosingTheLand, UnitPriceCategory.trapezoidalSheetCurtain),
//       CostCategory(MainCategory.generalExpenses, JobCategory.mobilizationDemobilization, UnitPriceCategory.mobilizationDemobilization),
//       CostCategory(MainCategory.generalExpenses, JobCategory.crane, UnitPriceCategory.crane15Ton),
//       CostCategory(MainCategory.generalExpenses, JobCategory.siteSafety, UnitPriceCategory.siteSafety),
//       CostCategory(MainCategory.generalExpenses, JobCategory.siteExpenses, UnitPriceCategory.siteExpenses),
//       CostCategory(MainCategory.generalExpenses, JobCategory.sergeant, UnitPriceCategory.sergeantGrossWage),
//       CostCategory(MainCategory.generalExpenses, JobCategory.projectManager, UnitPriceCategory.projectManagerGrossWage),
//       CostCategory(MainCategory.generalExpenses, JobCategory.projectsFeesPayments, UnitPriceCategory.projectsFeesPayments),
//     ];
//   }
// }
//