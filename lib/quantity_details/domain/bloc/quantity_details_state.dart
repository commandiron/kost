import 'package:equatable/equatable.dart';
import 'package:kost/common/bloc/bloc_state.dart';
import '../model/calculator/job_calculator.dart';

class QuantityDetailsState extends Equatable {
  final BlocState blocState;
  final JobCalculator jobCalculator;
  final String snackBarMessage;


  const QuantityDetailsState({
    required this.blocState,
    required this.jobCalculator,
    required this.snackBarMessage,
  });

  QuantityDetailsState copyWith({
    BlocState? blocState,
    JobCalculator? jobCalculator,
    String? snackBarMessage,
  }) {
    return QuantityDetailsState(
      blocState: blocState ?? this.blocState,
      jobCalculator: jobCalculator ?? this.jobCalculator,
      snackBarMessage: snackBarMessage ?? this.snackBarMessage,
    );
  }

  @override
  List<Object?> get props => [
    blocState,
    jobCalculator,
    snackBarMessage,
  ];
}