import 'package:kost/domain/calculator/detailed/floor_area.dart';
import 'package:kost/domain/calculator/detailed/project_constants.dart';
import 'package:kost/domain/calculator/detailed/room.dart';

import '../quantity_calculator.dart';
import 'floor.dart';

class DetailedQuantityCalculator extends QuantityCalculator {
  final ProjectConstants projectConstants;
  final double landArea;
  final double landPerimeter;
  final double excavationArea;
  final double excavationPerimeter;
  final double coreCurtainLength;
  final double curtainsExceeding1MeterLength;
  final double columnsLess1MeterPerimeter;
  final double elevationTowerArea;
  final double elevationTowerHeightWithoutSlab;
  final List<Floor> floors;
  final double foundationArea;
  final double foundationPerimeter;
  final double foundationHeight;

  DetailedQuantityCalculator(
    {
      required this.projectConstants,
      required this.landArea,
      required this.landPerimeter,
      required this.excavationArea,
      required this.excavationPerimeter,
      required this.coreCurtainLength,
      required this.curtainsExceeding1MeterLength,
      required this.columnsLess1MeterPerimeter,
      required this.elevationTowerArea,
      required this.elevationTowerHeightWithoutSlab,
      required this.floors,
      required this.foundationArea,
      required this.foundationPerimeter,
      required this.foundationHeight,
    }
  );

  //Calculations
  Floor get _topMostBasementFloor {
    for (var basementType in Floor.basementTypes) {
      if (floors.any((floor) => floor.type == basementType)) {
        return floors.firstWhere((floor) => floor.type == basementType);
      }
    }

    throw Exception("No top most basement.");
  }

  Floor get _groundFloor {
    return floors.firstWhere((e) => e.type == Floor.groundType);
  }

  Floor get _topFloor {
    final List<FloorType> normalFloorTypes =
        Floor.normalTypes.reversed.toList();
    for (var normalFloorType in normalFloorTypes) {
      if (floors.any((floor) => floor.type == normalFloorType)) {
        return floors.firstWhere((floor) => floor.type == normalFloorType);
      }
    }

    throw Exception("No top floor.");
  }

  List<Floor> get _basementFloors {
    return floors
        .where((floor) =>
            floor.type == FloorType.b3 ||
            floor.type == FloorType.b2 ||
            floor.type == FloorType.b1)
        .toList();
  }

  List<Floor> get _normalFloors {
    return floors.where((e) => Floor.normalTypes.contains(e.type)).toList();
  }

  List<Floor> get _aboveBasementFloors {
    return [
      ..._normalFloors,
      _groundFloor,
    ];
  }

  double get _excavationHeight {
    return projectConstants.stabilizationHeight +
        projectConstants.leanConcreteHeight +
        projectConstants.insulationConcreteHeight +
        foundationHeight +
        _basementsHeight;
  }

  double get _basementsHeight {
    double basementsHeight = 0;
    for (var basementFloor in _basementFloors) {
      basementsHeight += basementFloor.fullHeight;
    }
    return basementsHeight;
  }

  double get _roughConstructionArea {
    double roughConstructionArea = 0;
    roughConstructionArea += foundationArea;
    for (var floor in floors) {
      roughConstructionArea += floor.ceilingArea;
    }
    roughConstructionArea += elevationTowerArea;
    return roughConstructionArea;
  }

  double get _hollowSlabRoughConstructionArea {
    double roughConstructionArea = 0;
    final hollowSlabFloors =
        floors.where((e) => e.isCeilingHollowSlab == true).toList();
    for (var floor in hollowSlabFloors) {
      roughConstructionArea += floor.ceilingArea;
    }
    return roughConstructionArea;
  }

  double get _buildingHeightWithoutSlabs {
    return floors
        .map((e) => e.heightWithoutSlab)
        .toList()
        .fold(0.0, (p, c) => p + c);
  }

  double get _coreCurtainArea {
    return coreCurtainLength *
        (_buildingHeightWithoutSlabs + elevationTowerHeightWithoutSlab);
  }

  double get _curtainsExceeding1MeterArea {
    return curtainsExceeding1MeterLength * _buildingHeightWithoutSlabs;
  }

