import 'package:equatable/equatable.dart';
import 'package:kost/bloc/model/project_prop.dart';

import 'model/cost_item.dart';
import 'model/floor.dart';

class ProjectState extends Equatable{

  final ProjectProp projectProp;
  final BuildingPropCalculator buildingPropCalculator;
  final List<CostItem> excavationCostItems;

  const ProjectState(
    {
      required this.projectProp,
      required this.buildingPropCalculator,
      required this.excavationCostItems,
    }
  );

  ProjectState copyWith({
    ProjectProp? projectProp,
    BuildingPropCalculator? buildingProp,
    List<CostItem>? excavationCostItems,
  }) {
    return ProjectState(
      projectProp: projectProp ?? this.projectProp,
      buildingPropCalculator: buildingProp ?? this.buildingPropCalculator,
      excavationCostItems: excavationCostItems ?? this.excavationCostItems,
    );
  }

  @override
  List<Object?> get props => [];
}