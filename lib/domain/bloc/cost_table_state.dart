import 'package:equatable/equatable.dart';
import 'package:kost/domain/model/unit_price/currency.dart';
import 'package:kost/domain/model/cost/cost_template.dart';
import '../model/cost/category.dart';
import '../model/cost/cost.dart';
import '../model/unit_price/unit_price.dart';
import '../calculator/quantity_calculator.dart';

class CostTableState extends Equatable {
  final CostTemplate costTemplate;
  final List<UnitPrice> unitPricePool;
  final CurrencyRates currencyRates;
  final QuantityCalculator quantityCalculator;
  final List<Cost> costs;
  final Map<MainCategory, String> formattedSubTotalsTRY;
  final String formattedGrandTotalTRY;

  const CostTableState({
    required this.costTemplate,
    required this.unitPricePool,
    required this.currencyRates,
    required this.quantityCalculator,
    required this.costs,
    required this.formattedSubTotalsTRY,
    required this.formattedGrandTotalTRY,
  });

  CostTableState copyWith({
    CostTemplate? costTemplate,
    List<UnitPrice>? unitPricePool,
    CurrencyRates? currencyRates,
    QuantityCalculator? quantityCalculator,
    List<Cost>? costs,
    Map<MainCategory, String>? formattedSubTotalsTRY,
    String? formattedGrandTotalTRY,
  }) {
    return CostTableState(
      costTemplate: costTemplate ?? this.costTemplate,
      unitPricePool: unitPricePool ?? this.unitPricePool,
      currencyRates: currencyRates ?? this.currencyRates,
      quantityCalculator: quantityCalculator ?? this.quantityCalculator,
      costs: costs ?? this.costs,
      formattedSubTotalsTRY: formattedSubTotalsTRY ?? this.formattedSubTotalsTRY,
      formattedGrandTotalTRY: formattedGrandTotalTRY ?? this.formattedGrandTotalTRY
    );
  }

  @override
  List<Object?> get props => [
        quantityCalculator,
        unitPricePool,
        currencyRates,
        costTemplate,
        costs.hashCode,
        formattedSubTotalsTRY,
        formattedGrandTotalTRY
      ];
}
