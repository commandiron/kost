import 'package:kost/cost_table/domain/model/unit_price/unit_price.dart';

import '../../../../quantity_details/domain/model/job_calculator/job.dart';

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
  double totalPriceTRY;
  String formattedTotalPriceTRY;

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
    required this.totalPriceTRY,
    required this.formattedTotalPriceTRY,
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
    double? totalPriceTRY,
    String? formattedTotalPriceTRY,
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
      totalPriceTRY: totalPriceTRY ?? this.totalPriceTRY,
      formattedTotalPriceTRY: formattedTotalPriceTRY ?? this.formattedTotalPriceTRY,
    );
  }
}
