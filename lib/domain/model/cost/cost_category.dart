import '../category/category.dart';
import '../unit_price/unit_price_category.dart';

class CostCategory {
  const CostCategory(
    this.mainCategory,
    this.jobCategory,
    this.unitPriceCategory,
  );
  final MainCategory mainCategory;
  final JobCategory jobCategory;
  final UnitPriceCategory unitPriceCategory;
}