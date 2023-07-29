import '../category/category.dart';

class CostCategory {
  CostCategory(
    this.mainCategory,
    this.jobCategory,
    this.unitPriceCategory,
    {this.visible = true}
  );
  final MainCategory mainCategory;
  final JobCategory jobCategory;
  final UnitPriceCategory unitPriceCategory;
  bool visible;
}