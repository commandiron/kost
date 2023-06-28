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
      CostCategory.a1,
      CostCategory.a2,
      CostCategory.a3,
      CostCategory.b1,
      CostCategory.b2,
      CostCategory.b3,
      CostCategory.b4,
      CostCategory.b6,
      CostCategory.b7,
      CostCategory.b8,
      CostCategory.b9,
      CostCategory.b10,
      CostCategory.b11,
      CostCategory.b12,
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
      CostCategory.c1,
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
      CostCategory.d1,
      CostCategory.d2,
      CostCategory.d3,
      CostCategory.d4,
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
      CostCategory.e1,
      CostCategory.e2,
      CostCategory.e3,
      CostCategory.e4,
      CostCategory.e5,
      CostCategory.e6,
      CostCategory.e7,
      CostCategory.e8,
      CostCategory.e9,
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