  double get _columnsSurfaceArea {
    return columnsLess1MeterPerimeter * _buildingHeightWithoutSlabs;
  }

  double get _basementsOuterCurtainAreaWithoutSlab {
    double resultArea = 0;
    for (var basementFloor in _basementFloors) {
      resultArea += basementFloor.perimeter * basementFloor.heightWithoutSlab;
    }
    return resultArea;
  }

  double get _basementsOuterCurtainArea {
    double resultArea = 0;
    for (var basementFloor in _basementFloors) {
      resultArea += basementFloor.perimeter * basementFloor.fullHeight;
    }
    return resultArea;
  }

  double get _wetAreaAboveBasement {
    return _topMostBasementFloor.ceilingArea - _groundFloor.area;
  }

  double get _thickWallArea {
    return floors
        .map((e) => e.thickWallLength * e.heightWithoutSlab)
        .toList()
        .fold(0.0, (p, c) => p + c);
  }

  double get _thickWallVolume {
    return _thickWallArea * projectConstants.thickWallThickness;
  }

  double get _thinWallArea {
    return floors
        .map((e) => e.thinWallLength * e.heightWithoutSlab)
        .toList()
        .fold(0.0, (p, c) => p + c);
  }

  double get _thinWallVolume {
    return _thinWallArea * projectConstants.thinWallThickness;
  }

  double get _totalFacadeArea {
    return _aboveBasementFloors
        .map((e) => e.perimeter * e.fullHeight)
        .toList()
        .fold(0.0, (p, c) => p + c);
  }

  double get _totalWindowArea {
    if (floors.every((element) => element.windows == null)) {
      return 0;
    }

    final floorsWithWindow =
        floors.where((element) => element.windows != null).toList();

    double totalWindowArea = 0;
    for (var floor in floorsWithWindow) {
      totalWindowArea += floor.windows!
          .map((window) => window.width * window.height * window.count)
          .toList()
          .fold(0.0, (p, c) => p + c);
    }

    return totalWindowArea;
  }

  double get _totalFacadeRailingLength {
    if (floors.every((element) => element.windows == null)) {
      return 0;
    }

    final floorsWithWindow =
        floors.where((element) => element.windows != null).toList();

    double totalRailingLength = 0;
    for (var floor in floorsWithWindow) {
      totalRailingLength += floor.windows!
          .map((window) => window.hasRailing ? window.width * window.count : 0)
          .toList()
          .fold(0.0, (p, c) => p + c);
    }

    return totalRailingLength;
  }

  double get _totalWindowsillLength {
    if (floors.every((element) => element.windows == null)) {
      return 0;
    }

    final floorsWithWindow =
    floors.where((element) => element.windows != null).toList();

    double totalRailingLength = 0;
    for (var floor in floorsWithWindow) {
      totalRailingLength += floor.windows!
          .map((window) => window.hasWindowsill ? window.width * window.count : 0)
          .toList()
          .fold(0.0, (p, c) => p + c);
    }

    return totalRailingLength;
  }

  double get _totalOuterWallArea {
    return _totalFacadeArea - _totalWindowArea;
  }

  double get _totalInnerWallArea {
    return (_thickWallArea - _totalOuterWallArea + _thinWallArea);
  }

  double get _totalCeilingArea {
    return floors.map((e) => e.ceilingArea).toList().fold(0.0, (p, c) => p + c);
  }

  double get _totalInteriorWetFloorArea {
    double area = 0;
    for (var floor in floors) {
      for (var buildingArea in floor.floorAreas) {
        for (var room in buildingArea.rooms) {
          if (room.isFloorWet) {
            area += room.area;
          }
        }
      }
    }
    return area;
  }

  double get _totalDryWallArea {
    double area = 0;
    for (var floor in floors) {
      for (var buildingArea in floor.floorAreas) {
        for (var room in buildingArea.rooms) {
          if (room.ceilingMaterial == CeilingMaterial.drywall) {
            area += room.area;
          }
        }
      }
    }
    return area;
  }

  double get _totalCovingPlasterLength {
    double length = 0;
    for (var floor in floors) {
      for (var buildingArea in floor.floorAreas) {
        for (var room in buildingArea.rooms) {
          if (room.hasCovingPlaster) {
            length += room.perimeter;
          }
        }
      }
    }
    return length;
  }

