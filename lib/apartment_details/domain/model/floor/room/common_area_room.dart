import 'package:kost/apartment_details/domain/model/floor/room/room.dart';

class CommonAreaRoom extends Room {
  CommonAreaRoom({
    super.name = "",
    required super.area,
    required super.perimeter,
    required super.windows,
    required super.floorMaterial,
    required super.wallMaterial,
    required super.ceilingMaterial,
    required super.hasCovingPlaster,
    required super.hasFloorPlinth,
    required super.isFloorWet,
    required super.doors
  });
}

class BuildingFloorHall extends CommonAreaRoom {
  BuildingFloorHall({
    required super.area,
    required super.perimeter,
    super.windows = const [],
    super.floorMaterial = FloorMaterial.marble,
    super.wallMaterial = WallMaterial.painting,
    super.ceilingMaterial = CeilingMaterial.drywall,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = false,
    super.doors = const [],
  });
}

class FireEscapeHall extends CommonAreaRoom {
  FireEscapeHall({
    required super.area,
    required super.perimeter,
    super.windows = const [],
    super.floorMaterial = FloorMaterial.marble,
    super.wallMaterial = WallMaterial.painting,
    super.ceilingMaterial = CeilingMaterial.plaster,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = false,
    super.doors = const [
      Door.fire,
      Door.fire,
    ],
  });
}

class BuildingEntranceHall extends CommonAreaRoom {
  BuildingEntranceHall({
    required super.area,
    required super.perimeter,
    super.windows = const [],
    super.floorMaterial = FloorMaterial.marble,
    super.wallMaterial = WallMaterial.painting,
    super.ceilingMaterial = CeilingMaterial.drywall,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = false,
    super.doors = const [Door.buildingEntrance, Door.buildingEntrance,],
  });
}

class ParkingArea extends CommonAreaRoom {
  ParkingArea({
    required super.area,
    required super.perimeter,
    super.windows = const [],
    super.floorMaterial = FloorMaterial.epoxy,
    super.wallMaterial = WallMaterial.painting,
    super.ceilingMaterial = CeilingMaterial.plaster,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = false,
    super.doors = const [],
  });
}

class TechnicalArea extends CommonAreaRoom {
  TechnicalArea({
    required super.area,
    required super.perimeter,
    super.windows = const [],
    super.floorMaterial = FloorMaterial.ceramic,
    super.wallMaterial = WallMaterial.painting,
    super.ceilingMaterial = CeilingMaterial.plaster,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = false,
    super.doors = const [Door.fire],
  });
}

class ElevatorShaft extends CommonAreaRoom {
  ElevatorShaft({
    required super.area,
    required super.perimeter,
    super.windows = const [],
    super.floorMaterial = FloorMaterial.none,
    super.wallMaterial = WallMaterial.painting,
    super.ceilingMaterial = CeilingMaterial.none,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = false,
    super.doors = const [],
  });
}

class Stairs extends CommonAreaRoom {
  Stairs({
    required super.area,
    required super.perimeter,
    super.windows = const [],
    super.floorMaterial = FloorMaterial.marbleStep,
    super.wallMaterial = WallMaterial.painting,
    super.ceilingMaterial = CeilingMaterial.plaster,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = false,
    super.doors = const [],
  });
}

class Shaft extends CommonAreaRoom {
  Shaft({
    required super.area,
    required super.perimeter,
    super.windows = const [],
    super.floorMaterial = FloorMaterial.none,
    super.wallMaterial = WallMaterial.none,
    super.ceilingMaterial = CeilingMaterial.none,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = false,
    super.doors = const [],
  });
}
