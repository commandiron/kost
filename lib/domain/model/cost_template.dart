import 'category.dart';

abstract class CostTemplate {
  late final List<UnitPriceCategory> unitPriceCategories;
}

class RoughConstructionTemplate extends CostTemplate {
  @override
  List<UnitPriceCategory> get unitPriceCategories => [
    UnitPriceCategory.shutcrete,
    UnitPriceCategory.excavation,
    UnitPriceCategory.breaker,
    UnitPriceCategory.foundationStabilizationGravel
  ];
}