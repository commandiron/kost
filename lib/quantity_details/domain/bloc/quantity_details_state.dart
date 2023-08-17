import 'package:equatable/equatable.dart';

import '../model/calculator/job_calculator.dart';

class QuantityDetailsState extends Equatable {
  final JobCalculator jobCalculator;


  const QuantityDetailsState({
    required this.jobCalculator,
  });

  QuantityDetailsState copyWith({
    JobCalculator? jobCalculator,
  }) {
    return QuantityDetailsState(
      jobCalculator: jobCalculator ?? this.jobCalculator,
    );
  }

  @override
  List<Object?> get props => [
    jobCalculator,
  ];
}
