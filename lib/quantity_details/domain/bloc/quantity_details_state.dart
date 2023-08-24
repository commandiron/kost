import 'package:equatable/equatable.dart';
import 'package:kost/common/bloc/bloc_state.dart';
import 'package:kost/quantity_details/domain/model/project_constants.dart';
import '../model/floor.dart';
import '../model/job/job_calculator.dart';

class QuantityDetailsState extends Equatable {
  final BlocState blocState;
  final String snackBarMessage;
  final ProjectConstants projectConstants;
  final ProjectVariables projectVariables;
  final List<Floor> floors;

  const QuantityDetailsState({
    required this.blocState,
    required this.snackBarMessage,
    required this.projectConstants,
    required this.projectVariables,
    required this.floors,
  });

  QuantityDetailsState copyWith({
    BlocState? blocState,
    String? snackBarMessage,
    ProjectConstants? projectConstants,
    ProjectVariables? projectVariables,
    List<Floor>? floors,
    JobCalculator? jobCalculator,
  }) {
    return QuantityDetailsState(
      blocState: blocState ?? this.blocState,
      snackBarMessage: snackBarMessage ?? this.snackBarMessage,
      projectConstants: projectConstants ?? this.projectConstants,
      projectVariables: projectVariables ?? this.projectVariables,
      floors: floors ?? this.floors,
    );
  }

  @override
  List<Object?> get props => [
        blocState,
        snackBarMessage,
        projectConstants,
        projectVariables,
        floors,
      ];
}

class ProjectVariables extends Equatable {
  final double landArea;
  final double landPerimeter;
  final double excavationArea;
  final double excavationPerimeter;
  final double coreCurtainLength;
  final double curtainsExceeding1MeterLength;
  final double basementCurtainLength;
  final double columnsLess1MeterPerimeter;
  final double elevationTowerArea;
  final double elevationTowerHeightWithoutSlab;

  const ProjectVariables({
    this.landArea = 0,
    this.landPerimeter = 0,
    this.excavationArea = 0,
    this.excavationPerimeter = 0,
    this.coreCurtainLength = 0,
    this.curtainsExceeding1MeterLength = 0,
    this.basementCurtainLength = 0,
    this.columnsLess1MeterPerimeter = 0,
    this.elevationTowerArea = 0,
    this.elevationTowerHeightWithoutSlab = 0,
  });

  @override
  List<Object?> get props => [
        landArea,
        landPerimeter,
        excavationArea,
        excavationPerimeter,
        coreCurtainLength,
        curtainsExceeding1MeterLength,
        basementCurtainLength,
        columnsLess1MeterPerimeter,
        elevationTowerArea,
        elevationTowerHeightWithoutSlab,
      ];
}
