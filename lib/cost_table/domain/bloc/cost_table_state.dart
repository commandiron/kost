import 'package:equatable/equatable.dart';
import 'package:kost/common/bloc/screen_state.dart';
import 'package:kost/cost_table/domain/model/unit_price/currency.dart';
import '../../../quantity_details/domain/model/job.dart';
import '../model/cost/cost.dart';
import '../model/unit_price/unit_price.dart';

class CostTableState extends Equatable {
  final BlocState blocState;
  final String tableName;
  final List<Job> jobs;
  final List<UnitPrice> unitPricePool;
  final CurrencyRates currencyRates;
  final List<Cost> costs;
  final Map<MainCategory, bool> categoryVisibilities;
  final Map<MainCategory, String> formattedSubTotalsTRY;
  final String formattedGrandTotalTRY;

  const CostTableState({
    required this.blocState,
    required this.tableName,
    required this.jobs,
    required this.unitPricePool,
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
    List<UnitPrice>? unitPricePool,
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
      unitPricePool: unitPricePool ?? this.unitPricePool,
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
    unitPricePool,
    currencyRates,
    costs.hashCode,
    categoryVisibilities.hashCode,
    formattedSubTotalsTRY,
    formattedGrandTotalTRY
  ];
}
