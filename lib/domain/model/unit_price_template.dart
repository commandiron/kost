import 'category.dart';

abstract class CostTemplate {
  List<UnitPriceCategory> enabledUnitPriceCategories;

  CostTemplate(
    {
      this.enabledUnitPriceCategories = const [],
    }
  );
}

class EmptyCostTemplate extends CostTemplate {
  EmptyCostTemplate();
}

class BuildingCostTemplate extends CostTemplate {
  BuildingCostTemplate(){
    enabledUnitPriceCategories = [
      UnitPriceCategory.shutcrete,
      UnitPriceCategory.excavation,
      UnitPriceCategory.breaker,
      UnitPriceCategory.foundationStabilizationGravel,
      UnitPriceCategory.c16Concrete,
      UnitPriceCategory.c30Concrete,
      UnitPriceCategory.s420Steel,
      UnitPriceCategory.plywood
    ];
  }
}

