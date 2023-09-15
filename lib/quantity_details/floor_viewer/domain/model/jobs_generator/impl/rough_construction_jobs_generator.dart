import 'package:collection/collection.dart';
import 'package:kost/quantity_details/floor_viewer/domain/model/project_constants.dart';
import 'package:kost/quantity_details/floor_viewer/domain/model/project_variables.dart';

import '../../floor/floor.dart';
import '../../../../../../common/model/job.dart';
import '../jobs_generator.dart';

class RoughConstructionJobsGenerator extends JobsGenerator { //✓
  RoughConstructionJobsGenerator({
    super.name = "Kaba İnşaat",
    required this.projectConstants,
    required this.projectVariables,
    required this.floors,
  });

  final ProjectConstants projectConstants;
  final ProjectVariables projectVariables;
  final List<Floor> floors;

  @override
  List<Job> createJobs() {
    return [
      Shoring( //✓
        quantityBuilder: () {
          return projectVariables.excavationPerimeter * _excavationHeight;
        },
      ),
      Excavation( //✓
        quantityBuilder: () {
          return _excavationVolume;
        },
      ),
      Breaker( //✓
        quantityBuilder: () {
          return _excavationVolume * projectConstants.excavationAreaRockDensityConstant.breakerHourForOneCubicMeterExcavation;
        },
      ),
      FoundationStabilization( //✓
        quantityBuilder: () {
          return projectVariables.excavationArea *
              projectConstants.stabilizationHeight *
              projectConstants.gravelTonForOneCubicMeter;
        },
      ),
      SubFoundationConcreteMaterial( //✓
        quantityBuilder: () {
          return projectVariables.excavationArea *
              (projectConstants.leanConcreteHeight +
                  projectConstants.insulationConcreteHeight);
        },
      ),
      ReinforcedConcreteWorkmanshipWithFormWorkMaterial( //✓
        quantityBuilder: () {
          return _formWorkArea;
        },
      ),
      ConcreteMaterial( //✓
        quantityBuilder: () {
          return _concreteVolume;
        },
      ),
      RebarMaterial( //✓
        quantityBuilder: () {
          return _concreteVolume * projectConstants.rebarTonForOneCubicMeterConcrete;
        },
      ),
      HollowFloorFillingMaterial( //✓
        quantityBuilder: () {
          return projectConstants.hollowAreaForOneSquareMeterConstructionArea *
              _hollowSlabRoughConstructionArea *
              projectConstants.hollowFillingThickness;
        },
      ),
      FoundationWaterproofing( //✓
        quantityBuilder: () {
          return projectVariables.foundationArea +
              (projectVariables.foundationPerimeter *
                  projectVariables.foundationHeight);
        },
      ),
      CurtainWaterproofing( //✓
        quantityBuilder: () {
          return _basementsOuterCurtainArea + _wetAreaAboveBasement;
        },
      ),
      CurtainProtectionBeforeFilling( //✓
        quantityBuilder: () {
          return _basementsOuterCurtainArea;
        },
      ),
      Wall( //✓
        quantityBuilder: () {
          return _thickWallVolume + _thinWallVolume;
        },
      ),
      WallWorkmanShip( //✓
        quantityBuilder: () {
          return _thickWallArea + _thinWallArea;
        },
      ),
    ];
  }

  Map<Floor, double> get _floorToCeilingAreaMap { //✓
    Map<Floor, double> result = {};
    for(var floor in floors) {
      result.putIfAbsent(floor, () {
        final ceilingArea = floors.firstWhereOrNull((e) => e.no == floor.no + 1)?.area ?? 0;
        if(floor.area > ceilingArea) {
          return floor.area;
        }
        return ceilingArea;
      });
    }
    return result;
  }

  Floor get _groundFloor { //✓
    final result = floors.firstWhere(
      (floor) => floor.no == 0,
      orElse: () => throw Exception("No ground floor"),
    );
    return result;
  }

  List<Floor> get _allBasementFloors { //✓
    final result = floors.where((floor) => floor.no < 0).toList();
    if (result.isEmpty) {
      throw Exception("No basement floor");
    }
    return result;
  }

  double get _excavationHeight { //✓
    return projectConstants.stabilizationHeight
      +
      projectConstants.leanConcreteHeight
      +
      projectConstants.insulationConcreteHeight
      +
      projectVariables.foundationHeight
      +
      _allBasementsHeight
    ;
  }

