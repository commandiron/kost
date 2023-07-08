import 'package:equatable/equatable.dart';
import 'package:kost/domain/model/unit_price/currency.dart';
import 'package:kost/domain/model/cost/cost_template.dart';
import '../model/cost/cost_item.dart';
import '../model/unit_price/unit_price.dart';
import '../calculator/quantity_calculator.dart';

class ProjectState extends Equatable {
  final QuantityCalculator quantityCalculator;
  final List<UnitPrice> unitPricePool;
  final CurrencyRates currencyRates;
  final CostTemplate costTemplate;
  final List<CostItem> costItems;
  final String formattedGrandTotalTRY;

  const ProjectState({
    required this.quantityCalculator,
    required this.unitPricePool,
    required this.currencyRates,
    required this.costTemplate,
    required this.costItems,
    required this.formattedGrandTotalTRY,
  });

  ProjectState copyWith({
    QuantityCalculator? quantityCalculator,
    List<UnitPrice>? unitPricePool,
    CurrencyRates? currencyRates,
    CostTemplate? costTemplate,
    List<CostItem>? costItems,
    String? formattedGrandTotalTRY,
  }) {
    return ProjectState(
        quantityCalculator: quantityCalculator ?? this.quantityCalculator,
        unitPricePool: unitPricePool ?? this.unitPricePool,
        currencyRates: currencyRates ?? this.currencyRates,
        costTemplate: costTemplate ?? this.costTemplate,
        costItems: costItems ?? this.costItems,
        formattedGrandTotalTRY:
            formattedGrandTotalTRY ?? this.formattedGrandTotalTRY);
  }

  @override
  List<Object?> get props => [
        quantityCalculator,
        unitPricePool,
        currencyRates,
        costTemplate,
        costItems,
        formattedGrandTotalTRY
      ];
}
