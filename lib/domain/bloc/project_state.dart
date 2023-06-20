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
  final List<JobCategory> enabledJobCategories;
  final List<CostItem> costItems;
  final double grandTotalTRY;

  const ProjectState(
    {
      required this.quantityCalculator,
      required this.unitPrices,
      required this.currencyRates,
      required this.enabledJobCategories,
      required this.costItems,
      required this.grandTotalTRY,
    }
  );

  ProjectState copyWith({
    QuantityCalculator? quantityCalculator,
    List<UnitPrice>? unitPrices,
    CurrencyRates? currencyRates,
    List<JobCategory>? enabledJobCategories,
    List<CostItem>? costItems,
    double? grandTotalTRY,
  }) {
    return ProjectState(
      quantityCalculator: quantityCalculator ?? this.quantityCalculator,
      unitPrices: unitPrices ?? this.unitPrices,
      currencyRates: currencyRates ?? this.currencyRates,
      enabledJobCategories: enabledJobCategories ?? this.enabledJobCategories,
      costItems: costItems ?? this.costItems,
      grandTotalTRY: grandTotalTRY ?? this.grandTotalTRY
    );
  }

  @override
  List<Object?> get props => [quantityCalculator, unitPrices, currencyRates, costItems, enabledJobCategories, grandTotalTRY];
}