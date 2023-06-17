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

class CreateBuildingStructure extends ProjectEvent {
  const CreateBuildingStructure();
  @override
  List<Object?> get props => [];
}

class CreateExcavationCostItems extends ProjectEvent {
  const CreateExcavationCostItems();
  @override
  List<Object?> get props => [];
}