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

class FetchEnabledUnitPriceCategories extends ProjectEvent {
  const FetchEnabledUnitPriceCategories();
  @override
  List<Object?> get props => [];
}

class CreateCostItems extends ProjectEvent {
  const CreateCostItems();
  @override
  List<Object?> get props => [];
}

class CalculateGrandTotal extends ProjectEvent {
  const CalculateGrandTotal();
  @override
  List<Object?> get props => [];
}

class ReplaceUnitPriceCategory extends ProjectEvent {
  final UnitPriceCategory unitPriceCategory;
  const ReplaceUnitPriceCategory(this.unitPriceCategory);
  @override
  List<Object?> get props => [unitPriceCategory];
}