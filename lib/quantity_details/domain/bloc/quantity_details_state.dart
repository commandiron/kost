import 'package:equatable/equatable.dart';
import 'package:kost/common/bloc/screen_state.dart';
import '../model/calculator/job_calculator.dart';

class QuantityDetailsState extends Equatable {
  final ScreenState screenState;
  final JobCalculator jobCalculator;
  final String snackBarMessage;


  const QuantityDetailsState({
    required this.screenState,
    required this.jobCalculator,
    required this.snackBarMessage,
  });

  QuantityDetailsState copyWith({
    ScreenState? screenState,
    JobCalculator? jobCalculator,
    String? snackBarMessage,
  }) {
    return QuantityDetailsState(
      screenState: screenState ?? this.screenState,
      jobCalculator: jobCalculator ?? this.jobCalculator,
      snackBarMessage: snackBarMessage ?? this.snackBarMessage,
    );
  }

  @override
  List<Object?> get props => [
    screenState,
    jobCalculator,
    snackBarMessage,
  ];
}