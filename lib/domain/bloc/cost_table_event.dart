import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/job/job.dart';

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
  final String jobId;
  final String selectedUnitPriceId;
  const ReplaceUnitPrice(this.jobId, this.selectedUnitPriceId);
  @override
  List<Object?> get props => [jobId, selectedUnitPriceId];
}

class DeleteJob extends CostTableEvent {
  final String jobId;
  const DeleteJob(this.jobId);
  @override
  List<Object?> get props => [jobId];
}

class ChangeQuantityManually extends CostTableEvent {
  final String jobId;
  final String quantityText;
  const ChangeQuantityManually(this.jobId, this.quantityText);
  @override
  List<Object?> get props => [jobId, quantityText];
}

class FloorAreaChanged extends CostTableEvent {
  final String floorAreaText;
  final int no;
  const FloorAreaChanged(this.floorAreaText, this.no);
  @override
  List<Object?> get props => [floorAreaText, no];
}

class FloorDelete extends CostTableEvent {
  final int no;
  const FloorDelete(this.no);
  @override
  List<Object?> get props => [no];
}

class CalculateCost extends CostTableEvent {
  final BuildContext context;
  const CalculateCost(this.context);
  @override
  List<Object?> get props => [context];
}