import 'cost_category.dart';

class Cost {
  CostCategory category;
  String formattedUnitPrice;
  String formattedQuantity;
  String quantityExplanation;
  double totalPriceTRY;
  String formattedTotalPriceTRY;
  bool visible;

  Cost({
    required this.category,
    required this.formattedUnitPrice,
    required this.formattedQuantity,
    required this.quantityExplanation,
    required this.totalPriceTRY,
    required this.formattedTotalPriceTRY,
    required this.visible,
  });

  Cost copyWith({
    CostCategory? category,
    String? formattedUnitPrice,
    String? formattedQuantity,
    String? quantityExplanation,
    double? totalPriceTRY,
    String? formattedTotalPriceTRY,
    bool? visible,
  }) {
    return Cost(
      category: category ?? this.category,
      formattedUnitPrice: formattedUnitPrice ?? this.formattedUnitPrice,
      formattedQuantity: formattedQuantity ?? this.formattedQuantity,
      quantityExplanation: quantityExplanation ?? this.quantityExplanation,
      totalPriceTRY: totalPriceTRY ?? this.totalPriceTRY,
      formattedTotalPriceTRY: formattedTotalPriceTRY ?? this.formattedTotalPriceTRY,
      visible: visible ?? this.visible,
    );
  }
}
