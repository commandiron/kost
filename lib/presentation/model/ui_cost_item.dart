import '../../domain/model/category/category.dart';

class UiCostItem {
  CostCategory costCategory;
  String formattedUnitPrice;
  String formattedQuantity;
  String quantityExplanation;
  double totalPriceTRY;
  String formattedTotalPriceTRY;

  UiCostItem(
    {
      required this.costCategory,
      required this.formattedUnitPrice,
      required this.formattedQuantity,
      required this.quantityExplanation,
      required this.totalPriceTRY,
      required this.formattedTotalPriceTRY,
    }
  );
}