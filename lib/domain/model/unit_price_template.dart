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

class BuildingCostTemplate extends CostTemplate {
  BuildingCostTemplate(
    {
      super.name = "Apartman Maliyeti"
    }
  ){
    enabledUnitPriceCategories = [
      UnitPriceCategory.shutCrete,
      UnitPriceCategory.excavation,
      UnitPriceCategory.breaker,
      UnitPriceCategory.foundationStabilizationGravel,
      UnitPriceCategory.c16Concrete,
      UnitPriceCategory.c30Concrete,
      UnitPriceCategory.s420Steel,
      UnitPriceCategory.plywood,
      UnitPriceCategory.eps,
      UnitPriceCategory.doubleLayerBitumenMembrane,
      UnitPriceCategory.bitumenSliding,
      UnitPriceCategory.drainPlate,
      UnitPriceCategory.aeratedConcreteMaterial,
      UnitPriceCategory.aeratedConcreteWorkmanShip
    ];
  }
}

