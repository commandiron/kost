import '../category/category.dart';
import 'cost_category.dart';

abstract class CostTemplate {
  List<CostCategory> enabledCostCategories;
  final String name;

  CostTemplate(
    {
      this.enabledCostCategories = const [],
      required this.name
    }
  );
}

class EmptyCostTemplate extends CostTemplate {
  EmptyCostTemplate(
    {
      super.name = "Boş Taslak"
    }
  );
}

class RoughConstructionCostTemplate extends CostTemplate {
  RoughConstructionCostTemplate(
    {
      super.name = "Kaba İnşaat Maliyeti"
    }
  ){
    enabledCostCategories = [
      CostCategory(MainCategory.excavationJobs, JobCategory.shoring, UnitPriceCategory.shutCrete,),
      CostCategory(MainCategory.excavationJobs, JobCategory.excavation, UnitPriceCategory.excavation,),
      CostCategory(MainCategory.excavationJobs, JobCategory.breaker, UnitPriceCategory.breaker,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.foundationStabilization, UnitPriceCategory.foundationStabilizationGravel,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.subFoundationConcrete, UnitPriceCategory.c16Concrete,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.concreteFormWork, UnitPriceCategory.plywood,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.pouringConcrete, UnitPriceCategory.c35Concrete,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.rebar, UnitPriceCategory.s420Steel,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.hollowFloorFilling, UnitPriceCategory.eps,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.foundationWaterproofing, UnitPriceCategory.proofBitumenMembrane,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.curtainWaterproofing, UnitPriceCategory.cementSliding,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.curtainProtectionBeforeFilling, UnitPriceCategory.drainPlate,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.wallMaterial, UnitPriceCategory.aeratedConcreteMaterial,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.wallWorkmanShip, UnitPriceCategory.aeratedConcreteLabor,),
    ];
  }
}

class RoofingCostTemplate extends CostTemplate {
  RoofingCostTemplate(
      {
        super.name = "Çatı Maliyeti"
      }
      ){
    enabledCostCategories = [
      CostCategory(MainCategory.roofJobs, JobCategory.roofing, UnitPriceCategory.steelConstructionBraasRoof,),
    ];
  }
}

class FacadeCostTemplate extends CostTemplate {
  FacadeCostTemplate(
      {
        super.name = "Cephe Maliyeti"
      }
  ){
    enabledCostCategories = [
      CostCategory(MainCategory.facadeJobs, JobCategory.facadeScaffolding, UnitPriceCategory.steelScaffolding),
      CostCategory(MainCategory.facadeJobs, JobCategory.windows, UnitPriceCategory.windowJoineryRehau,),
      CostCategory(MainCategory.facadeJobs, JobCategory.facadeRails, UnitPriceCategory.aluminumRailing,),
      CostCategory(MainCategory.facadeJobs, JobCategory.facadeSystem, UnitPriceCategory.ceramicFacade,),
    ];
  }
}

