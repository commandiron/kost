import 'package:equatable/equatable.dart';
import 'package:kost/common/bloc/bloc_state.dart';
import '../model/job/job_calculator.dart';

class QuantityDetailsState extends Equatable {
  final BlocState blocState;
  final String snackBarMessage;
  final JobCalculator jobCalculator;

  const QuantityDetailsState({
    required this.blocState,
    required this.snackBarMessage,
    required this.jobCalculator,
    
  });

  QuantityDetailsState copyWith({
    BlocState? blocState,
    String? snackBarMessage,
    JobCalculator? jobCalculator,
  }) {
    return QuantityDetailsState(
      blocState: blocState ?? this.blocState,
      snackBarMessage: snackBarMessage ?? this.snackBarMessage,
      jobCalculator: jobCalculator ?? this.jobCalculator,
    );
  }

  @override
  List<Object?> get props => [
    blocState,
    snackBarMessage,
    jobCalculator,
  ];
}