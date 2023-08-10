import 'package:equatable/equatable.dart';
import 'package:kost/domain/model/unit_price/currency.dart';
import 'package:kost/domain/model/cost/builder/cost_builder.dart';
import '../model/cost/job.dart';
import '../model/cost/cost.dart';
import '../model/unit_price/unit_price.dart';

class CostTableState extends Equatable {
  final CostBuilder costBuilder;
  final List<UnitPrice> unitPricePool;
  final CurrencyRates currencyRates;
  final List<Cost> costs;
  final Map<MainCategory, String> formattedSubTotalsTRY;
  final String formattedGrandTotalTRY;

  const CostTableState({
    required this.costBuilder,
    required this.unitPricePool,
    required this.currencyRates,
    required this.costs,
    required this.formattedSubTotalsTRY,
    required this.formattedGrandTotalTRY,
  });

  CostTableState copyWith({
    CostBuilder? costBuilder,
    List<UnitPrice>? unitPricePool,
    CurrencyRates? currencyRates,
    List<Cost>? costs,
    Map<MainCategory, String>? formattedSubTotalsTRY,
    String? formattedGrandTotalTRY,
  }) {
    return CostTableState(
      costBuilder: costBuilder ?? this.costBuilder,
      unitPricePool: unitPricePool ?? this.unitPricePool,
      currencyRates: currencyRates ?? this.currencyRates,
      costs: costs ?? this.costs,
      formattedSubTotalsTRY: formattedSubTotalsTRY ?? this.formattedSubTotalsTRY,
      formattedGrandTotalTRY: formattedGrandTotalTRY ?? this.formattedGrandTotalTRY
    );
  }

  @override
  List<Object?> get props => [
    costBuilder,
    unitPricePool,
    currencyRates,
    costs.hashCode,
    formattedSubTotalsTRY,
    formattedGrandTotalTRY
  ];
}
