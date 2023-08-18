import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


import '../../../quantity_details/domain/model/job.dart';

abstract class CostTableEvent extends Equatable {
  const CostTableEvent();

  @override
  List<Object?> get props => [];
}

class Init extends CostTableEvent {
  final List<Job>? jobs;
  final BuildContext context;
  const Init(this.jobs, this.context);
  @override
  List<Object?> get props => [jobs, context];
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