import '../../../../cost_table/domain/model/unit_price/unit_price.dart';
import '../floor/floor.dart';
import 'job.dart';
import '../floor/room.dart';
import 'job_calculator.dart';

class InteriorJobCalculator extends JobCalculator {
  InteriorJobCalculator(
      {super.name = "İç İmalat Maliyeti",
      required super.projectConstants,
      required super.projectVariables,
      required super.floors});

  @override
  List<Job> createJobs() {
    return [
      InteriorPlastering(
        quantity: interiorPlasteringArea,
        quantityExplanation: interiorPlasteringAreaExplanation,
      ),
      InteriorPainting(
        quantity: interiorPaintingArea,
        quantityExplanation: interiorPaintingAreaExplanation,
      ),
      InteriorWaterproofing(
        quantity: interiorWaterproofingArea,
        quantityExplanation: interiorWaterproofingAreaExplanation,
      ),
      CeilingCovering(
        quantity: ceilingCoveringArea,
        quantityExplanation: ceilingCoveringAreaExplanation,
      ),
      CovingPlaster(
        quantity: covingPlasterLength,
        quantityExplanation: covingPlasterLengthExplanation,
      ),
      Screeding(
        quantity: screedingArea,
        quantityExplanation: screedingAreaExplanation,
      ),
      Marble(
        quantity: marbleArea,
        quantityExplanation: marbleAreaExplanation,
      ),
      MarbleStep(
        quantity: marbleStepLength,
        quantityExplanation: marbleStepLengthExplanation,
      ),
      MarbleWindowsill(
        quantity: marbleWindowsillLength,
        quantityExplanation: marbleWindowsillLengthExplanation,
      ),
      StairRailings(
        quantity: stairRailingsLength,
        quantityExplanation: stairRailingsLengthExplanation,
      ),
      CeramicTile(
        quantity: ceramicTileArea,
        quantityExplanation: ceramicTileAreaExplanation,
      ),
      ParquetTile(
        quantity: parquetTileArea,
        quantityExplanation: parquetTileAreaExplanation,
      ),
      SteelDoor(
        quantity: steelDoorNumber,
        quantityExplanation: steelDoorNumberExplanation,
      ),
      EntranceDoor(
        quantity: entranceDoorArea,
        quantityExplanation: entranceDoorAreaExplanation,
      ),
      FireDoor(
        quantity: fireDoorNumber,
        quantityExplanation: fireDoorNumberExplanation,
      ),
      WoodenDoor(
        quantity: woodenDoorNumber,
        quantityExplanation: woodenDoorNumberExplanation,
      ),
      KitchenCupboard(
        quantity: kitchenCupboardLength,
        quantityExplanation: kitchenCupboardLengthExplanation,
      ),
      KitchenCounter(
        quantity: kitchenCounterLength,
        quantityExplanation: kitchenCounterLengthExplanation,
      ),
      CoatCabinet(
        quantity: coatCabinetArea,
        quantityExplanation: coatCabinetAreaExplanation,
      ),
      BathroomCabinet(
        quantity: bathroomCabinetArea,
        quantityExplanation: bathroomCabinetAreaExplanation,
      ),
      FloorPlinth(
        quantity: floorPlinthLength,
        quantityExplanation: floorPlinthLengthExplanation,
      ),
      MechanicalInfrastructure(
        quantity: mechanicalInfrastructureApartment,
        quantityExplanation: mechanicalInfrastructureApartmentExplanation,
      ),
      AirConditioner(
        quantity: airConditionerNumber,
        quantityExplanation: airConditionerNumberExplanation,
      ),
      Ventilation(
        quantity: ventilationArea,
        quantityExplanation: ventilationAreaExplanation,
      ),
      WaterTank(
        quantity: waterTankNumber,
        quantityExplanation: waterTankNumberExplanation,
      ),
      Elevation(
        quantity: elevationStop,
        quantityExplanation: elevationStopExplanation,
        selectedUnitPriceCategory: UnitPriceCategory.elevation10PersonKone,
      ),
      Elevation(
        quantity: elevationStop,
        quantityExplanation: elevationStopExplanation,
        selectedUnitPriceCategory: UnitPriceCategory.elevation6PersonKone,
      ),
      Sink(
        quantity: sinkNumber,
        quantityExplanation: sinkNumberExplanation,
      ),
      SinkBattery(
        quantity: sinkBatteryNumber,
        quantityExplanation: sinkBatteryNumberExplanation,
      ),
      ConcealedCistern(
        quantity: concealedCisternNumber,
        quantityExplanation: concealedCisternNumberExplanation,
      ),
      Shower(
        quantity: showerNumber,
        quantityExplanation: showerNumberExplanation,
      ),
      ShowerBattery(
        quantity: showerBatteryNumber,
        quantityExplanation: showerBatteryNumberExplanation,
      ),
      KitchenFaucetAndSink(
        quantity: kitchenFaucetAndSinkNumber,
        quantityExplanation: kitchenFaucetAndSinkNumberExplanation,
      ),
      ElectricalInfrastructure(
        quantity: electricalInfrastructureApartment,
        quantityExplanation: electricalInfrastructureApartmentExplanation,
      ),
      Generator(
        quantity: generatorNumber,
        quantityExplanation: generatorNumberExplanation,
      ),
      HouseholdAppliances(
        quantity: householdAppliancesApartment,
        quantityExplanation: householdAppliancesApartmentExplanation,
      ),
    ];
  }

