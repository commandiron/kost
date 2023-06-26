abstract class Room {
  final double area;
  final double perimeter;
  final FloorMaterial? floorMaterial;
  final WallMaterial wallMaterial;
  final bool isCeilingDrywall;
  final bool isFloorWet;
  Room(
    {
      required this.area,
      required this.perimeter,
      required this.floorMaterial,
      required this.wallMaterial,
      required this.isCeilingDrywall,
      required this.isFloorWet,
    }
  );
}

enum FloorMaterial {
  parquet, ceramic, marble, epoxy
}
enum WallMaterial {
  painting, ceramic,
}

class NormalRoom extends Room {
  NormalRoom({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.parquet, super.wallMaterial = WallMaterial.painting, super.isCeilingDrywall = true, super.isFloorWet = false});
}

class Kitchen extends Room {
  Kitchen({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.ceramic, super.wallMaterial = WallMaterial.painting, super.isCeilingDrywall = true, super.isFloorWet = false});
}

class Hall extends Room {
  Hall({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.ceramic, super.wallMaterial = WallMaterial.painting, super.isCeilingDrywall = true, super.isFloorWet = false});
}

class Wc extends Room {
  Wc({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.ceramic, super.wallMaterial = WallMaterial.ceramic, super.isCeilingDrywall = true, super.isFloorWet = true});
}

class Bathroom extends Room {
  Bathroom({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.ceramic, super.wallMaterial = WallMaterial.ceramic, super.isCeilingDrywall = true, super.isFloorWet = true});
}

class Balcony extends Room {
  Balcony({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.ceramic, super.wallMaterial = WallMaterial.painting, super.isCeilingDrywall = false, super.isFloorWet = true});
}

class BuildingHall extends Room {
  BuildingHall({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.marble, super.wallMaterial = WallMaterial.painting, super.isCeilingDrywall = true, super.isFloorWet = false});
}

class ParkingArea extends Room {
  ParkingArea({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.epoxy, super.wallMaterial = WallMaterial.painting, super.isCeilingDrywall = false, super.isFloorWet = false});
}

class TechnicalArea extends Room {
  TechnicalArea({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.ceramic, super.wallMaterial = WallMaterial.painting, super.isCeilingDrywall = false, super.isFloorWet = false});
}