import 'package:equatable/equatable.dart';
import 'package:kost/bloc/model/project_properties.dart';

import 'model/cost_item.dart';
import 'model/floor.dart';

class ProjectState extends Equatable{

  final ProjectProp projectProp;
  final BuildingProp buildingProp;
  final List<CostItem> excavationCostItems;

  const ProjectState(
    {
      required this.projectProp,
      required this.buildingProp,
      required this.excavationCostItems,
    }
  );

  ProjectState copyWith({
    ProjectProp? projectProp,
    BuildingProp? buildingProp,
    List<CostItem>? excavationCostItems,
  }) {
    return ProjectState(
      projectProp: projectProp ?? this.projectProp,
      buildingProp: buildingProp ?? this.buildingProp,
      excavationCostItems: excavationCostItems ?? this.excavationCostItems,
    );
  }

  @override
  List<Object?> get props => [];
}