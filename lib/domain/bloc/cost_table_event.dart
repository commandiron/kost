import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kost/domain/model/unit_price/unit_price.dart';

import '../model/cost/job.dart';

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
  final int jobId;
  final UnitPriceCategory selectedUnitPriceCategory;
  const ReplaceUnitPrice(this.jobId, this.selectedUnitPriceCategory);
  @override
  List<Object?> get props => [jobId, selectedUnitPriceCategory];
}

class DeleteJob extends CostTableEvent {
  final int jobId;
  const DeleteJob(this.jobId);
  @override
  List<Object?> get props => [jobId];
}

class ChangeQuantityManually extends CostTableEvent {
  final int jobId;
  final String quantityText;
  const ChangeQuantityManually(this.jobId, this.quantityText);
  @override
  List<Object?> get props => [jobId, quantityText];
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