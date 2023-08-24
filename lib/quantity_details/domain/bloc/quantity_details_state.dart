import 'package:equatable/equatable.dart';
import 'package:kost/common/bloc/bloc_state.dart';
import 'package:kost/quantity_details/domain/model/project_constants.dart';
import '../model/floor/floor.dart';
import '../model/job_calculator/job_calculator.dart';
import '../model/project_variables.dart';

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