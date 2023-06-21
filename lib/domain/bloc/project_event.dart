import 'package:equatable/equatable.dart';

import '../model/category.dart';

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

class FetchEnabledJobCategories extends ProjectEvent {
  const FetchEnabledJobCategories();
  @override
  List<Object?> get props => [];
}

class CreateGroupedCostItems extends ProjectEvent {
  const CreateGroupedCostItems();
  @override
  List<Object?> get props => [];
}

class CalculateGrandTotal extends ProjectEvent {
  const CalculateGrandTotal();
  @override
  List<Object?> get props => [];
}

class ReplaceJobCategory extends ProjectEvent {
  final JobCategory jobCategory;
  const ReplaceJobCategory(this.jobCategory);
  @override
  List<Object?> get props => [jobCategory];
}