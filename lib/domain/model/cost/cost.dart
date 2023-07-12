import 'cost_category.dart';

class Cost {
  CostCategory category;
  String formattedUnitPrice;
  String formattedQuantity;
  String quantityExplanation;
  double totalPriceTRY;
  String formattedTotalPriceTRY;
  bool hidden;

  Cost({
    required this.category,
    required this.formattedUnitPrice,
    required this.formattedQuantity,
    required this.quantityExplanation,
    required this.totalPriceTRY,
    required this.formattedTotalPriceTRY,
    required this.hidden,
  });
}
