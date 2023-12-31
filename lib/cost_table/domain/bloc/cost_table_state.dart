import 'package:equatable/equatable.dart';
import 'package:kost/common/bloc/bloc_state.dart';
import '../../../common/model/job.dart';
import '../model/cost.dart';
import '../model/currency_rates.dart';
import '../../../common/model/unit_price.dart';

class CostTableState extends Equatable {
  final BlocState blocState;
  final String tableName;
  final List<Job> jobs;
  final List<UnitPrice> unitPrices;
  final CurrencyRates currencyRates;
  final List<Cost> costs;
  final Map<MainCategory, bool> categoryVisibilities;
  final Map<MainCategory, String> formattedSubTotalsTRY;
  final String formattedGrandTotalTRY;

  const CostTableState({
    required this.blocState,
    required this.tableName,
    required this.jobs,
    required this.unitPrices,
    required this.currencyRates,
    required this.costs,
    required this.categoryVisibilities,
    required this.formattedSubTotalsTRY,
    required this.formattedGrandTotalTRY,
  });

  CostTableState copyWith({
    BlocState? blocState,
    String? tableName,
    List<Job>? jobs,
    List<UnitPrice>? unitPrices,
    CurrencyRates? currencyRates,
    List<Cost>? costs,
    Map<MainCategory, bool>? categoryVisibilities,
    Map<MainCategory, String>? formattedSubTotalsTRY,
    String? formattedGrandTotalTRY,
  }) {
    return CostTableState(
      blocState: blocState ?? this.blocState,
      tableName: tableName ?? this.tableName,
      jobs: jobs ?? this.jobs,
      unitPrices: unitPrices ?? this.unitPrices,
      currencyRates: currencyRates ?? this.currencyRates,
      costs: costs ?? this.costs,
      categoryVisibilities: categoryVisibilities ?? this.categoryVisibilities,
      formattedSubTotalsTRY: formattedSubTotalsTRY ?? this.formattedSubTotalsTRY,
      formattedGrandTotalTRY: formattedGrandTotalTRY ?? this.formattedGrandTotalTRY
    );
  }

  @override
  List<Object?> get props => [
    blocState,
    tableName,
    jobs,
    unitPrices,
    currencyRates,
    costs.hashCode,
    categoryVisibilities.hashCode,
    formattedSubTotalsTRY,
    formattedGrandTotalTRY
  ];
}
