import 'package:equatable/equatable.dart';
import 'package:kost/bloc/structural_floor.dart';

import '../logic/cost_item/cost_item.dart';

class ProjectState extends Equatable{


  final BuildingStructureProp buildingStructureProp;
  final List<CostItem> excavationCostItems;

  const ProjectState(
    {
      required this.buildingStructureProp,
      required this.excavationCostItems,
    }
  );

  ProjectState copyWith({
    BuildingStructureProp? buildingStructureProp,
    List<CostItem>? excavationCostItems,
  }) {
    return ProjectState(
      buildingStructureProp: buildingStructureProp ?? this.buildingStructureProp,
      excavationCostItems: excavationCostItems ?? this.excavationCostItems,
    );
  }

  @override
  List<Object?> get props => [];
}