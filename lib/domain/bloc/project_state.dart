import 'package:equatable/equatable.dart';
import 'package:kost/domain/model/currency.dart';
import '../../presentation/model/cost_item.dart';
import '../model/unit_price.dart';
import '../calculator/quantity_calculator.dart';
import '../model/category.dart';

class ProjectState extends Equatable{

  final QuantityCalculator quantityCalculator;
  final Map<MainCategory, List<UnitPrice>> unitPriceMap;
  final CurrencyRates currencyRates;
  final List<CostItem> costItems;

  const ProjectState(
    {
      required this.quantityCalculator,
      required this.unitPriceMap,
      required this.currencyRates,
      required this.costItems,
    }
  );

  ProjectState copyWith({
    QuantityCalculator? quantityCalculator,
    Map<MainCategory, List<UnitPrice>>? unitPriceMap,
    CurrencyRates? currencyRates,
    List<CostItem>? costItems,
  }) {
    return ProjectState(
      quantityCalculator: quantityCalculator ?? this.quantityCalculator,
      unitPriceMap: unitPriceMap ?? this.unitPriceMap,
      currencyRates: currencyRates ?? this.currencyRates,
      costItems: costItems ?? this.costItems
    );
  }

  @override
  List<Object?> get props => [quantityCalculator, unitPriceMap, currencyRates, costItems];
}