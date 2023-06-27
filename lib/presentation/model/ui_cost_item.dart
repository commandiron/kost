import '../../domain/model/cost/cost_category.dart';

class UiCostItem {
  CostCategory category;
  String formattedUnitPrice;
  String formattedQuantity;
  String quantityExplanation;
  double totalPriceTRY;
  String formattedTotalPriceTRY;

  UiCostItem(
    {
      required this.category,
      required this.formattedUnitPrice,
      required this.formattedQuantity,
      required this.quantityExplanation,
      required this.totalPriceTRY,
      required this.formattedTotalPriceTRY,
    }
  );
}