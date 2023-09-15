import 'package:kost/apartment_details/domain/model/floor/floor_section.dart';

import '../../../../../common/model/unit_price_category.dart';
import '../../floor/floor.dart';
import '../../../../../common/model/job.dart';
import '../../floor/room/apartment_room.dart';
import '../../floor/room/room.dart';
import '../../project_constants.dart';
import '../jobs_generator.dart';

class InteriorJobsGenerator extends JobsGenerator { //✓
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
      ParquetTile( //✓
        quantityBuilder: () {
          return _totalParquetFloorArea;
        },
      ),
      SteelDoor( //✓
        quantityBuilder: () {
          return _numberOfApartment;
        },
      ),
      EntranceDoor( //✓
        quantityBuilder: () {
          return _numberOfBuildingEntranceDoor *
              projectConstants.buildingEntranceDoorArea;
        },
      ),
      FireDoor( //✓
        quantityBuilder: () {
          return _numberOfFireDoor;
        },
      ),
      WoodenDoor( //✓
        quantityBuilder: () {
          return _numberOfWoodenDoor;
        },
      ),
      KitchenCupboard( //✓
        quantityBuilder: () {
          return _numberOfKitchen * projectConstants.kitchenLength * 2;
        },
      ),
      KitchenCounter( //✓
        quantityBuilder: () {
          return _numberOfKitchen * projectConstants.kitchenLength;
        },
      ),
      CoatCabinet( //✓
        quantityBuilder: () {
          return _numberOfApartment * projectConstants.coatCabinetArea;
        },
      ),
      BathroomCabinet( //✓
        quantityBuilder: () {
          return (_numberOfWc + _numberOfBathroom) * projectConstants.bathroomCabinetArea;
        },
      ),
      FloorPlinth( //✓
        quantityBuilder: () {
          return _totalFloorPlinthLength;
        },
      ),
      MechanicalInfrastructure( //✓
        quantityBuilder: () {
          return _numberOfApartment;
        },
      ),
      AirConditioner( //✓
        quantityBuilder: () {
          return _numberOfApartment *
              projectConstants.numberOfAirConditionerForOneApartment;
        },
      ),
      Ventilation( //✓
        quantityBuilder: () {
          return _allBasementsArea;
        },
      ),
      WaterTank( //✓
        quantityBuilder: () {
          return 1;
        },
      ),
      Elevation( //✓
        quantityBuilder: () {
          return (_allBasementFloors.length + 1 + _normalFloors.length).toDouble();
        },
        selectedUnitPriceCategory: UnitPriceCategory.elevation10PersonKone,
      ),
      Elevation( //✓
        quantityBuilder: () {
          return (_allBasementFloors.length + 1 + _normalFloors.length).toDouble();
        },
        selectedUnitPriceCategory: UnitPriceCategory.elevation6PersonKone,
        disable: true
      ),
      Sink( //✓
        quantityBuilder: () {
          return _numberOfWc + _numberOfBathroom;
        },
      ),
      SinkBattery( //✓
        quantityBuilder: () {
          return _numberOfWc + _numberOfBathroom;
        },
      ),
      ConcealedCistern( //✓
        quantityBuilder: () {
          return _numberOfWc + _numberOfBathroom;
        },
      ),
      Shower( //✓
        quantityBuilder: () {
          return _numberOfBathroom;
        },
      ),
      ShowerBattery( //✓
        quantityBuilder: () {
          return _numberOfBathroom;
        },
      ),
      KitchenFaucetAndSink( //✓
        quantityBuilder: () {
          return _numberOfKitchen;
        },
      ),
      ElectricalInfrastructure( //✓
        quantityBuilder: () {
          return _numberOfApartment;
        },
      ),
      Generator( //✓
        quantityBuilder: () {
          return 1;
        },
      ),
      HouseholdAppliances( //✓
        quantityBuilder: () {
          return _numberOfApartment;
        },
      ),
    ];
  }

  double get _totalPlasterArea { //✓
    double result = 0;
    for (var floor in floors) {
      for (var floorSection in floor.sections) {
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
      for (var floorSection in floor.sections) {
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
      for (var floorSection in floor.sections) {
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
      for (var floorSection in floor.sections) {
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
      for (var floorSection in floor.sections) {
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
      for (var floorSection in floor.sections) {
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
      for (var floorSection in floor.sections) {
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
      for (var floorSection in floor.sections) {
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
      for(var floorSection in floor.sections) {
        for(var room in floorSection.rooms) {
          for(var window in room.windows) {
            result += window.hasWindowsill ? window.width : 0;
          }
        }
      }
    }
    return result;
  }

  double get _totalStairRailingsLength { //✓
    double result = 0;
    for (var floor in floors) {
      for (var floorSection in floor.sections) {
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
      for (var floorSection in floor.sections) {
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
      for (var floorSection in floor.sections) {
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

  double get _totalParquetFloorArea { //✓
    double result = 0;
    for (var floor in floors) {
      for (var floorSection in floor.sections) {
        for(var room in floorSection.rooms) {
          if (room.floorMaterial == FloorMaterial.parquet) {
            result += room.area;
          }
        }
      }
    }
    return result;
  }

  double get _numberOfApartment { //✓
    double result = 0;
    for (var floor in floors) {
      for (var floorSection in floor.sections) {
        if(floorSection is Apartment) {
          result++;
        }
      }
    }
    return result;
  }

  double get _numberOfBuildingEntranceDoor { //✓
    double result = 0;
    for (var floor in floors) {
      for (var floorSection in floor.sections) {
        for(var room in floorSection.rooms) {
          for (var door in room.doors) {
            if (door == Door.buildingEntrance) {
              result++;
            }
          }
        }
      }
    }
    return result;
  }

  double get _numberOfFireDoor { //✓
    double result = 0;
    for (var floor in floors) {
      for (var floorSection in floor.sections) {
        for(var room in floorSection.rooms) {
          for (var door in room.doors) {
            if (door == Door.fire) {
              result++;
            }
          }
        }
      }
    }
    return result;
  }

  double get _numberOfWoodenDoor { //✓
    double result = 0;
    for (var floor in floors) {
      for (var floorSection in floor.sections) {
        for(var room in floorSection.rooms) {
          for (var door in room.doors) {
            if (door == Door.room) {
              result++;
            }
          }
        }
      }
    }
    return result;
  }

  double get _numberOfKitchen { //✓
    double result = 0;
    for (var floor in floors) {
      for (var floorSection in floor.sections) {
        for(var room in floorSection.rooms) {
          if (room is Kitchen || room is SaloonWithKitchen) {
            result++;
          }
        }
      }
    }
    return result;
  }

  double get _numberOfWc { //✓
    double result = 0;
    for (var floor in floors) {
      for (var floorSection in floor.sections) {
        for (var room in floorSection.rooms) {
          if (room is Wc ||
              room is EscapeHallWc) {
            result++;
          }
        }
      }
    }
    return result;
  }

  double get _totalFloorPlinthLength { //✓
    double length = 0;
    for (var floor in floors) {
      for (var floorSection in floor.sections) {
        for (var room in floorSection.rooms) {
          if (room.hasFloorPlinth) {
            length += room.perimeter;
          }
        }
      }
    }
    return length;
  }

  List<Floor> get _allBasementFloors { //✓
    final result = floors.where((floor) => floor.no < 0).toList();
    if (result.isEmpty) {
      throw Exception("No basement floor");
    }
    return result;
  }

  double get _allBasementsArea { //✓
    final result = _allBasementFloors
        .map((basementFloor) => basementFloor.area)
        .toList()
        .fold(0.0, (p, c) => p + c);
    return result;
  }

  List<Floor> get _normalFloors { //✓
    final result = floors.where((floor) => floor.no > 0).toList();
    return result;
  }

  double get _numberOfBathroom { //✓
    double result = 0;
    for (var floor in floors) {
      for (var floorSection in floor.sections) {
        for (var room in floorSection.rooms) {
          if (room is Bathroom || room is EscapeHallBathroom) {
            result++;
          }
        }
      }
    }
    return result;
  }
}
