abstract class Room {
  final double area;
  final double perimeter;
  final FloorMaterial floorMaterial;
  final WallMaterial wallMaterial;
  final CeilingMaterial ceilingMaterial;
  final bool hasCovingPlaster;
  final bool hasFloorPlinth;
  final bool hasScreed;
  final bool isFloorWet;
  late List<Door>? doors;

  Room(
    {
      required this.area,
      required this.perimeter,
      required this.floorMaterial,
      required this.wallMaterial,
      required this.ceilingMaterial,
      required this.hasCovingPlaster,
      required this.hasFloorPlinth,
      required this.hasScreed,
      required this.isFloorWet,
      this.doors,
    }
  );
}

enum FloorMaterial {
  none, parquet, ceramic, marble, epoxy
}
enum WallMaterial {
  none, painting, ceramic,
}
enum CeilingMaterial {
  none, drywall,
}

class Door {
  final int count;
  final DoorType doorType;

  Door(
    {
      required this.count,
      required this.doorType,
    }
  );
}

enum DoorType {
  roomDoor, entranceDoor, fireDoor,
}

class Saloon extends Room {
  Saloon(
    {
      required super.area,
      required super.perimeter,
      super.floorMaterial = FloorMaterial.parquet,
      super.wallMaterial = WallMaterial.painting,
      super.ceilingMaterial = CeilingMaterial.drywall,
      super.hasCovingPlaster = true,
      super.hasFloorPlinth = true,
      super.hasScreed = true,
      super.isFloorWet = false,
    }
  ){
    doors ??= [
      Door(count: 2, doorType: DoorType.roomDoor)
    ];
  }
}

class SaloonWithKitchen extends Room {
  SaloonWithKitchen(
    {
      required super.area,
      required super.perimeter,
      super.floorMaterial = FloorMaterial.ceramic,
      super.wallMaterial = WallMaterial.painting,
      super.ceilingMaterial = CeilingMaterial.drywall,
      super.hasCovingPlaster = true,
      super.hasFloorPlinth = true,
      super.hasScreed = true,
      super.isFloorWet = false,
    }
  ){
    doors ??= [
      Door(count: 2, doorType: DoorType.roomDoor)
    ];
  }
}

class Kitchen extends Room {
  Kitchen(
    {
      required super.area,
      required super.perimeter,
      super.floorMaterial = FloorMaterial.ceramic,
      super.wallMaterial = WallMaterial.painting,
      super.ceilingMaterial = CeilingMaterial.drywall,
      super.hasCovingPlaster = true,
      super.hasFloorPlinth = true,
      super.hasScreed = true,
      super.isFloorWet = false,
    }
  ){
    doors ??= [
      Door(count: 1, doorType: DoorType.roomDoor)
    ];
  }
}

class NormalRoom extends Room {
  NormalRoom(
    {
      required super.area,
      required super.perimeter,
      super.floorMaterial = FloorMaterial.parquet,
      super.wallMaterial = WallMaterial.painting,
      super.ceilingMaterial = CeilingMaterial.drywall,
      super.hasCovingPlaster = true,
      super.hasFloorPlinth = true,
      super.hasScreed = true,
      super.isFloorWet = false,
    }
  ){
    doors ??= [
      Door(count: 1, doorType: DoorType.roomDoor)
    ];
  }
}

class Entree extends Room {
  Entree(
    {
      required super.area,
      required super.perimeter,
      super.floorMaterial = FloorMaterial.ceramic,
      super.wallMaterial = WallMaterial.painting,
      super.ceilingMaterial = CeilingMaterial.drywall,
      super.hasCovingPlaster = true,
      super.hasFloorPlinth = true,
      super.hasScreed = true,
      super.isFloorWet = false,
    }
  ){
    doors ??= [
      Door(count: 1, doorType: DoorType.entranceDoor)
    ];
  }
}

class Hall extends Room {
  Hall(
    {
      required super.area,
      required super.perimeter,
      super.floorMaterial = FloorMaterial.ceramic,
      super.wallMaterial = WallMaterial.painting,
      super.ceilingMaterial = CeilingMaterial.drywall,
      super.hasCovingPlaster = true,
      super.hasFloorPlinth = true,
      super.hasScreed = true,
      super.isFloorWet = false,
    }
  );
}

class Wc extends Room {
  Wc(
    {
      required super.area,
      required super.perimeter,
      super.floorMaterial = FloorMaterial.ceramic,
      super.wallMaterial = WallMaterial.ceramic,
      super.ceilingMaterial = CeilingMaterial.drywall,
      super.hasCovingPlaster = false,
      super.hasFloorPlinth = false,
      super.hasScreed = true,
      super.isFloorWet = true,
    }
  ){
    doors ??= [
      Door(count: 1, doorType: DoorType.roomDoor)
    ];
  }
}

