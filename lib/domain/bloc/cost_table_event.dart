import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kost/domain/model/category/category.dart';

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

class CreateCostTable extends CostTableEvent {
  const CreateCostTable();
  @override
  List<Object?> get props => [];
}

class ExpandCollapseMainCategory extends CostTableEvent {
  final MainCategory mainCategory;
  const ExpandCollapseMainCategory(this.mainCategory);
  @override
  List<Object?> get props => [mainCategory];
}

class ExpandCollapseAllMainCategory extends CostTableEvent {
  const ExpandCollapseAllMainCategory();
  @override
  List<Object?> get props => [];
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

class CalculateCost extends CostTableEvent {
  final BuildContext context;
  const CalculateCost(this.context);
  @override
  List<Object?> get props => [context];
}