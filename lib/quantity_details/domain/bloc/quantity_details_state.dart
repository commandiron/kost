import 'package:equatable/equatable.dart';

import '../model/calculator/job_quantity_calculator.dart';

class QuantityDetailsState extends Equatable {
  final JobQuantityCalculator jobQuantityCalculator;


  const QuantityDetailsState({
    required this.jobQuantityCalculator,
  });

  QuantityDetailsState copyWith({
    JobQuantityCalculator? jobQuantityCalculator,
  }) {
    return QuantityDetailsState(
      jobQuantityCalculator: jobQuantityCalculator ?? this.jobQuantityCalculator,
    );
  }

  @override
  List<Object?> get props => [
    jobQuantityCalculator,
  ];
}