class EscapeHallWc extends Room {
  EscapeHallWc(
      {
        required super.area,
        required super.perimeter,
        super.floorMaterial = FloorMaterial.ceramic,
        super.wallMaterial = WallMaterial.ceramic,
        super.ceilingMaterial = CeilingMaterial.drywall,
        super.hasCovingPlaster = false,
        super.hasFloorPlinth = false,
        super.hasScreed = true,
        super.isFloorWet = true,
      }
  ){
    doors ??= [
      Door(count: 2, doorType: DoorType.fireDoor)
    ];
  }
}

class Bathroom extends Room {
  Bathroom(
    {
      required super.area,
      required super.perimeter,
      super.floorMaterial = FloorMaterial.ceramic,
      super.wallMaterial = WallMaterial.ceramic,
      super.ceilingMaterial = CeilingMaterial.drywall,
      super.hasCovingPlaster = false,
      super.hasFloorPlinth = false,
      super.hasScreed = true,
      super.isFloorWet = true,
    }
  ){
    doors ??= [
      Door(count: 1, doorType: DoorType.roomDoor)
    ];
  }
}

class EscapeHallBathroom extends Room {
  EscapeHallBathroom(
      {
        required super.area,
        required super.perimeter,
        super.floorMaterial = FloorMaterial.ceramic,
        super.wallMaterial = WallMaterial.ceramic,
        super.ceilingMaterial = CeilingMaterial.drywall,
        super.hasCovingPlaster = false,
        super.hasFloorPlinth = false,
        super.hasScreed = true,
        super.isFloorWet = true,
      }
  ){
    doors ??= [
      Door(count: 2, doorType: DoorType.fireDoor)
    ];
  }
}


class Balcony extends Room {
  Balcony(
    {
      required super.area,
      required super.perimeter,
      super.floorMaterial = FloorMaterial.ceramic,
      super.wallMaterial = WallMaterial.painting,
      super.ceilingMaterial = CeilingMaterial.none,
      super.hasCovingPlaster = false,
      super.hasFloorPlinth = false,
      super.hasScreed = true,
      super.isFloorWet = true,
    }
  );
}

class BuildingHall extends Room {
  BuildingHall(
    {
      required super.area,
      required super.perimeter,
      super.floorMaterial = FloorMaterial.marble,
      super.wallMaterial = WallMaterial.painting,
      super.ceilingMaterial = CeilingMaterial.drywall,
      super.hasCovingPlaster = false,
      super.hasFloorPlinth = false,
      super.hasScreed = false,
      super.isFloorWet = false,
    }
  );
}

class ParkingArea extends Room {
  ParkingArea(
    {
      required super.area,
      required super.perimeter,
      super.floorMaterial = FloorMaterial.epoxy,
      super.wallMaterial = WallMaterial.painting,
      super.ceilingMaterial = CeilingMaterial.none,
      super.hasCovingPlaster = false,
      super.hasFloorPlinth = false,
      super.hasScreed = false,
      super.isFloorWet = false,
    }
  );
}

class TechnicalArea extends Room {
  TechnicalArea(
    {
      required super.area,
      required super.perimeter,
      super.floorMaterial = FloorMaterial.ceramic,
      super.wallMaterial = WallMaterial.painting,
      super.ceilingMaterial = CeilingMaterial.none,
      super.hasCovingPlaster = false,
      super.hasFloorPlinth = false,
      super.hasScreed = true,
      super.isFloorWet = false,
    }
  ){
    doors ??= [
      Door(count: 1, doorType: DoorType.fireDoor)
    ];
  }
}

class FireEscapeHall extends Room {
  FireEscapeHall(
    {
      required super.area,
      required super.perimeter,
      super.floorMaterial = FloorMaterial.marble,
      super.wallMaterial = WallMaterial.painting,
      super.ceilingMaterial = CeilingMaterial.none,
      super.hasCovingPlaster = false,
      super.hasFloorPlinth = false,
      super.hasScreed = false,
      super.isFloorWet = false,
    }
  ){
    doors ??= [
      Door(count: 2, doorType: DoorType.fireDoor)
    ];
  }
}

class ElevatorShaft extends Room {
  ElevatorShaft(
    {
      required super.area,
      required super.perimeter,
      super.floorMaterial = FloorMaterial.none,
      super.wallMaterial = WallMaterial.none,
      super.ceilingMaterial = CeilingMaterial.none,
      super.hasCovingPlaster = false,
      super.hasFloorPlinth = false,
      super.hasScreed = true,
      super.isFloorWet = true,
    }
  );
}

class StairsShaft extends Room {
  StairsShaft(
    {
      required super.area,
      required super.perimeter,
      super.floorMaterial = FloorMaterial.none,
      super.wallMaterial = WallMaterial.none,
      super.ceilingMaterial = CeilingMaterial.none,
      super.hasCovingPlaster = false,
      super.hasFloorPlinth = false,
      super.hasScreed = true,
      super.isFloorWet = true,
    }
  );
}