import 'package:equatable/equatable.dart';
import 'package:kost/bloc/model/project_constants.dart';
import 'model/cost_item.dart';
import 'model/project_dim_calculator.dart';

class ProjectState extends Equatable{

  final ProjectConstants projectConstants;
  final ProjectDimCalculator projectDimCalculator;
  final List<CostItem> excavationCostItems;

  const ProjectState(
    {
      required this.projectConstants,
      required this.projectDimCalculator,
      required this.excavationCostItems,
    }
  );

  ProjectState copyWith({
    ProjectConstants? projectConstants,
    ProjectDimCalculator? projectDimCalculator,
    List<CostItem>? excavationCostItems
  }) {
    return ProjectState(
      projectConstants: projectConstants ?? this.projectConstants,
      projectDimCalculator: projectDimCalculator ?? this.projectDimCalculator,
      excavationCostItems: excavationCostItems ?? this.excavationCostItems
    );
  }

  @override
  List<Object?> get props => [];
}