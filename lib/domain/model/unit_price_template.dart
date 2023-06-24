import 'category.dart';

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
      UnitPriceCategory.roofing
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
      ...InteriorCostTemplate().enabledUnitPriceCategories,
    ];
  }
}