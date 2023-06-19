import 'package:collection/collection.dart';
import 'package:kost/domain/calculator/project_constants.dart';
import '../model/category.dart';
import 'floor.dart';

class QuantityCalculator {
  final ProjectConstants projectConstants;
  final double excavationLength;
  final double excavationArea;
  final List<Floor> floors;
  double foundationHeight;
  final double insulationConcreteHeight;
  final double leanConcreteHeight;
  final double stabilizationHeight;

  QuantityCalculator(
    {
      required this.projectConstants,
      required this.excavationLength,
      required this.excavationArea,
      required this.floors,
      this.foundationHeight = 1,
      this.insulationConcreteHeight = 0.05,
      this.leanConcreteHeight = 0.10,
      this.stabilizationHeight = 0.30,
    }
  );

  Floor? get firstBasementFloor {

    final List<FloorType> basementTypes = [
      FloorType.b3,
      FloorType.b2,
      FloorType.b1,
    ];

    for (var basementType in basementTypes) {
      if(floors.any((floor) => floor.type == basementType)) {
        return floors.firstWhereOrNull((floor) => floor.type == basementType);
      }
    }

    return null;
  }
  List<Floor>? get basementFloors => floors.where((floor) => floor.type == FloorType.b3 || floor.type == FloorType.b2 || floor.type == FloorType.b1).toList();

  double get excavationHeight => stabilizationHeight + leanConcreteHeight + insulationConcreteHeight + foundationHeight + basementsHeight;
  double get basementsHeight {
    double basementsHeight = 0;
    if(basementFloors != null) {
      for (var basementFloor in basementFloors!) {
        basementsHeight += basementFloor.height;
      }
    }
    return basementsHeight;
  }

  double getQuantityFromJobCategory(JobCategory jobCategory) {
    switch(jobCategory) {
      case JobCategory.shutcrete : return excavationLength * excavationHeight;
      case JobCategory.boredPile : return 0;
      case JobCategory.excavation : return excavationArea * excavationHeight;
      case JobCategory.breaker : return excavationArea * excavationHeight * projectConstants.breakerHourForOneCubicMeterExcavation;
    }
  }
}