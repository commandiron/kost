import 'package:equatable/equatable.dart';
import '../../../quantity_details/domain/model/job/job.dart';

abstract class CostTableEvent extends Equatable {
  const CostTableEvent();

  @override
  List<Object?> get props => [];
}

class Init extends CostTableEvent {
  final List<Job>? jobs;
  const Init(this.jobs);
  @override
  List<Object?> get props => [jobs];
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