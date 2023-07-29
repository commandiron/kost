import 'cost_category.dart';

class Cost {
  CostCategory category;
  String unitPriceExplanationText;
  String unitPriceText;
  String quantityText;
  String quantityUnitText;
  String quantityExplanationText;
  String formattedTotalPriceTRY;
  double totalPriceTRY;

  Cost({
    required this.category,
    required this.unitPriceExplanationText,
    required this.unitPriceText,
    required this.quantityText,
    required this.quantityUnitText,
    required this.quantityExplanationText,
    required this.formattedTotalPriceTRY,
    required this.totalPriceTRY,
  });

  Cost copyWith({
    CostCategory? category,
    String? unitPriceExplanationText,
    String? unitPriceText,
    String? quantityText,
    String? quantityUnitText,
    String? quantityExplanationText,
    String? formattedTotalPriceTRY,
    double? totalPriceTRY,
  }) {
    return Cost(
      category: category ?? this.category,
      unitPriceExplanationText: unitPriceExplanationText ?? this.unitPriceExplanationText,
      unitPriceText: unitPriceText ?? this.unitPriceText,
      quantityText: quantityText ?? this.quantityText,
      quantityUnitText: quantityUnitText ?? this.quantityUnitText,
      quantityExplanationText: quantityExplanationText ?? this.quantityExplanationText,
      formattedTotalPriceTRY: formattedTotalPriceTRY ?? this.formattedTotalPriceTRY,
      totalPriceTRY: totalPriceTRY ?? this.totalPriceTRY,
    );
  }
}
