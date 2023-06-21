import 'category.dart';

abstract class CostTemplate {
  late final List<JobCategory> jobCategories;
}

class RoughConstructionTemplate extends CostTemplate {
  @override
  List<JobCategory> get jobCategories => [
    JobCategory.shutcrete,
    JobCategory.excavation,
    JobCategory.breaker,
    JobCategory.foundationStabilizationGravel
  ];
}