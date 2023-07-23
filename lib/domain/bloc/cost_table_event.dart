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

class FetchCostTemplate extends CostTableEvent {
  const FetchCostTemplate();
  @override
  List<Object?> get props => [];
}

class FetchUnitPricePool extends CostTableEvent {
  const FetchUnitPricePool();
  @override
  List<Object?> get props => [];
}

class FetchCurrencyRates extends CostTableEvent {
  const FetchCurrencyRates();
  @override
  List<Object?> get props => [];
}

class CreateQuantityCalculator extends CostTableEvent {
  const CreateQuantityCalculator();
  @override
  List<Object?> get props => [];
}

class CreateCostTable extends CostTableEvent {
  const CreateCostTable();
  @override
  List<Object?> get props => [];
}

class ShowHideMainCategory extends CostTableEvent {
  final MainCategory mainCategory;
  const ShowHideMainCategory(this.mainCategory);
  @override
  List<Object?> get props => [mainCategory];
}

class ReplaceUnitPrice extends CostTableEvent {
  final CostCategory oldCostCategory;
  final UnitPriceCategory newUnitPriceCategory;
  const ReplaceUnitPrice(this.oldCostCategory, this.newUnitPriceCategory);
  @override
  List<Object?> get props => [oldCostCategory, newUnitPriceCategory];
}

class DeleteCostCategory extends CostTableEvent {
  final CostCategory costCategory;
  const DeleteCostCategory(this.costCategory);
  @override
  List<Object?> get props => [costCategory];
}

class ChangeQuantityManually extends CostTableEvent {
  final JobCategory jobCategory;
  final String quantityText;
  const ChangeQuantityManually(this.jobCategory, this.quantityText);
  @override
  List<Object?> get props => [quantityText];
}

class FloorAreaChanged extends CostTableEvent {
  final String floorAreaText;
  final int index;
  const FloorAreaChanged(this.floorAreaText, this.index);
  @override
  List<Object?> get props => [floorAreaText, index];
}