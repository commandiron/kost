import 'package:equatable/equatable.dart';
import 'package:kost/domain/model/unit_price/unit_price_category.dart';

import '../model/cost/cost_category.dart';

abstract class ProjectEvent extends Equatable {
  const ProjectEvent();

  @override
  List<Object?> get props => [];
}

class Init extends ProjectEvent {
  const Init();
  @override
  List<Object?> get props => [];
}

class CreateQuantityCalculator extends ProjectEvent {
  const CreateQuantityCalculator();
  @override
  List<Object?> get props => [];
}

class FetchUnitPrices extends ProjectEvent {
  const FetchUnitPrices();
  @override
  List<Object?> get props => [];
}

class FetchCurrencyRates extends ProjectEvent {
  const FetchCurrencyRates();
  @override
  List<Object?> get props => [];
}

class FetchCostTemplate extends ProjectEvent {
  const FetchCostTemplate();
  @override
  List<Object?> get props => [];
}

class CreateCostTable extends ProjectEvent {
  const CreateCostTable();
  @override
  List<Object?> get props => [];
}

class ReplaceCostCategory extends ProjectEvent {
  final CostCategory oldCostCategory;
  final UnitPriceCategory newUnitPriceCategory;
  const ReplaceCostCategory(this.oldCostCategory, this.newUnitPriceCategory);
  @override
  List<Object?> get props => [];
}