class InteriorCostTemplate extends CostTemplate {
  InteriorCostTemplate(
      {
        super.name = "İç İmalat Maliyeti"
      }
      ){
    enabledCostCategories = [
      CostCategory(MainCategory.interiorJobs, JobCategory.interiorPlastering, UnitPriceCategory.plaster,),
      CostCategory(MainCategory.interiorJobs, JobCategory.interiorPainting, UnitPriceCategory.painting,),
      CostCategory(MainCategory.interiorJobs, JobCategory.interiorWaterproofing, UnitPriceCategory.cementBasedFlexInsulation,),
      CostCategory(MainCategory.interiorJobs, JobCategory.ceilingCovering, UnitPriceCategory.drywall,),
      CostCategory(MainCategory.interiorJobs, JobCategory.covingPlaster, UnitPriceCategory.covingPlaster,),
      CostCategory(MainCategory.interiorJobs, JobCategory.screeding, UnitPriceCategory.screed,),
      CostCategory(MainCategory.interiorJobs, JobCategory.marble, UnitPriceCategory.marbleFloorBilecik,),
      CostCategory(MainCategory.interiorJobs, JobCategory.marbleStep, UnitPriceCategory.marbleStepBilecik,),
      CostCategory(MainCategory.interiorJobs, JobCategory.marbleWindowsill, UnitPriceCategory.marbleWindowsillBilecik,),
      CostCategory(MainCategory.interiorJobs, JobCategory.stairRailings, UnitPriceCategory.aluminumRailing,),
      CostCategory(MainCategory.interiorJobs, JobCategory.ceramicTile, UnitPriceCategory.ceramicTileVitraVersus),
      CostCategory(MainCategory.interiorJobs, JobCategory.parquetTile, UnitPriceCategory.laminatedSerifoglu),
      CostCategory(MainCategory.interiorJobs, JobCategory.steelDoor, UnitPriceCategory.steelDoorKale),
      CostCategory(MainCategory.interiorJobs, JobCategory.entranceDoor, UnitPriceCategory.entranceDoor),
      CostCategory(MainCategory.interiorJobs, JobCategory.fireDoor, UnitPriceCategory.ironFireDoor),
      CostCategory(MainCategory.interiorJobs, JobCategory.woodenDoor, UnitPriceCategory.lacqueredDoor),
      CostCategory(MainCategory.interiorJobs, JobCategory.kitchenCupboard, UnitPriceCategory.shinyLacqueredKitchenCupboardAster),
      CostCategory(MainCategory.interiorJobs, JobCategory.kitchenCounter, UnitPriceCategory.quartzCountertopCimstone),
      CostCategory(MainCategory.interiorJobs, JobCategory.coatCabinet, UnitPriceCategory.lacqueredCabinet),
      CostCategory(MainCategory.interiorJobs, JobCategory.bathroomCabinet, UnitPriceCategory.lacqueredCabinet),
      CostCategory(MainCategory.interiorJobs, JobCategory.floorPlinth, UnitPriceCategory.lacqueredFloorPlinth),
      CostCategory(MainCategory.mechanicalJobs, JobCategory.mechanicalInfrastructure, UnitPriceCategory.mechanicalInfrastructure),
      CostCategory(MainCategory.mechanicalJobs, JobCategory.airConditioner, UnitPriceCategory.airConditionerArcelik),
      CostCategory(MainCategory.mechanicalJobs, JobCategory.ventilation, UnitPriceCategory.ventilation),
      CostCategory(MainCategory.mechanicalJobs, JobCategory.waterTank, UnitPriceCategory.galvanize25TonWaterTankEsinoks),
      CostCategory(MainCategory.mechanicalJobs, JobCategory.elevation, UnitPriceCategory.elevation10PersonKone),
      CostCategory(MainCategory.mechanicalJobs, JobCategory.elevation, UnitPriceCategory.elevation6PersonKone),
      CostCategory(MainCategory.mechanicalJobs, JobCategory.sink, UnitPriceCategory.sinkVitra),
      CostCategory(MainCategory.mechanicalJobs, JobCategory.sinkBattery, UnitPriceCategory.sinkBatteryVitra),
      CostCategory(MainCategory.mechanicalJobs, JobCategory.concealedCistern, UnitPriceCategory.concealedCisternVitra),
      CostCategory(MainCategory.mechanicalJobs, JobCategory.shower, UnitPriceCategory.showerHuppe),
      CostCategory(MainCategory.mechanicalJobs, JobCategory.showerBattery, UnitPriceCategory.showerBatteryVitra),
      CostCategory(MainCategory.mechanicalJobs, JobCategory.kitchenFaucetAndSink, UnitPriceCategory.kitchenFaucetAndSinkFranke),
      CostCategory(MainCategory.electricalJobs, JobCategory.electricalInfrastructure, UnitPriceCategory.electricalInfrastructure),
      CostCategory(MainCategory.electricalJobs, JobCategory.generator, UnitPriceCategory.generatorAksa160),
      CostCategory(MainCategory.electricalJobs, JobCategory.householdAppliances, UnitPriceCategory.paddleBoxBuiltInOvenCookTopDishwasherFranke),
    ];
  }
}

class LandscapeCostTemplate extends CostTemplate {
  LandscapeCostTemplate(
      {
        super.name = "Peysaj Maliyeti"
      }
      ){
    enabledCostCategories = [
      CostCategory(MainCategory.landscapeJobs, JobCategory.landScapeGarden, UnitPriceCategory.averageGarden),
      CostCategory(MainCategory.landscapeJobs, JobCategory.outdoorParkingTile, UnitPriceCategory.interlockingPavingStone),
      CostCategory(MainCategory.landscapeJobs, JobCategory.automaticBarrier, UnitPriceCategory.automaticBarrier),
    ];
  }
}

class GeneralExpensesCostTemplate extends CostTemplate {
  GeneralExpensesCostTemplate(
      {
        super.name = "Genel Giderler"
      }
      ){
    enabledCostCategories = [
      CostCategory(MainCategory.generalExpenses, JobCategory.enclosingTheLand, UnitPriceCategory.trapezoidalSheetCurtain),
      CostCategory(MainCategory.generalExpenses, JobCategory.mobilizationDemobilization, UnitPriceCategory.mobilizationDemobilization),
      CostCategory(MainCategory.generalExpenses, JobCategory.crane, UnitPriceCategory.crane15Ton),
      CostCategory(MainCategory.generalExpenses, JobCategory.siteSafety, UnitPriceCategory.siteSafety),
      CostCategory(MainCategory.generalExpenses, JobCategory.siteExpenses, UnitPriceCategory.siteExpenses),
      CostCategory(MainCategory.generalExpenses, JobCategory.sergeant, UnitPriceCategory.sergeantGrossWage),
      CostCategory(MainCategory.generalExpenses, JobCategory.projectManager, UnitPriceCategory.projectManagerGrossWage),
      CostCategory(MainCategory.generalExpenses, JobCategory.projectsFeesPayments, UnitPriceCategory.projectsFeesPayments),
    ];
  }
}

class BuildingCostTemplate extends CostTemplate {
  BuildingCostTemplate(
      {
        super.name = "Apartman Maliyeti"
      }
  ){
    enabledCostCategories = [
      ...RoughConstructionCostTemplate().enabledCostCategories,
      ...RoofingCostTemplate().enabledCostCategories,
      ...FacadeCostTemplate().enabledCostCategories,
      ...InteriorCostTemplate().enabledCostCategories,
      ...LandscapeCostTemplate().enabledCostCategories,
      ...GeneralExpensesCostTemplate().enabledCostCategories,
    ];
  }
}