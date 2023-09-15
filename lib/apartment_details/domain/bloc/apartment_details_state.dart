import 'package:equatable/equatable.dart';
import 'package:kost/common/bloc/bloc_state.dart';
import 'package:kost/apartment_details/domain/model/project_constants.dart';
import '../model/floor/floor.dart';
import '../model/jobs_generator/jobs_generator.dart';
import '../model/project_variables.dart';

class ApartmentDetailsState extends Equatable {
  final BlocState blocState;
  final String snackBarMessage;
  final ProjectConstants projectConstants;
  final ProjectVariables projectVariables;
  final List<Floor> floors;

  const ApartmentDetailsState({
    required this.blocState,
    required this.snackBarMessage,
    required this.projectConstants,
    required this.projectVariables,
    required this.floors,
  });

  ApartmentDetailsState copyWith({
    BlocState? blocState,
    String? snackBarMessage,
    ProjectConstants? projectConstants,
    ProjectVariables? projectVariables,
    List<Floor>? floors,
    JobsGenerator? jobCalculator,
  }) {
    return ApartmentDetailsState(
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