  double get _totalPlasterArea {
    double area = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.wallMaterial == WallMaterial.painting) {
          area += (room.perimeter * (floor.heightWithSlab - floor.slabHeight));
        }
        if (room.ceilingMaterial == CeilingMaterial.plaster) {
          area += room.area;
        }
      }
    }
    return area;
  }

  double get _totalPaintingArea {
    double area = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.wallMaterial == WallMaterial.painting) {
          area += (room.perimeter * (floor.heightWithSlab - floor.slabHeight));
        }
        if (room.ceilingMaterial == CeilingMaterial.drywall ||
            room.ceilingMaterial == CeilingMaterial.plaster) {
          area += room.area;
        }
      }
    }
    return area;
  }

  double get _totalInteriorWetFloorArea {
    double area = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.isFloorWet) {
          area += room.area;
        }
      }
    }
    return area;
  }

  double get _totalDryWallArea {
    double area = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.ceilingMaterial == CeilingMaterial.drywall) {
          area += room.area;
        }
      }
    }
    return area;
  }

  double get _totalCovingPlasterLength {
    double length = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.hasCovingPlaster) {
          length += room.perimeter;
        }
      }
    }
    return length;
  }

  double get _totalScreedArea {
    double area = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.hasScreed) {
          area += room.area;
        }
      }
    }
    return area;
  }

  double get _totalMarbleArea {
    double area = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.floorMaterial == FloorMaterial.marble) {
          area += room.area;
        }
      }
    }
    return area;
  }

  double get _totalMarbleStepLength {
    double length = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.floorMaterial == FloorMaterial.marbleStep) {
          final stepCount =
              floor.heightWithSlab / projectConstants.stairRiserHeight;
          length += (projectConstants.stairLength * stepCount);
        }
      }
    }
    return length;
  }

  double get _totalWindowsillLength {
    double totalWindowsillLength = 0;
    for (var floor in floors) {
      final windowsillLengths = floor.windows.map(
          (window) => window.hasWindowsill ? window.width * window.count : 0);
      totalWindowsillLength += windowsillLengths.fold(0.0, (p, c) => p + c);
    }
    return totalWindowsillLength;
  }

  double get _totalStairRailingsLength {
    double length = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.floorMaterial == FloorMaterial.marbleStep) {
          final stepCount =
              floor.heightWithSlab / projectConstants.stairRiserHeight;
          length += stepCount * projectConstants.stairTreadDepth;
        }
      }
    }
    return length;
  }

  double get _totalCeramicFloorArea {
    double area = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.floorMaterial == FloorMaterial.ceramic) {
          area += room.area;
        }
      }
    }
    return area;
  }

  double get _totalCeramicWallArea {
    double area = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.wallMaterial == WallMaterial.ceramic) {
          area += room.perimeter * (floor.heightWithSlab - floor.slabHeight);
        }
      }
    }
    return area;
  }

  double get _totalParquetFloorArea {
    double area = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.floorMaterial == FloorMaterial.parquet) {
          area += room.area;
        }
      }
    }
    return area;
  }

  int get _steelDoorNumber {
    int number = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.doors != null) {
          for (var door in room.doors!) {
            if (door.doorType == DoorType.apartmentEntrance) {
              number += door.count;
            }
          }
        }
      }
    }
    return number;
  }

  int get _buildingEntranceDoorNumber {
    int number = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.doors != null) {
          for (var door in room.doors!) {
            if (door.doorType == DoorType.buildingEntrance) {
              number += door.count;
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
      for (var room in floor.rooms) {
        if (room.doors != null) {
          for (var door in room.doors!) {
            if (door.doorType == DoorType.fire) {
              number += door.count;
            }
          }
        }
      }
    }
    return number;
  }

  int get _woodenDoorNumber {
    int number = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.doors != null) {
          for (var door in room.doors!) {
            if (door.doorType == DoorType.room) {
              number += door.count;
            }
          }
        }
      }
    }
    return number;
  }

  int get _kitchenNumber {
    int number = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room is Kitchen || room is SaloonWithKitchen) {
          number++;
        }
      }
    }
    return number;
  }

  int get _apartmentNumber {
    return _steelDoorNumber;
  }

  int get _toiletNumber {
    int number = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room is Bathroom ||
            room is EscapeHallBathroom ||
            room is Wc ||
            room is EscapeHallWc) {
          number++;
        }
      }
    }
    return number;
  }

  double get _totalFloorPlinthLength {
    double length = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room.hasFloorPlinth) {
          length += room.perimeter;
        }
      }
    }
    return length;
  }

  List<Floor> get _basementFloors {
    final basementFloors = floors.where((element) => element.no < 0).toList();
    if (basementFloors.isEmpty) {
      throw Exception("No basement floor");
    }
    return basementFloors;
  }

  double get _basementsArea {
    return _basementFloors
        .map((e) => e.area)
        .toList()
        .fold(0.0, (p, c) => p + c);
  }

  List<Floor> get _normalFloors {
    return floors.where((floor) => floor.no > 0).toList();
  }

  int get _bathroomNumber {
    int number = 0;
    for (var floor in floors) {
      for (var room in floor.rooms) {
        if (room is Bathroom || room is EscapeHallBathroom) {
          number++;
        }
      }
    }
    return number;
  }

  //Calculations
  double get interiorPlasteringArea {
    return _totalPlasterArea;
  }

  String get interiorPlasteringAreaExplanation {
    return "Toplam sıva alanı: $_totalPlasterArea";
  }

  double get interiorPaintingArea {
    return _totalPaintingArea;
  }

  String get interiorPaintingAreaExplanation {
    return "Toplam boya alanı: $_totalPaintingArea";
  }

  double get interiorWaterproofingArea {
    return _totalInteriorWetFloorArea;
  }

  String get interiorWaterproofingAreaExplanation {
    return "Toplam iç mekan ıslak zemin alanı: $_totalInteriorWetFloorArea";
  }

  double get ceilingCoveringArea {
    return _totalDryWallArea;
  }

  String get ceilingCoveringAreaExplanation {
    return "Toplam alçıpan alanı: $_totalDryWallArea";
  }

  double get covingPlasterLength {
    return _totalCovingPlasterLength;
  }

  String get covingPlasterLengthExplanation {
    return "Toplam kartonpiyer uzunluğu: $_totalCovingPlasterLength";
  }

  double get screedingArea {
    return _totalScreedArea;
  }

  String get screedingAreaExplanation {
    return "Toplam şap alanı: $_totalScreedArea";
  }

  double get marbleArea {
    return _totalMarbleArea;
  }

  String get marbleAreaExplanation {
    return "Toplam mermer alanı: $_totalMarbleArea";
  }

  double get marbleStepLength {
    return _totalMarbleStepLength;
  }

  String get marbleStepLengthExplanation {
    return "Toplam basamak uzunluğu: $_totalMarbleStepLength";
  }

  double get marbleWindowsillLength {
    return _totalWindowsillLength;
  }

  String get marbleWindowsillLengthExplanation {
    return "Toplam denizlikli pencere uzunluğu: $_totalWindowsillLength";
  }

  double get stairRailingsLength {
    return _totalStairRailingsLength;
  }

  String get stairRailingsLengthExplanation {
    return "Toplam merdiven korkuluğu uzunluğu: $_totalStairRailingsLength";
  }

  double get ceramicTileArea {
    return _totalCeramicFloorArea + _totalCeramicWallArea;
  }

  String get ceramicTileAreaExplanation {
    return "Toplam yer seramik alanı: $_totalCeramicFloorArea + Toplam fayans alanı: $_totalCeramicWallArea";
  }

  double get parquetTileArea {
    return _totalParquetFloorArea;
  }

  String get parquetTileAreaExplanation {
    return "Toplam parke alanı: $_totalParquetFloorArea";
  }

  double get steelDoorNumber {
    return _steelDoorNumber.toDouble();
  }

  String get steelDoorNumberExplanation {
    return "Toplam çelik kapı adedi: $_steelDoorNumber";
  }

  double get entranceDoorArea {
    return _buildingEntranceDoorNumber *
        projectConstants.buildingEntranceDoorArea;
  }

  String get entranceDoorAreaExplanation {
    return "Apartman giriş kapısı sayısı: $_buildingEntranceDoorNumber + Toplam apartman giriş kapısı alanı: ${projectConstants.buildingEntranceDoorArea}";
  }

  double get fireDoorNumber {
    return _fireDoorNumber.toDouble();
  }

  String get fireDoorNumberExplanation {
    return "Toplam yangın kapısı adedi: $_fireDoorNumber";
  }

  double get woodenDoorNumber {
    return _woodenDoorNumber.toDouble();
  }

  String get woodenDoorNumberExplanation {
    return "Toplam ahşap kapı adedi: $_woodenDoorNumber";
  }

  double get kitchenCupboardLength {
    return _kitchenNumber * projectConstants.kitchenLength * 2;
  }

  String get kitchenCupboardLengthExplanation {
    return "Mutfak sayısı: $_kitchenNumber x Mutfak uzunluğu: ${projectConstants.kitchenLength} x 2(Alt - Üst dolap)";
  }

  double get kitchenCounterLength {
    return _kitchenNumber * projectConstants.kitchenLength;
  }

  String get kitchenCounterLengthExplanation {
    return "Mutfak sayısı: $_kitchenNumber x Mutfak uzunluğu: ${projectConstants.kitchenLength}";
  }

  double get coatCabinetArea {
    return _apartmentNumber * projectConstants.coatCabinetArea;
  }

  String get coatCabinetAreaExplanation {
    return "Daire sayısı: $_apartmentNumber x Portmanto alanı: ${projectConstants.coatCabinetArea}";
  }

  double get bathroomCabinetArea {
    return _toiletNumber * projectConstants.bathroomCabinetArea;
  }

  String get bathroomCabinetAreaExplanation {
    return "Tuvalet sayısı: $_toiletNumber x Banyo dolabı alanı: ${projectConstants.bathroomCabinetArea}";
  }

  double get floorPlinthLength {
    return _totalFloorPlinthLength;
  }

  String get floorPlinthLengthExplanation {
    return "Toplam süpürgelik uzunluğu: $_totalFloorPlinthLength";
  }

  double get mechanicalInfrastructureApartment {
    return _apartmentNumber.toDouble();
  }

  String get mechanicalInfrastructureApartmentExplanation {
    return "Daire sayısı: $_apartmentNumber";
  }

  double get airConditionerNumber {
    return _apartmentNumber *
        projectConstants.airConditionerNumberForOneApartment.toDouble();
  }

  String get airConditionerNumberExplanation {
    return "Toplam daire sayısı: $_apartmentNumber x 1 daire için klima sayısı: ${projectConstants.airConditionerNumberForOneApartment}";
  }

  double get ventilationArea {
    return _basementsArea;
  }

  String get ventilationAreaExplanation {
    return "Bodrumlar toplam alanı: $_basementsArea";
  }

  //BURAYA BAK!!!!!!!!!!!!!!!!
  double get waterTankNumber {
    return 1;
  }

  String get waterTankNumberExplanation {
    return "Götürü bedel";
  }

  double get elevationStop {
    return (_basementFloors.length + 1 + _normalFloors.length).toDouble();
  }

  String get elevationStopExplanation {
    return "Bodrum kat adedi: ${_basementFloors.length} + Zemin kat adedi: 1 + Normal kat adedi: ${_normalFloors.length}";
  }

  double get sinkNumber {
    return _toiletNumber.toDouble();
  }

  String get sinkNumberExplanation {
    return "Toplam tuvalet sayısı: $_toiletNumber";
  }

  double get sinkBatteryNumber {
    return _toiletNumber.toDouble();
  }

  String get sinkBatteryNumberExplanation {
    return "Toplam tuvalet sayısı: $_toiletNumber";
  }

  double get concealedCisternNumber {
    return _toiletNumber.toDouble();
  }

  String get concealedCisternNumberExplanation {
    return "Toplam tuvalet sayısı: $_toiletNumber";
  }

  double get showerNumber {
    return _bathroomNumber.toDouble();
  }

  String get showerNumberExplanation {
    return "Toplam banyo sayısı: $_bathroomNumber";
  }

  double get showerBatteryNumber {
    return _bathroomNumber.toDouble();
  }

  String get showerBatteryNumberExplanation {
    return "Toplam banyo sayısı: $_bathroomNumber";
  }

  double get kitchenFaucetAndSinkNumber {
    return _kitchenNumber.toDouble();
  }

  String get kitchenFaucetAndSinkNumberExplanation {
    return "Toplam mutfak sayısı: $_kitchenNumber";
  }

  double get electricalInfrastructureApartment {
    return _apartmentNumber.toDouble();
  }

  String get electricalInfrastructureApartmentExplanation {
    return "Toplam daire sayısı: $_apartmentNumber";
  }

  //BURAYA BAK !!!!!!!!!!!!!!!!!!
  double get generatorNumber {
    return 1;
  }

  String get generatorNumberExplanation {
    return "Götürü bedel";
  }

  double get householdAppliancesApartment {
    return _apartmentNumber.toDouble();
  }

  String get householdAppliancesApartmentExplanation {
    return "Toplam daire sayısı: $_apartmentNumber";
  }
}
