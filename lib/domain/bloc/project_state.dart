import 'package:equatable/equatable.dart';
import 'package:kost/domain/model/currency.dart';
import '../../presentation/model/cost_item.dart';
import '../model/category.dart';
import '../model/unit_price.dart';
import '../calculator/quantity_calculator.dart';

class ProjectState extends Equatable{

  final QuantityCalculator quantityCalculator;
  final List<UnitPrice> unitPrices;
  final CurrencyRates currencyRates;
  final List<UnitPriceCategory> enabledUnitPriceCategories;
  final List<UiCostItem> uiCostItems;
  final double grandTotalTRY;

  const ProjectState(
    {
      required this.quantityCalculator,
      required this.unitPrices,
      required this.currencyRates,
      required this.enabledUnitPriceCategories,
      required this.uiCostItems,
      required this.grandTotalTRY,
    }
  );

  ProjectState copyWith({
    QuantityCalculator? quantityCalculator,
    List<UnitPrice>? unitPrices,
    CurrencyRates? currencyRates,
    List<UnitPriceCategory>? enabledUnitPriceCategories,
    List<UiCostItem>? uiCostItems,
    double? grandTotalTRY,

  }) {
    return ProjectState(
      quantityCalculator: quantityCalculator ?? this.quantityCalculator,
      unitPrices: unitPrices ?? this.unitPrices,
      currencyRates: currencyRates ?? this.currencyRates,
      enabledUnitPriceCategories: enabledUnitPriceCategories ?? this.enabledUnitPriceCategories,
      uiCostItems: uiCostItems ?? this.uiCostItems,
      grandTotalTRY: grandTotalTRY ?? this.grandTotalTRY
    );
  }

  @override
  List<Object?> get props => [quantityCalculator, unitPrices, currencyRates, enabledUnitPriceCategories, uiCostItems, grandTotalTRY];
}