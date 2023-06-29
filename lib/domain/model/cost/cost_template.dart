import '../category/category.dart';
import '../unit_price/unit_price_category.dart';
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
    enabledCostCategories = const [
      CostCategory(MainCategory.excavationJobs, JobCategory.shoring, UnitPriceCategory.shutCrete,),
      CostCategory(MainCategory.excavationJobs, JobCategory.excavation, UnitPriceCategory.excavation,),
      CostCategory(MainCategory.excavationJobs, JobCategory.breaker, UnitPriceCategory.breaker,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.foundationStabilization, UnitPriceCategory.foundationStabilizationGravel,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.subFoundationConcrete, UnitPriceCategory.c16Concrete,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.concreteFormWork, UnitPriceCategory.plywood,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.pouringConcrete, UnitPriceCategory.c30Concrete,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.rebar, UnitPriceCategory.s420Steel,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.hollowFloorFilling, UnitPriceCategory.eps,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.foundationWaterproofing, UnitPriceCategory.doubleLayerBitumenMembrane,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.curtainWaterproofing, UnitPriceCategory.bitumenSliding,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.curtainProtectionBeforeFilling, UnitPriceCategory.drainPlate,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.wallMaterial, UnitPriceCategory.aeratedConcreteMaterial,),
      CostCategory(MainCategory.roughConstructionJobs, JobCategory.wallWorkmanShip, UnitPriceCategory.aeratedConcreteWorkmanShip,),
    ];
  }
}

class RoofingCostTemplate extends CostTemplate {
  RoofingCostTemplate(
      {
        super.name = "Çatı Maliyeti"
      }
      ){
    enabledCostCategories = const [
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
    enabledCostCategories = const [
      CostCategory(MainCategory.facadeJobs, JobCategory.facadeScaffolding, UnitPriceCategory.steelScaffolding),
      CostCategory(MainCategory.facadeJobs, JobCategory.windows, UnitPriceCategory.windowJoineryRehau,),
      CostCategory(MainCategory.facadeJobs, JobCategory.facadeRails, UnitPriceCategory.wroughtIronRailing,),
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
    enabledCostCategories = const [
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
      CostCategory(MainCategory.interiorJobs, JobCategory.ceramicTile, UnitPriceCategory.ceramicTileEge)
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
    ];
  }
}