  double get _totalScreedArea {
    double area = 0;
    for (var floor in floors) {
      for (var buildingArea in floor.floorAreas) {
        for (var room in buildingArea.rooms) {
          if (room.hasScreed) {
            area += room.area;
          }
        }
      }
    }
    return area;
  }

  double get _totalMarbleArea {
    double area = 0;
    for (var floor in floors) {
      for (var buildingArea in floor.floorAreas) {
        for (var room in buildingArea.rooms) {
          if (room.floorMaterial == FloorMaterial.marble) {
            area += room.area;
          }
        }
      }
    }
    return area;
  }

  double get _totalBuildingStairsHeight {
    return floors.map((e) => e.fullHeight).toList().fold(0.0, (p, e) => p + e) - _topFloor.fullHeight;
  }

  int get _totalMainStairsCount {
    return _totalBuildingStairsHeight ~/ projectConstants.stairRiserHeight;
  }

  double get _totalMainStairsLength {
    return _totalMainStairsCount * projectConstants.mainStairsStepLength;
  }

  int get _totalFireStairsCount {
    return _totalBuildingStairsHeight ~/ projectConstants.stairRiserHeight;
  }

  double get _totalFireStairsLength {
    return _totalFireStairsCount * projectConstants.fireStairsStepLength;
  }

  double get _totalCeramicFloorArea {
    double area = 0;
    for (var floor in floors) {
      for (var buildingArea in floor.floorAreas) {
        for (var room in buildingArea.rooms) {
          if (room.floorMaterial == FloorMaterial.ceramic) {
            area += room.area;
          }
        }
      }
    }
    return area;
  }

  double get _totalCeramicWallArea {
    double area = 0;
    for (var floor in floors) {
      for (var buildingArea in floor.floorAreas) {
        for (var room in buildingArea.rooms) {
          if (room.wallMaterial == WallMaterial.ceramic) {
            area += room.perimeter * floor.heightWithoutSlab;
          }
        }
      }
    }
    return area;
  }

  double get _totalParquetFloorArea {
    double area = 0;
    for (var floor in floors) {
      for (var buildingArea in floor.floorAreas) {
        for (var room in buildingArea.rooms) {
          if (room.floorMaterial == FloorMaterial.parquet) {
            area += room.area;
          }
        }
      }
    }
    return area;
  }

  int get _steelDoorNumber {
    int number = 0;
    for (var floor in floors) {
      for (var buildingArea in floor.floorAreas) {
        if(buildingArea is Apartment) {
          number ++;
        }
      }
    }
    return number;
  }

  int get _woodenDoorNumber {
    int number = 0;
    for (var floor in floors) {
      for (var buildingArea in floor.floorAreas) {
        if(buildingArea is Apartment) {
          for (var room in buildingArea.rooms) {
            if(room is Saloon || room is SaloonWithKitchen || room is NormalRoom || room is Kitchen || room is Wc || room is Bathroom) {
              number ++;
            }
          }
        }
      }
    }
    return number;
  }

  int get _fireDoorNumber {
    int number = 0;
    for (var floor in floors) {
      for (var buildingArea in floor.floorAreas) {
        if(buildingArea is Apartment) {
          number += 2;
        }
        if(buildingArea is CommonArea) {
          for (var room in buildingArea.rooms) {
            if(room is TechnicalArea) {
              number ++;
            }
          }
        }
      }
    }
    return number;
  }

  int get _airConditionerNumber {
    int number = 0;
    for (var floor in floors) {
      for (var buildingArea in floor.floorAreas) {
        if(buildingArea is Apartment) {
          number += projectConstants.airConditionerNumberForOneApartment;
        }
      }
    }
    return number;
  }

  int get _kitchenNumber {
    int number = 0;
    for (var floor in floors) {
      for (var buildingArea in floor.floorAreas) {
        for (var room in buildingArea.rooms) {
          if(room is Kitchen || room is SaloonWithKitchen) {
            number ++;
          }
        }
      }
    }
    return number;
  }

