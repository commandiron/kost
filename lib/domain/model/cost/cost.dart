import 'cost_category.dart';

class Cost {
  CostCategory category;
  String formattedUnitPrice;
  String formattedQuantity;
  String quantityExplanation;
  double totalPriceTRY;
  String formattedTotalPriceTRY;

  Cost({
    required this.category,
    required this.formattedUnitPrice,
    required this.formattedQuantity,
    required this.quantityExplanation,
    required this.totalPriceTRY,
    required this.formattedTotalPriceTRY,
  });
}