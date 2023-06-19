import 'package:equatable/equatable.dart';
import 'model/floor.dart';

class ProjectState extends Equatable{

  final ProjectCalculator projectCalculator;

  const ProjectState(
    {
      required this.projectCalculator,
    }
  );

  ProjectState copyWith({
    ProjectCalculator? projectCalculator,
  }) {
    return ProjectState(
      projectCalculator: projectCalculator ?? this.projectCalculator,
    );
  }

  @override
  List<Object?> get props => [];
}