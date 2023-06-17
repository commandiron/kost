import 'package:equatable/equatable.dart';

import '../logic/cost_item/cost_item.dart';

class ProjectState extends Equatable{

  final List<CostItem> excavationCostItems;

  const ProjectState(
    {
      required this.excavationCostItems,
    }
  );

  ProjectState copyWith({
    List<CostItem>? excavationCostItems,
    double? shoringLength,
    double? shoringHeight,
  }) {
    return ProjectState(
      excavationCostItems: excavationCostItems ?? this.excavationCostItems,
    );
  }

  @override
  List<Object?> get props => [];
}