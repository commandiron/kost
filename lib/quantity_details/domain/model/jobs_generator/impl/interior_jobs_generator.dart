import 'package:kost/quantity_details/domain/model/floor/floor_section.dart';

import '../../../../../common/model/unit_price/unit_price.dart';
import '../../floor/floor.dart';
import '../../../../../common/model/job.dart';
import '../../floor/room.dart';
import '../../project_constants.dart';
import '../jobs_generator.dart';

class InteriorJobsGenerator extends JobsGenerator {
  InteriorJobsGenerator({
    super.name = "İç İmalatlar",
    required this.projectConstants,
    required this.floors,
  });

  final ProjectConstants projectConstants;
  final List<Floor> floors;

  @override
  List<Job> createJobs() {
    return [
      InteriorPlastering(
        quantityBuilder: () {
          return _totalPlasterArea;
        },
        quantityExplanationBuilder: () {
          return "Toplam sıva alanı: $_totalPlasterArea";
        },
      ),
      InteriorPainting(
        quantityBuilder: () {
          return _totalPaintingArea;
        },
        quantityExplanationBuilder: () {
          return "Toplam boya alanı: $_totalPaintingArea";
        },
      ),
      InteriorWaterproofing(
        quantityBuilder: () {
          return _totalInteriorWetFloorArea;
        },
        quantityExplanationBuilder: () {
          return "Toplam iç mekan ıslak zemin alanı: $_totalInteriorWetFloorArea";
        },
      ),
      CeilingCovering(
        quantityBuilder: () {
          return _totalDryWallArea;
        },
        quantityExplanationBuilder: () {
          return "Toplam alçıpan alanı: $_totalDryWallArea";
        },
      ),
      CovingPlaster(
        quantityBuilder: () {
          return _totalCovingPlasterLength;
        },
        quantityExplanationBuilder: () {
          return "Toplam kartonpiyer uzunluğu: $_totalCovingPlasterLength";
        },
      ),
      Screeding(
        quantityBuilder: () {
          return _totalScreedArea;
        },
        quantityExplanationBuilder: () {
          return "Toplam şap alanı: $_totalScreedArea";
        },
      ),
      Marble(
        quantityBuilder: () {
          return _totalMarbleArea;
        },
        quantityExplanationBuilder: () {
          return "Toplam mermer alanı: $_totalMarbleArea";
        },
      ),
      MarbleStep(
        quantityBuilder: () {
          return _totalMarbleStepLength;
        },
        quantityExplanationBuilder: () {
          return "Toplam basamak uzunluğu: $_totalMarbleStepLength";
        },
      ),
      MarbleWindowsill(
        quantityBuilder: () {
          return _totalWindowsillLength;
        },
        quantityExplanationBuilder: () {
          return "Toplam denizlikli pencere uzunluğu: $_totalWindowsillLength";
        },
      ),
      StairRailings(
        quantityBuilder: () {
          return _totalStairRailingsLength;
        },
        quantityExplanationBuilder: () {
          return "Toplam merdiven korkuluğu uzunluğu: $_totalStairRailingsLength";
        },
      ),
      CeramicTile(
        quantityBuilder: () {
          return _totalCeramicFloorArea + _totalCeramicWallArea;
        },
        quantityExplanationBuilder: () {
          return "Toplam yer seramik alanı: $_totalCeramicFloorArea + Toplam fayans alanı: $_totalCeramicWallArea";
        },
      ),
      ParquetTile(
        quantityBuilder: () {
          return _totalParquetFloorArea;
        },
        quantityExplanationBuilder: () {
          return "Toplam parke alanı: $_totalParquetFloorArea";
        },
      ),
      SteelDoor(
        quantityBuilder: () {
          return _steelDoorNumber.toDouble();
        },
        quantityExplanationBuilder: () {
          return "Toplam çelik kapı adedi: $_steelDoorNumber";
        },
      ),
      EntranceDoor(
        quantityBuilder: () {
          return _buildingEntranceDoorNumber *
              projectConstants.buildingEntranceDoorArea;
        },
        quantityExplanationBuilder: () {
          return "Apartman giriş kapısı sayısı: $_buildingEntranceDoorNumber + Toplam apartman giriş kapısı alanı: ${projectConstants.buildingEntranceDoorArea}";
        },
      ),
      FireDoor(
        quantityBuilder: () {
          return _fireDoorNumber.toDouble();
        },
        quantityExplanationBuilder: () {
          return "Toplam yangın kapısı adedi: $_fireDoorNumber";
        },
      ),
      WoodenDoor(
        quantityBuilder: () {
          return _woodenDoorNumber.toDouble();
        },
        quantityExplanationBuilder: () {
          return "Toplam ahşap kapı adedi: $_woodenDoorNumber";
        },
      ),
      KitchenCupboard(
        quantityBuilder: () {
          return _kitchenNumber * projectConstants.kitchenLength * 2;
        },
        quantityExplanationBuilder: () {
          return "Mutfak sayısı: $_kitchenNumber x Mutfak uzunluğu: ${projectConstants.kitchenLength} x 2(Alt - Üst dolap)";
        },
      ),
      KitchenCounter(
        quantityBuilder: () {
          return _kitchenNumber * projectConstants.kitchenLength;
        },
        quantityExplanationBuilder: () {
          return "Mutfak sayısı: $_kitchenNumber x Mutfak uzunluğu: ${projectConstants.kitchenLength}";
        },
      ),
      CoatCabinet(
        quantityBuilder: () {
          return _apartmentNumber * projectConstants.coatCabinetArea;
        },
        quantityExplanationBuilder: () {
          return "Daire sayısı: $_apartmentNumber x Portmanto alanı: ${projectConstants.coatCabinetArea}";
        },
      ),
      BathroomCabinet(
        quantityBuilder: () {
          return _toiletNumber * projectConstants.bathroomCabinetArea;
        },
        quantityExplanationBuilder: () {
          return "Tuvalet sayısı: $_toiletNumber x Banyo dolabı alanı: ${projectConstants.bathroomCabinetArea}";
        },
      ),
      FloorPlinth(
        quantityBuilder: () {
          return _totalFloorPlinthLength;
        },
        quantityExplanationBuilder: () {
          return "Toplam süpürgelik uzunluğu: $_totalFloorPlinthLength";
        },
      ),
      MechanicalInfrastructure(
        quantityBuilder: () {
          return _apartmentNumber.toDouble();
        },
        quantityExplanationBuilder: () {
          return "Daire sayısı: $_apartmentNumber";
        },
      ),
      AirConditioner(
        quantityBuilder: () {
          return _apartmentNumber *
              projectConstants.airConditionerNumberForOneApartment.toDouble();
        },
        quantityExplanationBuilder: () {
          return "Toplam daire sayısı: $_apartmentNumber x 1 daire için klima sayısı: ${projectConstants.airConditionerNumberForOneApartment}";
        },
      ),
      Ventilation(
        quantityBuilder: () {
          return _basementsArea;
        },
        quantityExplanationBuilder: () {
          return "Bodrumlar toplam alanı: $_basementsArea";
        },
      ),
      WaterTank(
        quantityBuilder: () {
          //BURAYA BAK!!!!!!!!!!!!!!!!
          return 1;
        },
        quantityExplanationBuilder: () {
          return "Götürü bedel";
        },
      ),
      Elevation(
        quantityBuilder: () {
          return (_basementFloors.length + 1 + _normalFloors.length).toDouble();
        },
        quantityExplanationBuilder: () {
          return "Bodrum kat adedi: ${_basementFloors.length} + Zemin kat adedi: 1 + Normal kat adedi: ${_normalFloors.length}";
        },
        selectedUnitPriceCategory: UnitPriceCategory.elevation10PersonKone,
      ),
      Elevation(
        quantityBuilder: () {
          return (_basementFloors.length + 1 + _normalFloors.length).toDouble();
        },
        quantityExplanationBuilder: () {
          return "Bodrum kat adedi: ${_basementFloors.length} + Zemin kat adedi: 1 + Normal kat adedi: ${_normalFloors.length}";
        },
        selectedUnitPriceCategory: UnitPriceCategory.elevation6PersonKone,
      ),
      Sink(
        quantityBuilder: () {
          return _toiletNumber.toDouble();
        },
        quantityExplanationBuilder: () {
          return "Toplam tuvalet sayısı: $_toiletNumber";
        },
      ),
      SinkBattery(
        quantityBuilder: () {
          return _toiletNumber.toDouble();
        },
        quantityExplanationBuilder: () {
          return "Toplam tuvalet sayısı: $_toiletNumber";
        },
      ),
      ConcealedCistern(
        quantityBuilder: () {
          return _toiletNumber.toDouble();
        },
        quantityExplanationBuilder: () {
          return "Toplam tuvalet sayısı: $_toiletNumber";
        },
      ),
      Shower(
        quantityBuilder: () {
          return _bathroomNumber.toDouble();
        },
        quantityExplanationBuilder: () {
          return "Toplam banyo sayısı: $_bathroomNumber";
        },
      ),
      ShowerBattery(
        quantityBuilder: () {
          return _bathroomNumber.toDouble();
        },
        quantityExplanationBuilder: () {
          return "Toplam banyo sayısı: $_bathroomNumber";
        },
      ),
      KitchenFaucetAndSink(
        quantityBuilder: () {
          return _kitchenNumber.toDouble();
        },
        quantityExplanationBuilder: () {
          return "Toplam mutfak sayısı: $_kitchenNumber";
        },
      ),
      ElectricalInfrastructure(
        quantityBuilder: () {
          return _apartmentNumber.toDouble();
        },
        quantityExplanationBuilder: () {
          return "Toplam daire sayısı: $_apartmentNumber";
        },
      ),
      Generator(
        quantityBuilder: () {
          //BURAYA BAK !!!!!!!!!!!!!!!!!!
          return 1;
        },
        quantityExplanationBuilder: () {
          return "Götürü bedel";
        },
      ),
      HouseholdAppliances(
        quantityBuilder: () {
          return _apartmentNumber.toDouble();
        },
        quantityExplanationBuilder: () {
          return "Toplam daire sayısı: $_apartmentNumber";
        },
      ),
    ];
  }