  int get _bathroomNumber {
    int number = 0;
    for (var floor in floors) {
      for (var buildingArea in floor.floorAreas) {
        for (var room in buildingArea.rooms) {
          if(room is Bathroom) {
            number ++;
          }
        }
      }
    }
    return number;
  }

  int get _toiletNumber {
    int number = 0;
    for (var floor in floors) {
      for (var buildingArea in floor.floorAreas) {
        for (var room in buildingArea.rooms) {
          if(room is Bathroom || room is Wc) {
            number ++;
          }
        }
      }
    }
    return number;
  }

  int get _apartmentNumber {
    int number = 0;
    for (var floor in floors) {
      for (var buildingArea in floor.floorAreas) {
        if(buildingArea is Apartment) {
          number ++;
        }
      }
    }
    return number;
  }

  double get _totalFloorPlinthLength {
    double length = 0;
    for (var floor in floors) {
      for (var buildingArea in floor.floorAreas) {
        for (var room in buildingArea.rooms) {
          if (room.hasFloorPlinth) {
            length += room.perimeter;
          }
        }
      }
    }
    return length;
  }

  double get _basementsArea {
    return _basementFloors.map((e) => e.area).toList().fold(0.0, (p, c) => p + c);
  }

  //Final Results
  @override
  double get shoringArea {
    return excavationPerimeter * _excavationHeight;
  }
  @override
  String get shoringAreaExplanation {
    return "Hafriyat çevre uzunluğu: $excavationPerimeter x Hafriyat yüksekliği: $_excavationHeight";
  }

  @override
  double get excavationVolume {
    return excavationArea * _excavationHeight;
  }
  @override
  String get excavationVolumeExplanation {
    return "Hafriyat alanı: $excavationArea x Hafriyat yüksekliği: $_excavationHeight";
  }

  @override
  double get breakerHour {
    return excavationArea *
        _excavationHeight *
        projectConstants.breakerHourForOneCubicMeterMediumRockExcavation;
  }
  @override
  String get breakerHourExplanation {
    return "Hafriyat alanı: $excavationArea x Hafriyat yüksekliği: $_excavationHeight x Bir m3 orta sertlikte kaya içeren hafriyat için kırıcı çalışma süresi: ${projectConstants.breakerHourForOneCubicMeterMediumRockExcavation}";
  }

  @override
  double get foundationStabilizationVolume {
    return excavationArea * projectConstants.stabilizationHeight;
  }
  @override
  String get foundationStabilizationVolumeExplanation {
    return "Hafriyat alanı: $excavationArea x Temel altı stabilizasyon malzemesi yüksekliği: ${projectConstants.stabilizationHeight}";
  }

  @override
  double get subFoundationConcreteVolume {
    return excavationArea * (projectConstants.leanConcreteHeight + projectConstants.insulationConcreteHeight);
  }
  @override
  String get subFoundationConcreteVolumeExplanation {
    return "Hafriyat alanı: $excavationArea x (Grobeton yüksekliği: ${projectConstants.leanConcreteHeight} + Yalıtım koruma betonu yüksekliği: ${projectConstants.insulationConcreteHeight})";
  }

  @override
  double get concreteFormWorkArea {
    return _roughConstructionArea +
        _coreCurtainArea +
        _curtainsExceeding1MeterArea +
        _basementsOuterCurtainAreaWithoutSlab;
  }
  @override
  String get concreteFormWorkAreaExplanation {
    return "Kaba inşaat alanı: $_roughConstructionArea + Çekirdek perdesi alanı: $_coreCurtainArea + 1 metreyi geçen perdelerin alanı: $_curtainsExceeding1MeterArea + Bodrum dış perdeleri alanı: $_basementsOuterCurtainAreaWithoutSlab";
  }

  @override
  double get pouringConcreteVolume {
    return concreteFormWorkArea *
        projectConstants.concreteCubicMeterForOneSquareMeterFormWork;
  }
  @override
  String get pouringConcreteVolumeExplanation {
    return "Kalıp alanı (Düz ölçü): $concreteFormWorkArea x 1 m2 kalıp için m3 biriminde beton hacmi: ${projectConstants.concreteCubicMeterForOneSquareMeterFormWork}";
  }

