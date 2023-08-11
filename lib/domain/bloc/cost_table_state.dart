import 'package:equatable/equatable.dart';
import 'package:kost/domain/model/unit_price/currency.dart';
import 'package:kost/domain/model/job/job_quantity_calculator.dart';
import '../model/job/job.dart';
import '../model/cost/cost.dart';
import '../model/unit_price/unit_price.dart';

class CostTableState extends Equatable {
  final JobQuantityCalculator jobQuantityCalculator;
  final List<UnitPrice> unitPricePool;
  final CurrencyRates currencyRates;
  final List<Cost> costs;
  final Map<MainCategory, bool> categoryVisibilities;
  final Map<MainCategory, String> formattedSubTotalsTRY;
  final String formattedGrandTotalTRY;

  const CostTableState({
    required this.jobQuantityCalculator,
    required this.unitPricePool,
    required this.currencyRates,
    required this.costs,
    required this.categoryVisibilities,
    required this.formattedSubTotalsTRY,
    required this.formattedGrandTotalTRY,
  });

  CostTableState copyWith({
    JobQuantityCalculator? jobQuantityCalculator,
    List<UnitPrice>? unitPricePool,
    CurrencyRates? currencyRates,
    List<Cost>? costs,
    Map<MainCategory, bool>? categoryVisibilities,
    Map<MainCategory, String>? formattedSubTotalsTRY,
    String? formattedGrandTotalTRY,
  }) {
    return CostTableState(
      jobQuantityCalculator: jobQuantityCalculator ?? this.jobQuantityCalculator,
      unitPricePool: unitPricePool ?? this.unitPricePool,
      currencyRates: currencyRates ?? this.currencyRates,
      costs: costs ?? this.costs,
      categoryVisibilities: categoryVisibilities ?? this.categoryVisibilities,
      formattedSubTotalsTRY: formattedSubTotalsTRY ?? this.formattedSubTotalsTRY,
      formattedGrandTotalTRY: formattedGrandTotalTRY ?? this.formattedGrandTotalTRY
    );
  }

  @override
  List<Object?> get props => [
    jobQuantityCalculator,
    unitPricePool,
    currencyRates,
    costs.hashCode,
    categoryVisibilities.hashCode,
    formattedSubTotalsTRY,
    formattedGrandTotalTRY
  ];
}
