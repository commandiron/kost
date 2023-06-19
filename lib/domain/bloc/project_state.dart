import 'package:equatable/equatable.dart';
import '../../presentation/model/cost_item.dart';
import '../model/cost_unit_price.dart';
import '../calculator/quantity_calculator.dart';

class ProjectState extends Equatable{

  final QuantityCalculator quantityCalculator;
  final List<UnitPrice> unitPrices;
  final List<CostItem> costItems;

  const ProjectState(
    {
      required this.quantityCalculator,
      required this.unitPrices,
      required this.costItems,
    }
  );

  ProjectState copyWith({
    QuantityCalculator? quantityCalculator,
    List<UnitPrice>? unitPrices,
    List<CostItem>? costItems,
  }) {
    return ProjectState(
      quantityCalculator: quantityCalculator ?? this.quantityCalculator,
      unitPrices: unitPrices ?? this.unitPrices,
      costItems: costItems ?? this.costItems
    );
  }

  @override
  List<Object?> get props => [quantityCalculator, unitPrices, costItems];
}