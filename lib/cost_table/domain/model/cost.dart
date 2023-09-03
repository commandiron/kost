import 'package:kost/common/model/unit_price/unit_price.dart';

import '../../../common/model/job.dart';

class Cost {
  MainCategory mainCategory;
  String jobId;
  String jobName;
  List<UnitPrice> enabledUnitPrices;
  String unitPriceNameText;
  String unitPriceAmountText;
  String quantityText;
  String quantityUnitText;
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
      totalPriceTRY: totalPriceTRY ?? this.totalPriceTRY,
      formattedTotalPriceTRY: formattedTotalPriceTRY ?? this.formattedTotalPriceTRY,
    );
  }
}