  @override
  double get rebarWeight {
    return pouringConcreteVolume *
        projectConstants.rebarTonForOneCubicMeterConcrete;
  }
  @override
  String get rebarWeightExplanation {
    return "Beton hacmi: $pouringConcreteVolume x 1 m3 beton için ton biriminde demir ağırlığı: ${projectConstants.rebarTonForOneCubicMeterConcrete}";
  }

  @override
  double get hollowFloorFillingVolume {
    return projectConstants.hollowAreaForOneSquareMeterConstructionArea *
        _hollowSlabRoughConstructionArea *
        projectConstants.hollowFillingThickness;
  }
  @override
  String get hollowFloorFillingVolumeExplanation {
    return "1 m2 kaba inşaat alanı için m2 biriminde asmolen alanı: ${projectConstants.hollowAreaForOneSquareMeterConstructionArea} x Asmolen döşeme inşaat alanı: $_hollowSlabRoughConstructionArea x Asmolen kalınlığı: ${projectConstants.hollowFillingThickness}";
  }

  @override
  double get foundationWaterProofingArea {
    return foundationArea + (foundationPerimeter * foundationHeight);
  }
  @override
  String get foundationWaterProofingAreaExplanation {
    return "Temel alanı: $foundationArea + (Temel çevre uzunluğu: $foundationPerimeter x Temel yüksekliği: $foundationHeight)";
  }

  @override
  double get curtainWaterProofingArea {
    return _basementsOuterCurtainArea + _wetAreaAboveBasement;
  }
  @override
  String get curtainWaterProofingAreaExplanation {
    return "Bodrum dış perdesi ıslak alanı: $_basementsOuterCurtainArea + Bodrum üstü ıslak alanı: $_wetAreaAboveBasement";
  }

  @override
  double get curtainProtectionBeforeFillingArea {
    return _basementsOuterCurtainArea;
  }
  @override
  String get curtainProtectionBeforeFillingAreaExplanation {
    return "Bodrum dış perdesi ıslak alanı: $_basementsOuterCurtainArea";
  }

  @override
  double get wallMaterialVolume {
    return _thickWallVolume + _thinWallVolume;
  }
  @override
  String get wallMaterialVolumeExplanation {
    return "Kalın duvar hacmi (kalınlık: ${projectConstants.thickWallThickness}): $_thickWallVolume + İnce duvar hacmi(kalınlık: ${projectConstants.thinWallThickness}): $_thinWallVolume";
  }

  @override
  double get wallWorkmanShipArea {
    return _thickWallArea + _thinWallArea;
  }
  @override
  String get wallWorkmanShipAreaExplanation {
    return "Kalın duvar alanı: $_thickWallArea + İnce duvar alanı: $_thinWallArea";
  }

  @override
  double get roofingArea {
    return _topFloor.ceilingArea;
  }
  @override
  String get roofingAreaExplanation {
    return "En üst kat tavan alanı: ${_topFloor.ceilingArea}";
  }

  @override
  double get facadeScaffoldingArea {
    return _totalFacadeArea;
  }
  @override
  String get facadeScaffoldingAreaExplanation {
    return "Toplam cephe alanı: $_totalFacadeArea";
  }

  @override
  double get windowsArea {
    return _totalWindowArea;
  }
  @override
  String get windowAreaExplanation {
    return "Toplam pencere alanı: $_totalWindowArea";
  }

  @override
  double get facadeRailsLength {
    return _totalFacadeRailingLength;
  }
  @override
  String get facadeRailsLengthExplanation {
    return "Toplam cephe korkuluğu uzunluğu: $_totalFacadeRailingLength";
  }

  @override
  double get facadeSystemArea {
    return _totalFacadeArea - _totalWindowArea;
  }
  @override
  String get facadeSystemAreaExplanation {
    return "Toplam cephe alanı: $_totalFacadeArea - Toplam pencere alanı: $_totalWindowArea";
  }

