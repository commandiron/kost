import '../category/category.dart';

class CostCategory {
  CostCategory(
    this.mainCategory,
    this.jobCategory,
    this.unitPriceCategory
  );
  final MainCategory mainCategory;
  final JobCategory jobCategory;
  final UnitPriceCategory unitPriceCategory;
}