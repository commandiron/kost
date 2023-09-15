import 'package:equatable/equatable.dart';
import '../../../common/model/job.dart';

abstract class CostTableEvent extends Equatable {
  const CostTableEvent();

  @override
  List<Object?> get props => [];
}

class InitCostTableBloc extends CostTableEvent {
  final String? tableName;
  final List<Job>? jobs;
  const InitCostTableBloc(this.tableName, this.jobs);
  @override
  List<Object?> get props => [tableName, jobs];
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
  final String replacedUnitPriceId;
  const ReplaceUnitPrice(this.jobId, this.replacedUnitPriceId);
  @override
  List<Object?> get props => [jobId, replacedUnitPriceId];
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
