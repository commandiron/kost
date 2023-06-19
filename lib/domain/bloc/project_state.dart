import 'package:equatable/equatable.dart';
import 'package:kost/domain/model/currency.dart';
import '../../presentation/model/cost_item.dart';
import '../model/unit_price.dart';
import '../calculator/quantity_calculator.dart';

class ProjectState extends Equatable{

  final QuantityCalculator quantityCalculator;
  final List<UnitPrice> unitPrices;
  final CurrencyRates currencyRates;
  final List<CostItem> costItems;

  const ProjectState(
    {
      required this.quantityCalculator,
      required this.unitPrices,
      required this.currencyRates,
      required this.costItems,
    }
  );

  ProjectState copyWith({
    QuantityCalculator? quantityCalculator,
    List<UnitPrice>? unitPrices,
    CurrencyRates? currencyRates,
    List<CostItem>? costItems,
  }) {
    return ProjectState(
      quantityCalculator: quantityCalculator ?? this.quantityCalculator,
      unitPrices: unitPrices ?? this.unitPrices,
      currencyRates: currencyRates ?? this.currencyRates,
      costItems: costItems ?? this.costItems
    );
  }

  @override
  List<Object?> get props => [quantityCalculator, unitPrices, currencyRates, costItems];
}