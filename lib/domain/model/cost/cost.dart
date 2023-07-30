import 'cost_category.dart';

class Cost {
  String id;
  CostCategory category;
  String unitPriceNameText;
  String unitPriceAmountText;
  String quantityText;
  String quantityUnitText;
  String quantityExplanationText;
  String formattedTotalPriceTRY;
  double totalPriceTRY;
  bool visible;

  Cost({
    required this.id,
    required this.category,
    required this.unitPriceNameText,
    required this.unitPriceAmountText,
    required this.quantityText,
    required this.quantityUnitText,
    required this.quantityExplanationText,
    required this.formattedTotalPriceTRY,
    required this.totalPriceTRY,
    required this.visible,
  });

  Cost copyWith({
    String? id,
    CostCategory? category,
    String? unitPriceNameText,
    String? unitPriceAmountText,
    String? quantityText,
    String? quantityUnitText,
    String? quantityExplanationText,
    String? formattedTotalPriceTRY,
    double? totalPriceTRY,
    bool? visible,
  }) {
    return Cost(
      id: id ?? this.id,
      category: category ?? this.category,
      unitPriceNameText: unitPriceNameText ?? this.unitPriceNameText,
      unitPriceAmountText: unitPriceAmountText ?? this.unitPriceAmountText,
      quantityText: quantityText ?? this.quantityText,
      quantityUnitText: quantityUnitText ?? this.quantityUnitText,
      quantityExplanationText: quantityExplanationText ?? this.quantityExplanationText,
      formattedTotalPriceTRY: formattedTotalPriceTRY ?? this.formattedTotalPriceTRY,
      totalPriceTRY: totalPriceTRY ?? this.totalPriceTRY,
      visible: visible ?? this.visible,
    );
  }
}
