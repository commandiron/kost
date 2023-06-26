abstract class Room {
  final double area;
  final double perimeter;
  final FloorMaterial? floorMaterial;
  final WallMaterial wallMaterial;
  final bool isCeilingDrywall;
  Room(
    {
      required this.area,
      required this.perimeter,
      required this.floorMaterial,
      required this.wallMaterial,
      required this.isCeilingDrywall,
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
  NormalRoom({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.parquet, super.wallMaterial = WallMaterial.painting, super.isCeilingDrywall = true, });
}

class Kitchen extends Room {
  Kitchen({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.ceramic, super.wallMaterial = WallMaterial.painting, super.isCeilingDrywall = true,});
}

class Hall extends Room {
  Hall({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.ceramic, super.wallMaterial = WallMaterial.painting, super.isCeilingDrywall = true, });
}

class Wc extends Room {
  Wc({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.ceramic, super.wallMaterial = WallMaterial.ceramic, super.isCeilingDrywall = true});
}

class Bathroom extends Room {
  Bathroom({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.ceramic, super.wallMaterial = WallMaterial.ceramic, super.isCeilingDrywall = true});
}

class BuildingHall extends Room {
  BuildingHall({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.marble, super.wallMaterial = WallMaterial.painting, super.isCeilingDrywall = true,});
}

class ParkingArea extends Room {
  ParkingArea({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.epoxy, super.wallMaterial = WallMaterial.painting, super.isCeilingDrywall = false});
}

class TechnicalArea extends Room {
  TechnicalArea({required super.area, required super.perimeter, super.floorMaterial = FloorMaterial.ceramic, super.wallMaterial = WallMaterial.painting, super.isCeilingDrywall = false});
}