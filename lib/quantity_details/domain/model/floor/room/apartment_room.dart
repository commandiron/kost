import 'package:kost/quantity_details/domain/model/floor/room/room.dart';

class ApartmentRoom extends Room {
  ApartmentRoom({
    required super.area,
    required super.perimeter,
    required super.floorMaterial,
    required super.wallMaterial,
    required super.ceilingMaterial,
    required super.hasCovingPlaster,
    required super.hasFloorPlinth,
    required super.isFloorWet,
    required super.doors
  });
}

class Saloon extends ApartmentRoom {
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

class SaloonWithKitchen extends ApartmentRoom {
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

class Kitchen extends ApartmentRoom {
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

class NormalRoom extends ApartmentRoom {
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

class ApartmentHall extends ApartmentRoom {
  ApartmentHall({
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

class Wc extends ApartmentRoom {
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

class EscapeHallWc extends ApartmentRoom {
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

class Bathroom extends ApartmentRoom {
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

class EscapeHallBathroom extends ApartmentRoom {
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

class Balcony extends ApartmentRoom {
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