  @override
  double get interiorPlasteringArea {
    return _basementsOuterCurtainArea +
        (_coreCurtainArea * 2) +
        (_curtainsExceeding1MeterArea * 2) +
        _columnsSurfaceArea +
        _totalOuterWallArea +
        (_totalInnerWallArea * 2);
  }
  @override
  String get interiorPlasteringAreaExplanation {
    return "Toplam bodrumlar dış perde alanı: $_basementsOuterCurtainAreaWithoutSlab + Çekirdek perdeleri toplam alanı: $_coreCurtainArea x 2 (Çift yüz) + Toplam 1 metreyi geçen perde alanı: $_curtainsExceeding1MeterArea x 2 (Çift yüz) + Kolon yüzey alanı: $_columnsSurfaceArea + Toplam dış duvar alanı: $_totalOuterWallArea + Toplam iç duvar alanı: $_totalInnerWallArea x 2 (Çift yüz)";
  }

  @override
  double get interiorPaintingArea {
    return interiorPlasteringArea + _totalCeilingArea;
  }
  @override
  String get interiorPaintingAreaExplanation {
    return "Toplam sıva alanı: $interiorPlasteringArea + Toplam tavan alanı: $_totalCeilingArea";
  }

  @override
  double get interiorWaterproofingArea {
    return _totalInteriorWetFloorArea;
  }
  @override
  String get interiorWaterproofingAreaExplanation {
    return "Toplam iç mekan ıslak zemin alanı: $_totalInteriorWetFloorArea";
  }

  @override
  double get ceilingCoveringArea {
    return _totalDryWallArea;
  }
  @override
  String get ceilingCoveringAreaExplanation {
    return "Toplam alçıpan alanı: $_totalDryWallArea";
  }

  @override
  double get covingPlasterArea {
    return _totalCovingPlasterLength;
  }
  @override
  String get covingPlasterAreaExplanation {
    return "Toplam kartonpiyer uzunluğu: $_totalCovingPlasterLength";
  }

  @override
  double get screedingArea {
    return _totalScreedArea;
  }
  @override
  String get screedingAreaExplanation {
    return "Toplam şap alanı: $_totalScreedArea";
  }

  @override
  double get marbleArea {
    return _totalMarbleArea;
  }
  @override
  String get marbleAreaExplanation {
    return "Toplam mermer alanı: $_totalMarbleArea";
  }

  @override
  double get marbleStepLength {
    return _totalMainStairsLength + _totalFireStairsLength;
  }
  @override
  String get marbleStepLengthExplanation {
    return "Toplam ana merdiven basamak uzunluğu: $_totalMainStairsLength + Toplam yangın merdiveni basamak uzunluğu:: $_totalFireStairsLength";
  }

  @override
  double get marbleWindowsillLength {
    return _totalWindowsillLength;
  }
  @override
  String get marbleWindowsillLengthExplanation {
    return "Toplam denizlikli pencere uzunluğu: $_totalWindowsillLength";
  }

  @override
  double get stairRailingsLength {
    return (_totalMainStairsCount + _totalFireStairsCount) * projectConstants.stairTreadDepth;
  }
  @override
  String get stairRailingsLengthExplanation {
    return "Toplam ana merdiven ve yangın merdiveni basamak toplamı: ($_totalMainStairsCount + $_totalFireStairsCount) x Basamak genişliği: ${projectConstants.stairTreadDepth}";
  }

  @override
  double get ceramicTileArea {
    return _totalCeramicFloorArea + _totalCeramicWallArea;
  }
  @override
  String get ceramicTileAreaExplanation {
    return "Toplam yer seramik alanı: $_totalCeramicFloorArea + Toplam fayans alanı: $_totalCeramicWallArea";
  }

  @override
  double get parquetTileArea {
    return _totalParquetFloorArea;
  }
  @override
  String get parquetTileAreaExplanation {
    return "Toplam parke alanı: $_totalParquetFloorArea";
  }

  @override
  double get steelDoorNumber {
    return _steelDoorNumber.toDouble();
  }
  @override
  String get steelDoorNumberExplanation {
    return "Toplam çelik kapı adedi: $_steelDoorNumber";
  }

  @override
  double get entranceDoorArea {
    return projectConstants.totalEntranceDoorArea;
  }
  @override
  String get entranceDoorAreaExplanation {
    return "Toplam apartman giriş kapısı alanı: ${projectConstants.totalEntranceDoorArea}";
  }

