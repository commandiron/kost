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
  final Map<MainCategory, List<UiCostItem>> groupedUiCostItems;
  final String formattedGrandTotalTRY;

  const ProjectState(
    {
      required this.quantityCalculator,
      required this.unitPrices,
      required this.currencyRates,
      required this.enabledUnitPriceCategories,
      required this.groupedUiCostItems,
      required this.formattedGrandTotalTRY,
    }
  );

  ProjectState copyWith({
    QuantityCalculator? quantityCalculator,
    List<UnitPrice>? unitPrices,
    CurrencyRates? currencyRates,
    List<UnitPriceCategory>? enabledUnitPriceCategories,
    Map<MainCategory, List<UiCostItem>>? groupedUiCostItems,
    String? formattedGrandTotalTRY,

  }) {
    return ProjectState(
      quantityCalculator: quantityCalculator ?? this.quantityCalculator,
      unitPrices: unitPrices ?? this.unitPrices,
      currencyRates: currencyRates ?? this.currencyRates,
      enabledUnitPriceCategories: enabledUnitPriceCategories ?? this.enabledUnitPriceCategories,
      groupedUiCostItems: groupedUiCostItems ?? this.groupedUiCostItems,
      formattedGrandTotalTRY: formattedGrandTotalTRY ?? this.formattedGrandTotalTRY
    );
  }

  @override
  List<Object?> get props => [quantityCalculator, unitPrices, currencyRates, enabledUnitPriceCategories, groupedUiCostItems, formattedGrandTotalTRY];
}