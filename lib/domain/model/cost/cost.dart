import 'cost_category.dart';

class Cost {
  CostCategory category;
  String unitPriceExplanationTr;
  String formattedUnitPrice;
  String formattedQuantity;
  String quantityExplanation;
  double totalPriceTRY;
  String formattedTotalPriceTRY;

  Cost({
    required this.category,
    required this.unitPriceExplanationTr,
    required this.formattedUnitPrice,
    required this.formattedQuantity,
    required this.quantityExplanation,
    required this.totalPriceTRY,
    required this.formattedTotalPriceTRY,
  });

  Cost copyWith({
    CostCategory? category,
    String? unitPriceExplanationTr,
    String? formattedUnitPrice,
    String? formattedQuantity,
    String? quantityExplanation,
    double? totalPriceTRY,
    String? formattedTotalPriceTRY,
  }) {
    return Cost(
      category: category ?? this.category,
      unitPriceExplanationTr: unitPriceExplanationTr ?? this.unitPriceExplanationTr,
      formattedUnitPrice: formattedUnitPrice ?? this.formattedUnitPrice,
      formattedQuantity: formattedQuantity ?? this.formattedQuantity,
      quantityExplanation: quantityExplanation ?? this.quantityExplanation,
      totalPriceTRY: totalPriceTRY ?? this.totalPriceTRY,
      formattedTotalPriceTRY: formattedTotalPriceTRY ?? this.formattedTotalPriceTRY,
    );
  }
}
