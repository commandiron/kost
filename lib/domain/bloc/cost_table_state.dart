import 'package:equatable/equatable.dart';
import 'package:kost/domain/model/category/category.dart';
import 'package:kost/domain/model/unit_price/currency.dart';
import 'package:kost/domain/model/cost/cost_template.dart';
import '../model/cost/cost.dart';
import '../model/unit_price/unit_price.dart';
import '../calculator/quantity_calculator.dart';

class CostTableState extends Equatable {
  final QuantityCalculator quantityCalculator;
  final List<UnitPrice> unitPricePool;
  final CurrencyRates currencyRates;
  final CostTemplate costTemplate;
  final List<Cost> costs;
  final Map<MainCategory, String> formattedSubTotalsTRY;
  final String formattedGrandTotalTRY;

  const CostTableState({
    required this.quantityCalculator,
    required this.unitPricePool,
    required this.currencyRates,
    required this.costTemplate,
    required this.costs,
    required this.formattedSubTotalsTRY,
    required this.formattedGrandTotalTRY,
  });

  CostTableState copyWith({
    QuantityCalculator? quantityCalculator,
    List<UnitPrice>? unitPricePool,
    CurrencyRates? currencyRates,
    CostTemplate? costTemplate,
    List<Cost>? costs,
    Map<MainCategory, String>? formattedSubTotalsTRY,
    String? formattedGrandTotalTRY,
  }) {
    return CostTableState(
        quantityCalculator: quantityCalculator ?? this.quantityCalculator,
        unitPricePool: unitPricePool ?? this.unitPricePool,
        currencyRates: currencyRates ?? this.currencyRates,
        costTemplate: costTemplate ?? this.costTemplate,
        costs: costs ?? this.costs,
        formattedSubTotalsTRY:
            formattedSubTotalsTRY ?? this.formattedSubTotalsTRY,
        formattedGrandTotalTRY:
            formattedGrandTotalTRY ?? this.formattedGrandTotalTRY);
  }

  @override
  List<Object?> get props => [
        quantityCalculator,
        unitPricePool,
        currencyRates,
        costTemplate,
        costs,
        formattedSubTotalsTRY,
        formattedGrandTotalTRY
      ];
}
