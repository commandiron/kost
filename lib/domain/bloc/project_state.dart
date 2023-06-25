import 'package:equatable/equatable.dart';
import 'package:kost/domain/model/unit_price/currency.dart';
import 'package:kost/domain/model/template/unit_price_template.dart';
import '../../presentation/model/cost_item.dart';
import '../model/unit_price/unit_price.dart';
import '../calculator/quantity_calculator.dart';

class ProjectState extends Equatable{

  final QuantityCalculator quantityCalculator;
  final List<UnitPrice> unitPrices;
  final CurrencyRates currencyRates;
  final CostTemplate costTemplate;
  final List<UiCostItem> uiCostItems;
  final String formattedGrandTotalTRY;

  const ProjectState(
    {
      required this.quantityCalculator,
      required this.unitPrices,
      required this.currencyRates,
      required this.costTemplate,
      required this.uiCostItems,
      required this.formattedGrandTotalTRY,
    }
  );

  ProjectState copyWith({
    QuantityCalculator? quantityCalculator,
    List<UnitPrice>? unitPrices,
    CurrencyRates? currencyRates,
    CostTemplate? costTemplate,
    List<UiCostItem>? uiCostItems,
    String? formattedGrandTotalTRY,

  }) {
    return ProjectState(
      quantityCalculator: quantityCalculator ?? this.quantityCalculator,
      unitPrices: unitPrices ?? this.unitPrices,
      currencyRates: currencyRates ?? this.currencyRates,
      costTemplate: costTemplate ?? this.costTemplate,
      uiCostItems: uiCostItems ?? this.uiCostItems,
      formattedGrandTotalTRY: formattedGrandTotalTRY ?? this.formattedGrandTotalTRY
    );
  }

  @override
  List<Object?> get props => [quantityCalculator, unitPrices, currencyRates, costTemplate, uiCostItems, formattedGrandTotalTRY];
}