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

class Saloon extends Room {
  Saloon({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.parquet, super.wallMaterial = WallMaterial.painting, super.ceilingMaterial = CeilingMaterial.drywall, super.hasCovingPlaster = true, super.hasFloorPlinth = true, super.hasScreed = true, super.isFloorWet = false,});
}

class SaloonWithKitchen extends Room {
  SaloonWithKitchen({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.ceramic, super.wallMaterial = WallMaterial.painting, super.ceilingMaterial = CeilingMaterial.drywall, super.hasCovingPlaster = true, super.hasFloorPlinth = true, super.hasScreed = true, super.isFloorWet = false, });
}

class Kitchen extends Room {
  Kitchen({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.ceramic, super.wallMaterial = WallMaterial.painting, super.ceilingMaterial = CeilingMaterial.drywall, super.hasCovingPlaster = true, super.hasFloorPlinth = true, super.hasScreed = true, super.isFloorWet = false, });
}

class NormalRoom extends Room {
  NormalRoom({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.parquet, super.wallMaterial = WallMaterial.painting, super.ceilingMaterial = CeilingMaterial.drywall, super.hasCovingPlaster = true, super.hasFloorPlinth = true, super.hasScreed = true, super.isFloorWet = false,});
}

class Hall extends Room {
  Hall({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.ceramic, super.wallMaterial = WallMaterial.painting, super.ceilingMaterial = CeilingMaterial.drywall, super.hasCovingPlaster = true, super.hasFloorPlinth = true, super.hasScreed = true, super.isFloorWet = false, });
}

class Wc extends Room {
  Wc({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.ceramic, super.wallMaterial = WallMaterial.ceramic, super.ceilingMaterial = CeilingMaterial.drywall, super.hasCovingPlaster = false, super.hasFloorPlinth = false, super.hasScreed = true, super.isFloorWet = true});
}

class Bathroom extends Room {
  Bathroom({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.ceramic, super.wallMaterial = WallMaterial.ceramic, super.ceilingMaterial = CeilingMaterial.drywall, super.hasCovingPlaster = false, super.hasFloorPlinth = false, super.hasScreed = true, super.isFloorWet = true});
}

class Balcony extends Room {
  Balcony({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.ceramic, super.wallMaterial = WallMaterial.painting, super.ceilingMaterial = CeilingMaterial.none, super.hasCovingPlaster = false, super.hasFloorPlinth = false, super.hasScreed = true, super.isFloorWet = true});
}

class BuildingHall extends Room {
  BuildingHall({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.marble, super.wallMaterial = WallMaterial.painting, super.ceilingMaterial = CeilingMaterial.drywall, super.hasCovingPlaster = false, super.hasFloorPlinth = false, super.hasScreed = false, super.isFloorWet = false});
}

class ParkingArea extends Room {
  ParkingArea({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.epoxy, super.wallMaterial = WallMaterial.painting, super.ceilingMaterial = CeilingMaterial.none, super.hasCovingPlaster = false, super.hasFloorPlinth = false, super.hasScreed = false, super.isFloorWet = false});
}

class TechnicalArea extends Room {
  TechnicalArea({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.ceramic, super.wallMaterial = WallMaterial.painting, super.ceilingMaterial = CeilingMaterial.none, super.hasCovingPlaster = false, super.hasFloorPlinth = false, super.hasScreed = true, super.isFloorWet = false});
}

class ElevatorShaft extends Room {
  ElevatorShaft({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.none, super.wallMaterial = WallMaterial.none, super.ceilingMaterial = CeilingMaterial.none, super.hasCovingPlaster = false, super.hasFloorPlinth = false, super.hasScreed = true, super.isFloorWet = true,});
}