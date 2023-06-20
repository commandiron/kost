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
  final Map<MainCategory, List<CostItem>> groupedCostItems;

  const ProjectState(
    {
      required this.quantityCalculator,
      required this.unitPrices,
      required this.currencyRates,
      required this.groupedCostItems,
    }
  );

  ProjectState copyWith({
    QuantityCalculator? quantityCalculator,
    List<UnitPrice>? unitPrices,
    CurrencyRates? currencyRates,
    Map<MainCategory, List<CostItem>>? groupedCostItems,
  }) {
    return ProjectState(
      quantityCalculator: quantityCalculator ?? this.quantityCalculator,
      unitPrices: unitPrices ?? this.unitPrices,
      currencyRates: currencyRates ?? this.currencyRates,
      groupedCostItems: groupedCostItems ?? this.groupedCostItems
    );
  }

  @override
  List<Object?> get props => [quantityCalculator, unitPrices, currencyRates, groupedCostItems];
}