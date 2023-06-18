import 'package:equatable/equatable.dart';
import 'package:kost/bloc/model/project_constants.dart';

import 'model/cost_item.dart';
import 'model/floor.dart';

class ProjectState extends Equatable{

  final ProjectConstants projectConstants;
  final ProjectCalculator projectCalculator;
  final List<CostItem> excavationCostItems;

  const ProjectState(
    {
      required this.projectConstants,
      required this.projectCalculator,
      required this.excavationCostItems,
    }
  );

  ProjectState copyWith({
    ProjectConstants? projectConstants,
    ProjectCalculator? projectCalculator,
    List<CostItem>? excavationCostItems,
  }) {
    return ProjectState(
      projectConstants: projectConstants ?? this.projectConstants,
      projectCalculator: projectCalculator ?? this.projectCalculator,
      excavationCostItems: excavationCostItems ?? this.excavationCostItems,
    );
  }

  @override
  List<Object?> get props => [];
}