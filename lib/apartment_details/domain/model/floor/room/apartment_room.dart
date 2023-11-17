import 'package:kost/apartment_details/domain/model/floor/room/room.dart';

class ApartmentRoom extends Room {
  ApartmentRoom({
    required super.name,
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

class Saloon extends ApartmentRoom {
  Saloon({
    super.name = "Salon",
    required super.area,
    required super.perimeter,
    required super.windows,
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
    super.name = "Açık Mutfaklı Salon",
    required super.area,
    required super.perimeter,
    required super.windows,
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
    super.name = "Mutfak",
    required super.area,
    required super.perimeter,
    required super.windows,
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
    super.name = "Oda",
    required super.area,
    required super.perimeter,
    required super.windows,
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
    super.name = "Antre - Koridor",
    required super.area,
    required super.perimeter,
    super.windows = const [],
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
    super.name = "Tuvalet",
    required super.area,
    required super.perimeter,
    required super.windows,
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
    super.name = "Yangın Kaçış Holü Tuvalet",
    required super.area,
    required super.perimeter,
    required super.windows,
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
    super.name = "Banyo",
    required super.area,
    required super.perimeter,
    required super.windows,
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
    super.name = "Yangın Kaçış Holü Banyo",
    required super.area,
    required super.perimeter,
    required super.windows,
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
    super.name = "Balkon",
    required super.area,
    required super.perimeter,
    super.windows = const [],
    super.floorMaterial = FloorMaterial.ceramic,
    super.wallMaterial = WallMaterial.painting,
    super.ceilingMaterial = CeilingMaterial.plaster,
    super.hasCovingPlaster = false,
    super.hasFloorPlinth = false,
    super.isFloorWet = true,
    super.doors = const [],
  });
}