  double get _totalPlasterArea {
    double area = 0;
    for (var floor in floors) {
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
          if (room.wallMaterial == WallMaterial.painting) {
            area += (room.perimeter * (floor.heightWithSlab - floor.slabHeight));
          }
          if (room.ceilingMaterial == CeilingMaterial.plaster) {
            area += room.area;
          }
        }
      }
    }
    return area;
  }

  double get _totalPaintingArea {
    double area = 0;
    for (var floor in floors) {
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
          if (room.wallMaterial == WallMaterial.painting) {
            area += (room.perimeter * (floor.heightWithSlab - floor.slabHeight));
          }
          if (room.ceilingMaterial == CeilingMaterial.drywall ||
              room.ceilingMaterial == CeilingMaterial.plaster) {
            area += room.area;
          }
        }
      }
    }
    return area;
  }

  double get _totalInteriorWetFloorArea {
    double area = 0;
    for (var floor in floors) {
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
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
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
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
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
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
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
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
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
          if (room.floorMaterial == FloorMaterial.marble) {
            area += room.area;
          }
        }
      }
    }
    return area;
  }

  double get _totalMarbleStepLength {
    double length = 0;
    for (var floor in floors) {
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
          if (room.floorMaterial == FloorMaterial.marbleStep) {
            final stepCount =
                floor.heightWithSlab / projectConstants.stairRiserHeight;
            length += (projectConstants.stairLength * stepCount);
          }
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
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
          if (room.floorMaterial == FloorMaterial.marbleStep) {
            final stepCount =
                floor.heightWithSlab / projectConstants.stairRiserHeight;
            length += stepCount * projectConstants.stairTreadDepth;
          }
        }
      }
    }
    return length;
  }

  double get _totalCeramicFloorArea {
    double area = 0;
    for (var floor in floors) {
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
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
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
          if (room.wallMaterial == WallMaterial.ceramic) {
            area += room.perimeter * (floor.heightWithSlab - floor.slabHeight);
          }
        }
      }
    }
    return area;
  }

  double get _totalParquetFloorArea {
    double area = 0;
    for (var floor in floors) {
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
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
      for (var floorSection in floor.floorSections) {
        if(floorSection is Apartment) {
          number++;
        }
      }
    }
    return number;
  }

  int get _buildingEntranceDoorNumber {
    int number = 0;
    for (var floor in floors) {
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
          for (var door in room.doors) {
            if (door == Door.buildingEntrance) {
              number++;
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
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
          for (var door in room.doors) {
            if (door == Door.fire) {
              number++;
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
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
          for (var door in room.doors) {
            if (door == Door.room) {
              number++;
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
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
          if (room is Kitchen || room is SaloonWithKitchen) {
            number++;
          }
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
      for (var floorSection in floor.floorSections) {
        for (var room in floorSection.rooms) {
          if (room is Bathroom ||
              room is EscapeHallBathroom ||
              room is Wc ||
              room is EscapeHallWc) {
            number++;
          }
        }
      }
    }
    return number;
  }

  double get _totalFloorPlinthLength {
    double length = 0;
    for (var floor in floors) {
      for (var floorSection in floor.floorSections) {
        for (var room in floorSection.rooms) {
          if (room.hasFloorPlinth) {
            length += room.perimeter;
          }
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
      for (var floorSection in floor.floorSections) {
        for (var room in floorSection.rooms) {
          if (room is Bathroom || room is EscapeHallBathroom) {
            number++;
          }
        }
      }
    }
    return number;
  }
}