  double get _excavationVolume { //✓
    final result = projectVariables.excavationArea * _excavationHeight;
    return result;
  }

  double get _allBasementsHeight { //✓
    final result = _allBasementFloors
        .map((floor) => floor.heightWithSlab)
        .fold(0.0, (p, c) => p + c);
    return result;
  }

  double get _allBasementsHeightWithoutSlab { //✓
    final result = _allBasementFloors
      .map((floor) => floor.heightWithSlab - floor.slabHeight)
      .fold(0.0, (p, c) => p + c);
    return result;
  }

  double get _basementsCurtainAreaWithoutSlab { //✓
    return projectVariables.basementCurtainLength * _allBasementsHeightWithoutSlab;
  }

  double get _basementsOuterCurtainArea { //✓
    final result = _allBasementFloors
      .map((floor) => floor.perimeter * floor.heightWithSlab)
      .fold(0.0, (p, c) => p + c);
    return result;
  }

  double get _roughConstructionArea { //✓
    double result = 0;
    result += projectVariables.foundationArea;
    result += _floorToCeilingAreaMap.values.fold(0.0, (p, c) => p + c);
    result += projectVariables.elevationTowerArea;
    return result;
  }

  double get _buildingHeightWithoutSlabs { //✓
    final result = floors
        .map((floor) => floor.heightWithSlab - floor.slabHeight)
        .fold(0.0, (p, c) => p + c);
    return result;
  }

  double get _coreCurtainAreaWithoutSlab { //✓
    final result = projectVariables.coreCurtainLength *
        (_buildingHeightWithoutSlabs + projectVariables.elevationTowerHeightWithoutSlab);
    return result;
  }

  double get _curtainsExceeding1MeterAreaWithoutSlab { //✓
    final result = projectVariables.curtainsExceeding1MeterLength * _buildingHeightWithoutSlabs;
    return result;
  }

  double get _formWorkArea { //✓
    return _roughConstructionArea +
        _coreCurtainAreaWithoutSlab +
        _curtainsExceeding1MeterAreaWithoutSlab +
        _basementsCurtainAreaWithoutSlab;
  }

  double get _concreteVolume { //✓
    return _formWorkArea * projectConstants.concreteCubicMeterForOneSquareMeterFormWork;
  }

  double get _hollowSlabRoughConstructionArea { //✓
    double result = 0;
    _floorToCeilingAreaMap.forEach((floor, ceilingArea) {
      if(floor.isCeilingSlabHollow) {
        result += ceilingArea;
      }
    });
    return result;
  }

  double get _wetAreaAboveBasement { //✓
    double topMostBasementFloorCeilingArea = 0;
    _floorToCeilingAreaMap.forEach((floor, ceilingArea) {
      if(floor.no == -1) {
        topMostBasementFloorCeilingArea = ceilingArea;
      }
    });
    final result = topMostBasementFloorCeilingArea - _groundFloor.area;
    return result;
  }

  double get _thickWallArea { //✓
    final result = floors
      .map(
        (floor) {
          final wallArea = floor.thickWallLength * (floor.heightWithSlab - floor.slabHeight);
          double windowArea = 0;
          for(var floorSection in floor.sections) {
            for(var room in floorSection.rooms) {
              for(var window in room.windows) {
                windowArea += (window.width * window.height);
              }
            }
          }
          return wallArea - windowArea;
        }
    ).fold(0.0, (p, c) => p + c);
    return result;
  }

  double get _thickWallVolume { //✓
    return _thickWallArea * projectConstants.thickWallThickness;
  }

  double get _thinWallArea { //✓
    final result = floors
      .map(
        (floor) {
          final wallArea = floor.thinWallLength * (floor.heightWithSlab - floor.slabHeight);
          double doorArea = 0;
          for (var floorSection in floor.sections) {
            for (var room in floorSection.rooms) {
              doorArea += room.doors.length * projectConstants.commonDoorArea;
            }
          }
          return wallArea - doorArea;
      }
    ).fold(0.0, (p, c) => p + c);
    return result;
  }

  double get _thinWallVolume { //✓
    return _thinWallArea * projectConstants.thinWallThickness;
  }
}
