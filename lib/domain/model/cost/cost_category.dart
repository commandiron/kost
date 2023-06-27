import '../category/category.dart';
import '../unit_price/unit_price_category.dart';

enum CostCategory {
  a1(
    MainCategory.excavationJobs, JobCategory.excavation, UnitPriceCategory.shutCrete,
  ),
  a2(
    MainCategory.excavationJobs, JobCategory.excavation, UnitPriceCategory.excavation,
  ),
  a3(
    MainCategory.excavationJobs, JobCategory.breaker, UnitPriceCategory.breaker,
  ),
  b1(
    MainCategory.roughConstructionJobs, JobCategory.foundationStabilization, UnitPriceCategory.foundationStabilizationGravel,
  ),
  b2(
    MainCategory.roughConstructionJobs, JobCategory.subFoundationConcrete, UnitPriceCategory.c16Concrete,
  ),
  b3(
    MainCategory.roughConstructionJobs, JobCategory.concreteFormWork, UnitPriceCategory.plywood,
  ),
  b4(
    MainCategory.roughConstructionJobs, JobCategory.pouringConcrete, UnitPriceCategory.c30Concrete,
  ),
  b5(
    MainCategory.roughConstructionJobs, JobCategory.pouringConcrete, UnitPriceCategory.c35Concrete,
  ),
  b6(
    MainCategory.roughConstructionJobs, JobCategory.rebar, UnitPriceCategory.s420Steel,
  ),
  b7(
    MainCategory.roughConstructionJobs, JobCategory.hollowFloorFilling, UnitPriceCategory.eps,
  ),
  b8(
    MainCategory.roughConstructionJobs, JobCategory.foundationWaterproofing, UnitPriceCategory.doubleLayerBitumenMembrane,
  ),
  b9(
    MainCategory.roughConstructionJobs, JobCategory.curtainWaterproofing, UnitPriceCategory.bitumenSliding,
  ),
  b10(
    MainCategory.roughConstructionJobs, JobCategory.curtainProtectionBeforeFilling, UnitPriceCategory.drainPlate,
  ),
  b11(
    MainCategory.roughConstructionJobs, JobCategory.wallMaterial, UnitPriceCategory.aeratedConcreteMaterial,
  ),
  b12(
    MainCategory.roughConstructionJobs, JobCategory.wallWorkmanShip, UnitPriceCategory.aeratedConcreteWorkmanShip,
  ),
  c1(
    MainCategory.roofJobs, JobCategory.roofing, UnitPriceCategory.steelConstructionBraasRoof,
  ),
  d1(
    MainCategory.facadeJobs, JobCategory.facadeScaffolding, UnitPriceCategory.steelScaffolding,
  ),
  d2(
    MainCategory.facadeJobs, JobCategory.windows, UnitPriceCategory.windowJoineryRehau,
  ),
  d3(
    MainCategory.facadeJobs, JobCategory.facadeRails, UnitPriceCategory.wroughtIronRailing,
  ),
  d4(
    MainCategory.facadeJobs, JobCategory.facadeSystem, UnitPriceCategory.ceramicFacade,
  ),
  d5(
    MainCategory.facadeJobs, JobCategory.facadeSystem, UnitPriceCategory.precastFacade,
  ),
  e1(
    MainCategory.interiorJobs, JobCategory.interiorPlastering, UnitPriceCategory.plaster,
  ),
  e2(
    MainCategory.interiorJobs, JobCategory.interiorPainting, UnitPriceCategory.painting,
  ),
  e3(
    MainCategory.interiorJobs, JobCategory.interiorWaterproofing, UnitPriceCategory.cementBasedFlexInsulation,
  ),
  e4(
    MainCategory.interiorJobs, JobCategory.ceilingCovering, UnitPriceCategory.drywall,
  ),
  e5(
    MainCategory.interiorJobs, JobCategory.covingPlaster, UnitPriceCategory.covingPlaster,
  ),
  e6(
    MainCategory.interiorJobs, JobCategory.screeding, UnitPriceCategory.screed,
  ),
  e7(
    MainCategory.interiorJobs, JobCategory.marble, UnitPriceCategory.marbleBilecik,
  );
  const CostCategory(
      this.mainCategory,
      this.jobCategory,
      this.unitPriceCategory,
      );
  final MainCategory mainCategory;
  final JobCategory jobCategory;
  final UnitPriceCategory unitPriceCategory;
}