import 'cost_category.dart';

class Cost {
  CostCategory category;
  String formattedUnitPrice;
  String unitPriceNameTr;
  String formattedQuantity;
  String quantityExplanation;
  double totalPriceTRY;
  String formattedTotalPriceTRY;

  Cost({
    required this.category,
    required this.formattedUnitPrice,
    required this.unitPriceNameTr,
    required this.formattedQuantity,
    required this.quantityExplanation,
    required this.totalPriceTRY,
    required this.formattedTotalPriceTRY,
  });

  Cost copyWith({
    CostCategory? category,
    String? formattedUnitPrice,
    String? unitPriceNameTr,
    String? formattedQuantity,
    String? quantityExplanation,
    double? totalPriceTRY,
    String? formattedTotalPriceTRY,
  }) {
    return Cost(
      category: category ?? this.category,
      formattedUnitPrice: formattedUnitPrice ?? this.formattedUnitPrice,
      unitPriceNameTr: unitPriceNameTr ?? this.unitPriceNameTr,
      formattedQuantity: formattedQuantity ?? this.formattedQuantity,
      quantityExplanation: quantityExplanation ?? this.quantityExplanation,
      totalPriceTRY: totalPriceTRY ?? this.totalPriceTRY,
      formattedTotalPriceTRY: formattedTotalPriceTRY ?? this.formattedTotalPriceTRY,
    );
  }
}
