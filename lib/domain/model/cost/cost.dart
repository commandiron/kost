import 'cost_category.dart';

class Cost {
  CostCategory category;
  String unitPriceExplanationTr;
  String formattedUnitPrice;
  String formattedQuantity;
  String quantityUnit;
  String quantityExplanation;
  String formattedTotalPriceTRY;
  double totalPriceTRY;

  Cost({
    required this.category,
    required this.unitPriceExplanationTr,
    required this.formattedUnitPrice,
    required this.formattedQuantity,
    required this.quantityUnit,
    required this.quantityExplanation,
    required this.formattedTotalPriceTRY,
    required this.totalPriceTRY,
  });

  Cost copyWith({
    CostCategory? category,
    String? unitPriceExplanationTr,
    String? formattedUnitPrice,
    String? formattedQuantity,
    String? quantityUnit,
    String? quantityExplanation,
    String? formattedTotalPriceTRY,
    double? totalPriceTRY,
  }) {
    return Cost(
      category: category ?? this.category,
      unitPriceExplanationTr: unitPriceExplanationTr ?? this.unitPriceExplanationTr,
      formattedUnitPrice: formattedUnitPrice ?? this.formattedUnitPrice,
      formattedQuantity: formattedQuantity ?? this.formattedQuantity,
      quantityUnit: quantityUnit ?? this.quantityUnit,
      quantityExplanation: quantityExplanation ?? this.quantityExplanation,
      formattedTotalPriceTRY: formattedTotalPriceTRY ?? this.formattedTotalPriceTRY,
      totalPriceTRY: totalPriceTRY ?? this.totalPriceTRY,
    );
  }
}
