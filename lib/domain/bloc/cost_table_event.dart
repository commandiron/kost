import 'package:equatable/equatable.dart';
import 'package:kost/domain/model/category/category.dart';
import 'package:kost/domain/model/unit_price/unit_price_category.dart';

import '../model/cost/cost_category.dart';

abstract class CostTableEvent extends Equatable {
  const CostTableEvent();

  @override
  List<Object?> get props => [];
}

class Init extends CostTableEvent {
  const Init();
  @override
  List<Object?> get props => [];
}

class CreateQuantityCalculator extends CostTableEvent {
  const CreateQuantityCalculator();
  @override
  List<Object?> get props => [];
}

class FetchUnitPrices extends CostTableEvent {
  const FetchUnitPrices();
  @override
  List<Object?> get props => [];
}

class FetchCurrencyRates extends CostTableEvent {
  const FetchCurrencyRates();
  @override
  List<Object?> get props => [];
}

class FetchCostTemplate extends CostTableEvent {
  const FetchCostTemplate();
  @override
  List<Object?> get props => [];
}

class CreateCostTable extends CostTableEvent {
  const CreateCostTable();
  @override
  List<Object?> get props => [];
}

class ReplaceCostCategory extends CostTableEvent {
  final CostCategory oldCostCategory;
  final UnitPriceCategory newUnitPriceCategory;
  const ReplaceCostCategory(this.oldCostCategory, this.newUnitPriceCategory);
  @override
  List<Object?> get props => [oldCostCategory, newUnitPriceCategory];
}

class DeleteCostCategory extends CostTableEvent {
  final CostCategory costCategory;
  const DeleteCostCategory(this.costCategory);
  @override
  List<Object?> get props => [costCategory];
}

class ChangeQuantity extends CostTableEvent {
  final JobCategory jobCategory;
  final String quantityText;
  const ChangeQuantity(this.jobCategory, this.quantityText);
  @override
  List<Object?> get props => [quantityText];
}

class ExpandCollapse extends CostTableEvent {
  final MainCategory mainCategory;
  const ExpandCollapse(this.mainCategory);
  @override
  List<Object?> get props => [mainCategory];
}
