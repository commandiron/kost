import 'package:kost/quantity_details/domain/model/floor/floor_section.dart';

import '../../../../../common/model/unit_price/unit_price.dart';
import '../../floor/floor.dart';
import '../../../../../common/model/job.dart';
import '../../floor/room/apartment_room.dart';
import '../../floor/room/room.dart';
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
      InteriorPlastering( //✓
        quantityBuilder: () {
          return _totalPlasterArea;
        },
      ),
      InteriorPainting( //✓
        quantityBuilder: () {
          return _totalPaintingArea;
        },
      ),
      InteriorWaterproofing( //✓
        quantityBuilder: () {
          return _totalInteriorWetFloorArea;
        },
      ),
      CeilingCovering( //✓
        quantityBuilder: () {
          return _totalDryWallArea;
        },
      ),
      CovingPlaster( //✓
        quantityBuilder: () {
          return _totalCovingPlasterLength;
        },
      ),
      Screeding( //✓
        quantityBuilder: () {
          return _totalScreedArea;
        },
      ),
      Marble( //✓
        quantityBuilder: () {
          return _totalMarbleArea;
        },
      ),
      MarbleStep( //✓
        quantityBuilder: () {
          return _totalMarbleStepLength;
        },
      ),
      MarbleWindowsill( //✓
        quantityBuilder: () {
          return _totalWindowsillLength;
        },
      ),
      StairRailings( //✓
        quantityBuilder: () {
          return _totalStairRailingsLength;
        },
      ),
      CeramicTile( //✓
        quantityBuilder: () {
          return _totalCeramicFloorArea + _totalCeramicWallArea;
        },
      ),
      ParquetTile(
        quantityBuilder: () {
          return _totalParquetFloorArea;
        },
      ),
      SteelDoor(
        quantityBuilder: () {
          return _steelDoorNumber.toDouble();
        },
      ),
      EntranceDoor(
        quantityBuilder: () {
          return _buildingEntranceDoorNumber *
              projectConstants.buildingEntranceDoorArea;
        },
      ),
      FireDoor(
        quantityBuilder: () {
          return _fireDoorNumber.toDouble();
        },
      ),
      WoodenDoor(
        quantityBuilder: () {
          return _woodenDoorNumber.toDouble();
        },
      ),
      KitchenCupboard(
        quantityBuilder: () {
          return _kitchenNumber * projectConstants.kitchenLength * 2;
        },
      ),
      KitchenCounter(
        quantityBuilder: () {
          return _kitchenNumber * projectConstants.kitchenLength;
        },
      ),
      CoatCabinet(
        quantityBuilder: () {
          return _apartmentNumber * projectConstants.coatCabinetArea;
        },
      ),
      BathroomCabinet(
        quantityBuilder: () {
          return _toiletNumber * projectConstants.bathroomCabinetArea;
        },
      ),
      FloorPlinth(
        quantityBuilder: () {
          return _totalFloorPlinthLength;
        },
      ),
      MechanicalInfrastructure(
        quantityBuilder: () {
          return _apartmentNumber.toDouble();
        },
      ),
      AirConditioner(
        quantityBuilder: () {
          return _apartmentNumber *
              projectConstants.airConditionerNumberForOneApartment.toDouble();
        },
      ),
      Ventilation(
        quantityBuilder: () {
          return _basementsArea;
        },
      ),
      WaterTank(
        quantityBuilder: () {
          //BURAYA BAK!!!!!!!!!!!!!!!!
          return 1;
        },
      ),
      Elevation(
        quantityBuilder: () {
          return (_basementFloors.length + 1 + _normalFloors.length).toDouble();
        },
        selectedUnitPriceCategory: UnitPriceCategory.elevation10PersonKone,
      ),
      Elevation(
        quantityBuilder: () {
          return (_basementFloors.length + 1 + _normalFloors.length).toDouble();
        },
        selectedUnitPriceCategory: UnitPriceCategory.elevation6PersonKone,
      ),
      Sink(
        quantityBuilder: () {
          return _toiletNumber.toDouble();
        },
      ),
      SinkBattery(
        quantityBuilder: () {
          return _toiletNumber.toDouble();
        },
      ),
      ConcealedCistern(
        quantityBuilder: () {
          return _toiletNumber.toDouble();
        },
      ),
      Shower(
        quantityBuilder: () {
          return _bathroomNumber.toDouble();
        },
      ),
      ShowerBattery(
        quantityBuilder: () {
          return _bathroomNumber.toDouble();
        },
      ),
      KitchenFaucetAndSink(
        quantityBuilder: () {
          return _kitchenNumber.toDouble();
        },
      ),
      ElectricalInfrastructure(
        quantityBuilder: () {
          return _apartmentNumber.toDouble();
        },
      ),
      Generator(
        quantityBuilder: () {
          //BURAYA BAK !!!!!!!!!!!!!!!!!!
          return 1;
        },
      ),
      HouseholdAppliances(
        quantityBuilder: () {
          return _apartmentNumber.toDouble();
        },
      ),
    ];
  }

  double get _totalPlasterArea { //✓
    double result = 0;
    for (var floor in floors) {
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
          if (room.wallMaterial == WallMaterial.painting) {
            result += (room.perimeter * (floor.heightWithSlab - floor.slabHeight));
          }
          if (room.ceilingMaterial == CeilingMaterial.plaster) {
            result += room.area;
          }
        }
      }
    }
    return result;
  }

  double get _totalPaintingArea { //✓
    double result = 0;
    for (var floor in floors) {
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
          if (room.wallMaterial == WallMaterial.painting) {
            result += (room.perimeter * (floor.heightWithSlab - floor.slabHeight));
          }
          if (room.ceilingMaterial == CeilingMaterial.drywall ||
              room.ceilingMaterial == CeilingMaterial.plaster) {
            result += room.area;
          }
        }
      }
    }
    return result;
  }

  double get _totalInteriorWetFloorArea { //✓
    double result = 0;
    for (var floor in floors) {
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
          if (room.isFloorWet) {
            result += room.area;
          }
        }
      }
    }
    return result;
  }

  double get _totalDryWallArea { //✓
    double result = 0;
    for (var floor in floors) {
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
          if (room.ceilingMaterial == CeilingMaterial.drywall) {
            result += room.area;
          }
        }
      }
    }
    return result;
  }

  double get _totalCovingPlasterLength { //✓
    double result = 0;
    for (var floor in floors) {
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
          if (room.hasCovingPlaster) {
            result += room.perimeter;
          }
        }
      }
    }
    return result;
  }

  double get _totalScreedArea { //✓
    double result = 0;
    for (var floor in floors) {
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
          if (room.floorMaterial == FloorMaterial.parquet || room.floorMaterial == FloorMaterial.ceramic) {
            result += room.area;
          }
        }
      }
    }
    return result;
  }

  double get _totalMarbleArea { //✓
    double result = 0;
    for (var floor in floors) {
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
          if (room.floorMaterial == FloorMaterial.marble) {
            result += room.area;
          }
          if(room.floorMaterial == FloorMaterial.marbleStep) {
            final singleStairArea = projectConstants.stairLength * projectConstants.stairTreadDepth;
            final stepCount = floor.heightWithSlab / projectConstants.stairRiserHeight;
            final totalStairArea = singleStairArea * stepCount;
            final stairLandingArea = room.area - totalStairArea;
            result += stairLandingArea;
          }
        }
      }
    }
    return result;
  }

  double get _totalMarbleStepLength { //✓
    double result = 0;
    for (var floor in floors) {
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
          if (room.floorMaterial == FloorMaterial.marbleStep) {
            final stepCount = floor.heightWithSlab / projectConstants.stairRiserHeight;
            result += (projectConstants.stairLength * stepCount);
          }
        }
      }
    }
    return result;
  }

  double get _totalWindowsillLength { //✓
    double result = 0;
    for (var floor in floors) {
      final windowsillLengths = floor.windows.map((window) => window.hasWindowsill ? window.width * window.count : 0);
      result += windowsillLengths.fold(0.0, (p, c) => p + c);
    }
    return result;
  }

  double get _totalStairRailingsLength { //✓
    double result = 0;
    for (var floor in floors) {
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
          if (room.floorMaterial == FloorMaterial.marbleStep) {
            final stepCount = floor.heightWithSlab / projectConstants.stairRiserHeight;
            result += stepCount * projectConstants.stairTreadDepth;
          }
        }
      }
    }
    return result;
  }

  double get _totalCeramicFloorArea { //✓
    double result = 0;
    for (var floor in floors) {
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
          if (room.floorMaterial == FloorMaterial.ceramic) {
            result += room.area;
          }
        }
      }
    }
    return result;
  }

  double get _totalCeramicWallArea { //✓
    double result = 0;
    for (var floor in floors) {
      for (var floorSection in floor.floorSections) {
        for(var room in floorSection.rooms) {
          if (room.wallMaterial == WallMaterial.ceramic) {
            final wallArea = room.perimeter * (floor.heightWithSlab - floor.slabHeight);
            final doorArea = (room.doors.length * projectConstants.commonDoorArea);
            result += wallArea - doorArea;
          }
        }
      }
    }
    return result;
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
