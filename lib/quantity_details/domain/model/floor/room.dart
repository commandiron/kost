enum FloorMaterial { none, parquet, ceramic, marble, marbleStep, epoxy }

enum WallMaterial {
  none,
  painting,
  ceramic,
}

enum CeilingMaterial {
  none,
  plaster,
  drywall,
}

enum Door {
  buildingEntrance,
  room,
  fire,
}

abstract class Room {
  final double area;
  final double perimeter;
  final FloorMaterial floorMaterial;
  final WallMaterial wallMaterial;
  final CeilingMaterial ceilingMaterial;
  final bool hasCovingPlaster;
  final bool hasFloorPlinth;
  final bool isFloorWet;
  late List<Door> doors;

  Room({
    required this.area,
    required this.perimeter,
    required this.floorMaterial,
    required this.wallMaterial,
    required this.ceilingMaterial,
    required this.hasCovingPlaster,
    required this.hasFloorPlinth,
    required this.isFloorWet,
    required this.doors,
  });
}

class Saloon extends Room {
  Saloon({
    required super.area,
    required super.perimeter,
    super.floorMaterial = FloorMaterial.parquet,
    super.wallMaterial = WallMaterial.painting,
    super.ceilingMaterial = CeilingMaterial.drywall,
    super.hasCovingPlaster = true,
    super.hasFloorPlinth = true,
    super.isFloorWet = false,
    super.doors = const [Door.room, Door.room],
  });
}

class SaloonWithKitchen extends Room {
  SaloonWithKitchen({
    required super.area,
    required super.perimeter,
    super.floorMaterial = FloorMaterial.parquet,
    super.wallMaterial = WallMaterial.painting,
    super.ceilingMaterial = CeilingMaterial.drywall,
    super.hasCovingPlaster = true,
    super.hasFloorPlinth = true,
    super.isFloorWet = false,
    super.doors = const [],
  });
}

class Kitchen extends Room {
  Kitchen({
    required super.area,
    required super.perimeter,
    super.floorMaterial = FloorMaterial.ceramic,
    super.wallMaterial = WallMaterial.painting,
    super.ceilingMaterial = CeilingMaterial.drywall,
    super.hasCovingPlaster = true,
    super.hasFloorPlinth = true,
    super.isFloorWet = false,
    super.doors = const [Door.room],
  });
}

class NormalRoom extends Room {
  NormalRoom({
    required super.area,
    required super.perimeter,
    super.floorMaterial = FloorMaterial.parquet,
    super.wallMaterial = WallMaterial.painting,
    super.ceilingMaterial = CeilingMaterial.drywall,
    super.hasCovingPlaster = true,
    super.hasFloorPlinth = true,
    super.isFloorWet = false,
    super.doors = const [Door.room],
  });
}

class Hall extends Room {
  Hall({
    required super.area,
    required super.perimeter,
    super.floorMaterial = FloorMaterial.ceramic,
    super.wallMaterial = WallMaterial.painting,
    super.ceilingMaterial = CeilingMaterial.drywall,
    super.hasCovingPlaster = true,
    super.hasFloorPlinth = true,
    super.isFloorWet = false,
    super.doors = const [],
  });
}

class Wc extends Room {
  Wc({
    required super.area,
    required super.perimeter,
    super.floorMaterial = FloorMaterial.ceramic,
    super.wallMaterial = WallMaterial.ceramic,
    super.ceilingMaterial = CeilingMaterial.drywall,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = true,
    super.doors = const [Door.room],
  });
}

class EscapeHallWc extends Room {
  EscapeHallWc({
    required super.area,
    required super.perimeter,
    super.floorMaterial = FloorMaterial.ceramic,
    super.wallMaterial = WallMaterial.ceramic,
    super.ceilingMaterial = CeilingMaterial.drywall,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = true,
    super.doors = const [
      Door.fire,
      Door.fire,
    ],
  });
}

class Bathroom extends Room {
  Bathroom({
    required super.area,
    required super.perimeter,
    super.floorMaterial = FloorMaterial.ceramic,
    super.wallMaterial = WallMaterial.ceramic,
    super.ceilingMaterial = CeilingMaterial.drywall,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = true,
    super.doors = const [Door.room],
  });
}

class EscapeHallBathroom extends Room {
  EscapeHallBathroom({
    required super.area,
    required super.perimeter,
    super.floorMaterial = FloorMaterial.ceramic,
    super.wallMaterial = WallMaterial.ceramic,
    super.ceilingMaterial = CeilingMaterial.drywall,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = true,
    super.doors = const [
      Door.fire,
      Door.fire,
    ],
  });
}

class Balcony extends Room {
  Balcony({
    required super.area,
    required super.perimeter,
    super.floorMaterial = FloorMaterial.ceramic,
    super.wallMaterial = WallMaterial.painting,
    super.ceilingMaterial = CeilingMaterial.plaster,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = true,
    super.doors = const [],
  });
}

class ApartmentFloorHall extends Room {
  ApartmentFloorHall({
    required super.area,
    required super.perimeter,
    super.floorMaterial = FloorMaterial.marble,
    super.wallMaterial = WallMaterial.painting,
    super.ceilingMaterial = CeilingMaterial.drywall,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = false,
    super.doors = const [
      Door.buildingEntrance
    ],
  });
}

class FloorHall extends Room {
  FloorHall({
    required super.area,
    required super.perimeter,
    super.floorMaterial = FloorMaterial.marble,
    super.wallMaterial = WallMaterial.painting,
    super.ceilingMaterial = CeilingMaterial.drywall,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = false,
    super.doors = const [],
  });
}

class FireEscapeHall extends Room {
  FireEscapeHall({
    required super.area,
    required super.perimeter,
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

class BuildingHall extends Room {
  BuildingHall({
    required super.area,
    required super.perimeter,
    super.floorMaterial = FloorMaterial.marble,
    super.wallMaterial = WallMaterial.painting,
    super.ceilingMaterial = CeilingMaterial.drywall,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = false,
    super.doors = const [Door.buildingEntrance],
  });
}

class ParkingArea extends Room {
  ParkingArea({
    required super.area,
    required super.perimeter,
    super.floorMaterial = FloorMaterial.epoxy,
    super.wallMaterial = WallMaterial.painting,
    super.ceilingMaterial = CeilingMaterial.plaster,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = false,
    super.doors = const [],
  });
}

class TechnicalArea extends Room {
  TechnicalArea({
    required super.area,
    required super.perimeter,
    super.floorMaterial = FloorMaterial.ceramic,
    super.wallMaterial = WallMaterial.painting,
    super.ceilingMaterial = CeilingMaterial.plaster,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = false,
    super.doors = const [Door.fire],
  });
}

class ElevatorShaft extends Room {
  ElevatorShaft({
    required super.area,
    required super.perimeter,
    super.floorMaterial = FloorMaterial.none,
    super.wallMaterial = WallMaterial.painting,
    super.ceilingMaterial = CeilingMaterial.none,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = false,
    super.doors = const [],
  });
}

class Stairs extends Room {
  Stairs({
    required super.area,
    required super.perimeter,
    super.floorMaterial = FloorMaterial.marbleStep,
    super.wallMaterial = WallMaterial.painting,
    super.ceilingMaterial = CeilingMaterial.plaster,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = false,
    super.doors = const [],
  });
}

class Shaft extends Room {
  Shaft({
    required super.area,
    required super.perimeter,
    super.floorMaterial = FloorMaterial.none,
    super.wallMaterial = WallMaterial.none,
    super.ceilingMaterial = CeilingMaterial.none,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = false,
    super.doors = const [],
  });
}
