import 'cost_category.dart';

class Cost {
  CostCategory category;
  String unitPriceExplanation;
  String formattedUnitPrice;
  String formattedQuantity;
  String quantityExplanation;
  double totalPriceTRY;
  String formattedTotalPriceTRY;

  Cost({
    required this.category,
    required this.unitPriceExplanation,
    required this.formattedUnitPrice,
    required this.formattedQuantity,
    required this.quantityExplanation,
    required this.totalPriceTRY,
    required this.formattedTotalPriceTRY,
  });

  Cost copyWith({
    CostCategory? category,
    String? unitPriceExplanation,
    String? formattedUnitPrice,
    String? formattedQuantity,
    String? quantityExplanation,
    double? totalPriceTRY,
    String? formattedTotalPriceTRY,
  }) {
    return Cost(
      category: category ?? this.category,
      unitPriceExplanation: unitPriceExplanation ?? this.unitPriceExplanation,
      formattedUnitPrice: formattedUnitPrice ?? this.formattedUnitPrice,
      formattedQuantity: formattedQuantity ?? this.formattedQuantity,
      quantityExplanation: quantityExplanation ?? this.quantityExplanation,
      totalPriceTRY: totalPriceTRY ?? this.totalPriceTRY,
      formattedTotalPriceTRY: formattedTotalPriceTRY ?? this.formattedTotalPriceTRY,
    );
  }
}
