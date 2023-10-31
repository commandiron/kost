import 'package:equatable/equatable.dart';
import 'package:kost/apartment_details/domain/model/project.dart';
import 'package:kost/common/bloc/bloc_state.dart';

class ApartmentDetailsState extends Equatable {
  final BlocState blocState;
  final String snackBarMessage;
  final Project project;

  const ApartmentDetailsState({
    required this.blocState,
    required this.snackBarMessage,
    required this.project,
  });

  ApartmentDetailsState copyWith({
    BlocState? blocState,
    String? snackBarMessage,
    Project? project,
  }) {
    return ApartmentDetailsState(
      blocState: blocState ?? this.blocState,
      snackBarMessage: snackBarMessage ?? this.snackBarMessage,
      project: project ?? this.project,
    );
  }

  @override
  List<Object?> get props => [
    blocState,
    snackBarMessage,
    project
  ];
}
