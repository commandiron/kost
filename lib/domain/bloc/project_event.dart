import 'package:equatable/equatable.dart';

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

class CreateCostItems extends ProjectEvent {
  const CreateCostItems();
  @override
  List<Object?> get props => [];
}