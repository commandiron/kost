import 'package:kost/quantity_details/domain/model/project_constants.dart';
import 'package:kost/quantity_details/domain/model/project_variables.dart';

import '../../floor/floor.dart';
import '../../../../../common/model/job.dart';
import '../../jobs_generator/jobs_generator.dart';

class RoughConstructionJobsGenerator extends JobsGenerator {
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
        quantityExplanationBuilder: () {
          return "Hafriyat çevre uzunluğu: ${projectVariables.excavationPerimeter} x Hafriyat yüksekliği: $_excavationHeight";
        },
      ),
      Excavation( //✓
        quantityBuilder: () {
          return projectVariables.excavationArea * _excavationHeight;
        },
        quantityExplanationBuilder: () {
          return "Hafriyat alanı: ${projectVariables.excavationArea} x Hafriyat yüksekliği: $_excavationHeight";
        },
      ),
      Breaker( //✓
        quantityBuilder: () {
          return _excavationVolume * projectConstants.excavationAreaRockDensityConstant.breakerHourForOneCubicMeterExcavation;
        },
        quantityExplanationBuilder: () {
          return "Hafriyat hacmi: $_excavationVolume x Bir m3 hafriyat hacmi için kırıcı çalışma saati: ${projectConstants.excavationAreaRockDensityConstant.breakerHourForOneCubicMeterExcavation}";
        },
      ),
      FoundationStabilization( //KONTROL ETMEYE BURDA KALDIM
        quantityBuilder: () {
          return projectVariables.excavationArea *
              projectConstants.stabilizationHeight *
              projectConstants.gravelTonForOneCubicMeter;
        },
        quantityExplanationBuilder: () {
          return "Hafriyat alanı: ${projectVariables.excavationArea} x Temel altı stabilizasyon malzemesi yüksekliği: ${projectConstants.stabilizationHeight} x 1 m3 mıcır: ${projectConstants.gravelTonForOneCubicMeter} ton";
        },
      ),
      SubFoundationConcreteMaterial(
        quantityBuilder: () {
          return projectVariables.excavationArea *
              (projectConstants.leanConcreteHeight +
                  projectConstants.insulationConcreteHeight);
        },
        quantityExplanationBuilder: () {
          return "Hafriyat alanı: ${projectVariables.excavationArea} x (Grobeton yüksekliği: ${projectConstants.leanConcreteHeight} + Yalıtım koruma betonu yüksekliği: ${projectConstants.insulationConcreteHeight})";
        },
      ),
      ReinforcedConcreteWorkmanshipWithFormWorkMaterial(
        quantityBuilder: () {
          return _roughConstructionArea +
              _coreCurtainAreaWithoutSlab +
              _curtainsExceeding1MeterAreaWithoutSlab +
              _basementsCurtainAreaWithoutSlab;
        },
        quantityExplanationBuilder: () {
          return "Kaba inşaat alanı: $_roughConstructionArea + Çekirdek perdesi alanı: $_coreCurtainAreaWithoutSlab + 1 metreyi geçen perdelerin alanı: $_curtainsExceeding1MeterAreaWithoutSlab + Bodrum perdeleri alanı: $_basementsCurtainAreaWithoutSlab";
        },
      ),
      ConcreteMaterial(
        quantityBuilder: () {
          return _formWorkArea *
              projectConstants.concreteCubicMeterForOneSquareMeterFormWork;
        },
        quantityExplanationBuilder: () {
          return "Kalıp alanı (Düz ölçü): $_formWorkArea x 1 m2 kalıp için m3 biriminde beton hacmi: ${projectConstants.concreteCubicMeterForOneSquareMeterFormWork}";
        },
      ),
      RebarMaterial(
        quantityBuilder: () {
          return _concreteVolume * projectConstants.rebarTonForOneCubicMeterConcrete;
        },
        quantityExplanationBuilder: () {
          return "Beton hacmi: $_concreteVolume x 1 m3 beton için ton biriminde demir ağırlığı: ${projectConstants.rebarTonForOneCubicMeterConcrete}";
        },
      ),
      HollowFloorFillingMaterial(
        quantityBuilder: () {
          return projectConstants.hollowAreaForOneSquareMeterConstructionArea *
              _hollowSlabRoughConstructionArea *
              projectConstants.hollowFillingThickness;
        },
        quantityExplanationBuilder: () {
          return "1 m2 kaba inşaat alanı için m2 biriminde asmolen alanı: ${projectConstants.hollowAreaForOneSquareMeterConstructionArea} x Asmolen döşeme inşaat alanı: $_hollowSlabRoughConstructionArea x Asmolen kalınlığı: ${projectConstants.hollowFillingThickness}";
        },
      ),
      FoundationWaterproofing(
        quantityBuilder: () {
          return _bottomMostBasementFloor.area +
              (_bottomMostBasementFloor.perimeter *
                  projectConstants.foundationHeight);
        },
        quantityExplanationBuilder: () {
          return "En alt bodrum alanı: ${_bottomMostBasementFloor.area} + (En alt bodrum çevre uzunluğu: ${_bottomMostBasementFloor.perimeter} x Temel yüksekliği: ${projectConstants.foundationHeight})";
        },
      ),
      CurtainWaterproofing(
        quantityBuilder: () {
          return _basementsOuterCurtainArea + _wetAreaAboveBasement;
        },
        quantityExplanationBuilder: () {
          return "Bodrum dış perdesi ıslak alanı: $_basementsOuterCurtainArea + Bodrum üstü ıslak alanı: $_wetAreaAboveBasement";
        },
      ),
      CurtainProtectionBeforeFilling(
        quantityBuilder: () {
          return _basementsOuterCurtainArea;
        },
        quantityExplanationBuilder: () {
          return "Bodrum dış perdesi ıslak alanı: $_basementsOuterCurtainArea";
        },
      ),
      // Duvar metrajı hesaplanırken hiç bir şekilde minha yapmıyorum,
      // proje üzerinden kapıların düşülmediğini, pencere lento üstü
      // duvarlarında eklenmediğini kabul ediyorum.
      // Bu şekilde tam olarak doğru olmasa da, gerçeğe yakın olarak
      // kabul ediyorum.
      Wall(
        quantityBuilder: () {
          return _thickWallVolume + _thinWallVolume;
        },
        quantityExplanationBuilder: () {
          return "Kalın duvar hacmi (kalınlık: ${projectConstants.thickWallThickness}): $_thickWallVolume + İnce duvar hacmi(kalınlık: ${projectConstants.thinWallThickness}): $_thinWallVolume";
        },
      ),
      WallWorkmanShip(
        quantityBuilder: () {
          return _thickWallArea + _thinWallArea;
        },
        quantityExplanationBuilder: () {
          return "Kalın duvar alanı: $_thickWallArea + İnce duvar alanı: $_thinWallArea";
        },
      ),
    ];
  }

  Floor get _topFloor {
    final topFloor = floors.reduce((current, next) {
      return current.no > next.no ? current : next;
    });
    return topFloor;
  }

  Floor get _groundFloor {
    final groundFloor = floors.firstWhere(
      (floor) => floor.no == 0,
      orElse: () => throw Exception("No ground floor"),
    );
    return groundFloor;
  }

  List<Floor> get _basementFloors { //✓
    final basementFloors = floors.where((floor) => floor.no < 0).toList();
    if (basementFloors.isEmpty) {
      throw Exception("No basement floor");
    }
    return basementFloors;
  }

  Floor get _topMostBasementFloor {
    final topMostBasementFloor = _basementFloors.reduce((current, next) {
      return current.no > next.no ? current : next;
    });
    return topMostBasementFloor;
  }

  Floor get _bottomMostBasementFloor {
    final bottomMostBasementFloor = _basementFloors.reduce((current, next) {
      return current.no < next.no ? current : next;
    });
    return bottomMostBasementFloor;
  }

  double get _excavationHeight { //✓
    return projectConstants.stabilizationHeight +
        projectConstants.leanConcreteHeight +
        projectConstants.insulationConcreteHeight +
        projectConstants.foundationHeight +
        _basementsHeight;
  }

  double get _excavationVolume {
    return projectVariables.excavationArea * _excavationHeight;
  }

  double get _basementsHeight { //✓
    return _basementFloors
        .map((floor) => floor.heightWithSlab)
        .fold(0.0, (p, c) => p + c);
  }

  double get _basementsHeightWithoutSlab {
    return _basementFloors
        .map((floor) => floor.heightWithSlab - floor.slabHeight)
        .fold(0.0, (p, c) => p + c);
  }

  double get _basementsCurtainAreaWithoutSlab {
    return projectVariables.basementCurtainLength * _basementsHeightWithoutSlab;
  }

  double get _basementsOuterCurtainArea {
    return _basementFloors
        .map((floor) => floor.perimeter * floor.heightWithSlab)
        .fold(0.0, (p, c) => p + c);
  }

  double get _roughConstructionArea {
    double roughConstructionArea = 0;
    for (var floor in floors) {
      if (floor.no == 0) {
        roughConstructionArea +=
            floors.firstWhere((floor) => floor.no == -1).area;
      } else {
        roughConstructionArea += floor.area;
      }
    }
    roughConstructionArea += _topFloor.area;
    roughConstructionArea += projectVariables.elevationTowerArea;
    return roughConstructionArea;
  }

  double get _buildingHeightWithoutSlabs {
    return floors
        .map((floor) => floor.heightWithSlab - floor.slabHeight)
        .fold(0.0, (p, c) => p + c);
  }

  double get _coreCurtainAreaWithoutSlab {
    return projectVariables.coreCurtainLength *
        (_buildingHeightWithoutSlabs +
            projectVariables.elevationTowerHeightWithoutSlab);
  }

  double get _curtainsExceeding1MeterAreaWithoutSlab {
    return projectVariables.curtainsExceeding1MeterLength *
        _buildingHeightWithoutSlabs;
  }

  double get _hollowSlabRoughConstructionArea {
    return floors
        .where((floor) => floor.isSlabHollow)
        .map((ceilingSlabFloor) => ceilingSlabFloor.area)
        .fold(0.0, (p, c) => p + c);
  }

  double get _wetAreaAboveBasement {
    return _topMostBasementFloor.area - _groundFloor.area;
  }

  double get _thickWallArea {
    return floors
        .map((floor) =>
            floor.thickWallLength * (floor.heightWithSlab - floor.slabHeight))
        .fold(0.0, (p, c) => p + c);
  }

  double get _thickWallVolume {
    return _thickWallArea * projectConstants.thickWallThickness;
  }

  double get _thinWallArea {
    return floors
        .map((floor) =>
            floor.thinWallLength * (floor.heightWithSlab - floor.slabHeight))
        .fold(0.0, (p, c) => p + c);
  }

  double get _thinWallVolume {
    return _thinWallArea * projectConstants.thinWallThickness;
  }

  double get _formWorkArea {
    return _roughConstructionArea +
        _coreCurtainAreaWithoutSlab +
        _curtainsExceeding1MeterAreaWithoutSlab +
        _basementsCurtainAreaWithoutSlab;
  }

  double get _concreteVolume {
    return _formWorkArea *
        projectConstants.concreteCubicMeterForOneSquareMeterFormWork;
  }
}