  @override
  double get fireDoorNumber {
    return _fireDoorNumber.toDouble();
  }
  @override
  String get fireDoorNumberExplanation {
    return "Toplam yangın kapısı adedi: $_fireDoorNumber";
  }

  @override
  double get woodenDoorNumber {
    return _woodenDoorNumber.toDouble();
  }
  @override
  String get woodenDoorNumberExplanation {
    return "Toplam ahşap kapı adedi: $_woodenDoorNumber";
  }

  @override
  double get kitchenCupboardLength {
    return _apartmentNumber * projectConstants.kitchenLength * 2;
  }
  @override
  String get kitchenCupboardLengthExplanation {
    return "Daire sayısı: $_apartmentNumber x Mutfak uzunluğu: ${projectConstants.kitchenLength} x 2(Alt - Üst dolap)";
  }

  @override
  double get kitchenCounterLength {
    return _apartmentNumber * projectConstants.kitchenLength;
  }
  @override
  String get kitchenCounterLengthExplanation {
    return "Daire sayısı: $_apartmentNumber x Mutfak uzunluğu: ${projectConstants.kitchenLength}";
  }

  @override
  double get coatCabinetArea {
    return _apartmentNumber * projectConstants.coatCabinetArea;
  }
  @override
  String get coatCabinetAreaExplanation {
    return "Daire sayısı: $_apartmentNumber x Portmanto alanı: ${projectConstants.coatCabinetArea}";
  }

  @override
  double get bathroomCabinetArea {
    return _toiletNumber * projectConstants.bathroomCabinetArea;
  }
  @override
  String get bathroomCabinetAreaExplanation {
    return "Tuvalet sayısı: $_toiletNumber x Banyo dolabı alanı: ${projectConstants.bathroomCabinetArea}";
  }

  @override
  double get floorPlinthLength {
    return _totalFloorPlinthLength;
  }
  @override
  String get floorPlinthLengthExplanation {
    return "Toplam süpürgelik uzunluğu: $_totalFloorPlinthLength";
  }

  @override
  double get mechanicalInfrastructureApartment {
    return _apartmentNumber.toDouble();
  }
  @override
  String get mechanicalInfrastructureApartmentExplanation {
    return "Daire sayısı: $_apartmentNumber";
  }

  @override
  double get airConditionerNumber {
    return _airConditionerNumber.toDouble();
  }
  @override
  String get airConditionerNumberExplanation {
    return "Toplam klima sayısı: $_airConditionerNumber";
  }

  @override
  double get ventilationArea {
    return _basementsArea;
  }
  @override
  String get ventilationAreaExplanation {
    return "Bodrumlar toplam alanı: $_basementsArea";
  }

  @override
  double get waterTankNumber {
    return projectConstants.waterTankNumber.toDouble();
  }
  @override
  String get waterTankNumberExplanation {
    return "Su deposu adedi: ${projectConstants.waterTankNumber}";
  }

  @override
  double get elevationStop {
    return (_basementFloors.length + 1 + _normalFloors.length).toDouble();
  }
  @override
  String get elevationStopExplanation {
    return "Bodrum kat adedi: ${_basementFloors.length} + Zemin kat adedi: 1 + Normal kat adedi: ${_normalFloors.length}";
  }

  @override
  double get sinkNumber {
    return _toiletNumber.toDouble();
  }
  @override
  String get sinkNumberExplanation {
    return "Toplam tuvalet sayısı: $_toiletNumber";
  }

  @override
  double get sinkBatteryNumber {
    return _toiletNumber.toDouble();
  }
  @override
  String get sinkBatteryNumberExplanation {
    return "Toplam tuvalet sayısı: $_toiletNumber";
  }

  @override
  double get concealedCisternNumber {
    return _toiletNumber.toDouble();
  }
  @override
  String get concealedCisternNumberExplanation {
    return "Toplam tuvalet sayısı: $_toiletNumber";
  }

  @override
  double get showerNumber {
    return _bathroomNumber.toDouble();
  }
  @override
  String get showerNumberExplanation {
    return "Toplam banyo sayısı: $_bathroomNumber";
  }

  @override
  double get showerBatteryNumber {
    return _bathroomNumber.toDouble();
  }
  @override
  String get showerBatteryNumberExplanation {
    return "Toplam banyo sayısı: $_bathroomNumber";
  }

