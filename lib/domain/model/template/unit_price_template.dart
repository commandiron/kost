import '../category/category.dart';

abstract class CostTemplate {
  List<UnitPriceCategory> enabledUnitPriceCategories;
  final String name;

  CostTemplate(
    {
      this.enabledUnitPriceCategories = const [],
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
    enabledUnitPriceCategories = [
      UnitPriceCategory.shutCrete,
      UnitPriceCategory.excavation,
      UnitPriceCategory.breaker,
      UnitPriceCategory.foundationStabilizationGravel,
      UnitPriceCategory.c16Concrete,
      UnitPriceCategory.plywood,
      UnitPriceCategory.c30Concrete,
      UnitPriceCategory.s420Steel,
      UnitPriceCategory.eps,
      UnitPriceCategory.doubleLayerBitumenMembrane,
      UnitPriceCategory.bitumenSliding,
      UnitPriceCategory.drainPlate,
      UnitPriceCategory.aeratedConcreteMaterial,
      UnitPriceCategory.aeratedConcreteWorkmanShip
    ];
  }
}

class RoofingCostTemplate extends CostTemplate {
  RoofingCostTemplate(
      {
        super.name = "Çatı Maliyeti"
      }
      ){
    enabledUnitPriceCategories = [
      UnitPriceCategory.steelConstructionBraasRoof
    ];
  }
}

class FacadeCostTemplate extends CostTemplate {
  FacadeCostTemplate(
      {
        super.name = "Cephe Maliyeti"
      }
  ){
    enabledUnitPriceCategories = [
      UnitPriceCategory.steelScaffolding,
      UnitPriceCategory.windowJoineryRehau,
      UnitPriceCategory.wroughtIronRailing,
      UnitPriceCategory.ceramicFacade,
    ];
  }
}

class InteriorCostTemplate extends CostTemplate {
  InteriorCostTemplate(
      {
        super.name = "İç İmalat Maliyeti"
      }
      ){
    enabledUnitPriceCategories = [
      UnitPriceCategory.plaster,
      UnitPriceCategory.painting,
      UnitPriceCategory.cementBasedFlexInsulation,
      UnitPriceCategory.drywall,
      UnitPriceCategory.covingPlaster,
      UnitPriceCategory.screed,
    ];
  }
}

class BuildingCostTemplate extends CostTemplate {
  BuildingCostTemplate(
      {
        super.name = "Apartman Maliyeti"
      }
  ){
    enabledUnitPriceCategories = [
      ...RoughConstructionCostTemplate().enabledUnitPriceCategories,
      ...RoofingCostTemplate().enabledUnitPriceCategories,
      ...FacadeCostTemplate().enabledUnitPriceCategories,
      ...InteriorCostTemplate().enabledUnitPriceCategories,
    ];
  }
}