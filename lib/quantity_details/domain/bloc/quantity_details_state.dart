import 'package:equatable/equatable.dart';

import '../model/calculator/job_calculator.dart';

class QuantityDetailsState extends Equatable {
  final JobCalculator jobCalculator;
  final String snackBarMessage;


  const QuantityDetailsState({
    required this.jobCalculator,
    required this.snackBarMessage,
  });

  QuantityDetailsState copyWith({
    JobCalculator? jobCalculator,
    String? snackBarMessage,
  }) {
    return QuantityDetailsState(
      jobCalculator: jobCalculator ?? this.jobCalculator,
      snackBarMessage: snackBarMessage ?? this.snackBarMessage,
    );
  }

  @override
  List<Object?> get props => [
    jobCalculator,
    snackBarMessage,
  ];
}