  @override
  double get kitchenFaucetAndSinkNumber {
    return _kitchenNumber.toDouble();
  }
  @override
  String get kitchenFaucetAndSinkNumberExplanation {
    return "Toplam mutfak sayısı: $_kitchenNumber";
  }

  @override
  double get electricalInfrastructureApartment {
    return _apartmentNumber.toDouble();
  }
  @override
  String get electricalInfrastructureApartmentExplanation {
    return "Toplam daire sayısı: $_apartmentNumber";
  }

  @override
  double get generatorNumber {
    return projectConstants.generatorNumber.toDouble();
  }
  @override
  String get generatorNumberExplanation {
    return "Jeneratör adedi: ${projectConstants.generatorNumber}";
  }

  @override
  double get householdAppliancesApartment {
    return _apartmentNumber.toDouble();
  }
  @override
  String get householdAppliancesApartmentExplanation {
    return "Toplam daire sayısı: $_apartmentNumber";
  }

  @override
  double get landScapeGardenArea {
    return (_topMostBasementFloor.ceilingArea - _groundFloor.area) * projectConstants.gardenOutdoorParkingAreaRate;
  }
  @override
  String get landScapeGardenAreaExplanation {
    return "En üst bodrum tavan alanı: ${_topMostBasementFloor.ceilingArea} - Zemin kat alanı: ${_groundFloor.area} x Bahçe Oranı: ${projectConstants.gardenOutdoorParkingAreaRate}";
  }

  @override
  double get outdoorParkingTileArea {
    return (_topMostBasementFloor.ceilingArea - _groundFloor.area) * (1 - projectConstants.gardenOutdoorParkingAreaRate);
  }
  @override
  String get outdoorParkingTileAreaExplanation {
    return "En üst bodrum tavan alanı: ${_topMostBasementFloor.ceilingArea} - Zemin kat alanı: ${_groundFloor.area} x Açık otopark oranı: 1 - Bahçe Oranı: ${projectConstants.gardenOutdoorParkingAreaRate}";
  }

  @override
  double get carLiftStop {
    return _basementFloors.length + 1;
  }
  @override
  String get carLiftStopExplanation {
    return "Bodrum kat adedi: ${_basementFloors.length} + Zemin kat adedi: 1";
  }

  @override
  double get automaticBarrierNumber {
    return projectConstants.automaticBarrierNumber.toDouble();
  }
  @override
  String get automaticBarrierNumberExplanation {
    return "Otomatik bariyer adedi: ${projectConstants.automaticBarrierNumber}";
  }

  @override
  double get enclosingTheLandLength {
    return landPerimeter;
  }
  @override
  String get enclosingTheLandLengthExplanation {
    return "Arsa çevresi: $landPerimeter";
  }

  @override
  double get craneHour {
    return _roughConstructionArea * projectConstants.craneHourForOneSqareMeterRoughConstructionArea;
  }
  @override
  String get craneHourExplanation {
    return "Kaba inşaat alanı: $_roughConstructionArea x 1 metre kare kaba inşaat alanı için vinç çalışma saati: ${projectConstants.craneHourForOneSqareMeterRoughConstructionArea}";
  }

  @override
  double get siteSafetyMonth {
    return projectConstants.projectDurationMonth;
  }
  @override
  String get siteSafetyMonthExplanation  {
    return "Proje süresi: ${projectConstants.projectDurationMonth}";
  }

  @override
  double get officeExpensesMonth {
    return projectConstants.projectDurationMonth;
  }
  @override
  String get officeExpensesMonthExplanation {
    return "Proje süresi: ${projectConstants.projectDurationMonth}";
  }

  @override
  double get sergeantMonth {
    return projectConstants.projectDurationMonth;
  }
  @override
  String get sergeantMonthExplanation {
    return "Proje süresi: ${projectConstants.projectDurationMonth}";
  }

  @override
  double get projectManagerMonth {
    return projectConstants.projectDurationMonth;
  }
  @override
  String get projectManagerMonthExplanation  {
    return "Proje süresi: ${projectConstants.projectDurationMonth}";
  }
}
