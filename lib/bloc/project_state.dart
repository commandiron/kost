import 'package:equatable/equatable.dart';
import 'package:kost/bloc/structural_floor.dart';

import '../logic/cost_item/cost_item.dart';

class ProjectState extends Equatable{

  final List<CostItem> excavationCostItems;
  final BuildingStructureProp buildingStructureProp;

  const ProjectState(
    {
      required this.excavationCostItems,
      required this.buildingStructureProp
    }
  );

  ProjectState copyWith({
    List<CostItem>? excavationCostItems,
    BuildingStructureProp? buildingStructureProp
  }) {
    return ProjectState(
      excavationCostItems: excavationCostItems ?? this.excavationCostItems,
      buildingStructureProp: buildingStructureProp ?? this.buildingStructureProp
    );
  }

  @override
  List<Object?> get props => [];
}