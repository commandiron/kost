import 'package:kost/domain/model/unit_price/unit_price.dart';

import '../job/job.dart';

class Cost {
  MainCategory mainCategory;
  String jobId;
  String jobName;
  List<UnitPrice> enabledUnitPrices;
  String unitPriceNameText;
  String unitPriceAmountText;
  String quantityText;
  String quantityUnitText;
  String quantityExplanationText;
  String formattedTotalPriceTRY;
  double totalPriceTRY;

  Cost({
    required this.mainCategory,
    required this.jobId,
    required this.jobName,
    required this.enabledUnitPrices,
    required this.unitPriceNameText,
    required this.unitPriceAmountText,
    required this.quantityText,
    required this.quantityUnitText,
    required this.quantityExplanationText,
    required this.formattedTotalPriceTRY,
    required this.totalPriceTRY,
  });

  Cost copyWith({
    MainCategory? mainCategory,
    String? jobId,
    String? jobName,
    List<UnitPrice>? enabledUnitPrices,
    String? unitPriceNameText,
    String? unitPriceAmountText,
    String? quantityText,
    String? quantityUnitText,
    String? quantityExplanationText,
    String? formattedTotalPriceTRY,
    double? totalPriceTRY,
  }) {
    return Cost(
      mainCategory: mainCategory ?? this.mainCategory,
      jobId: jobId ?? this.jobId,
      jobName: jobName ?? this.jobName,
      enabledUnitPrices: enabledUnitPrices ?? this.enabledUnitPrices,
      unitPriceNameText: unitPriceNameText ?? this.unitPriceNameText,
      unitPriceAmountText: unitPriceAmountText ?? this.unitPriceAmountText,
      quantityText: quantityText ?? this.quantityText,
      quantityUnitText: quantityUnitText ?? this.quantityUnitText,
      quantityExplanationText: quantityExplanationText ?? this.quantityExplanationText,
      formattedTotalPriceTRY: formattedTotalPriceTRY ?? this.formattedTotalPriceTRY,
      totalPriceTRY: totalPriceTRY ?? this.totalPriceTRY,
    );
  }
}
