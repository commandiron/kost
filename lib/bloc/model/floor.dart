import 'package:collection/collection.dart';
import 'package:kost/bloc/model/project_constants.dart';

import 'cost_item.dart';

class ProjectCalculator {
  final ProjectConstants projectConstants;
  final double excavationLength;
  final double excavationArea;
  final List<Floor> floors;
  double foundationHeight;
  final double insulationConcreteHeight;
  final double leanConcreteHeight;
  final double stabilizationHeight;

  ProjectCalculator(
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

  List<CostItem> get excavationCostItems {
    return [
      Shoring(
          quantity: excavationLength *excavationHeight
      ),
      Excavation(
          quantity: excavationArea * excavationHeight
      ),
      Breaker(
          quantity: excavationArea * excavationHeight * projectConstants.breakerHourForOneCubicMeterExcavation
      )
    ];
  }
}



class Floor {
  final double area;
  final double height;
  final FloorType type;

  Floor (
    {
      required this.area,
      this.height = 3.3,
      required this.type
    }
  );
}

enum FloorType {
  b3, b2, b1, z, k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k20
}