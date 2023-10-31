abstract class Room {
  final double area;
  final double perimeter;
  final List<Window> windows;
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
    required this.windows,
    required this.floorMaterial,
    required this.wallMaterial,
    required this.ceilingMaterial,
    required this.hasCovingPlaster,
    required this.hasFloorPlinth,
    required this.isFloorWet,
    required this.doors,
  });
}

class Window {
  final double width;
  final double height;
  final bool hasRailing;
  final bool hasWindowsill;

  Window(
    {
      required this.width,
      required this.height,
      this.hasRailing = true,
      this.hasWindowsill = true,
    }
  );
}

enum FloorMaterial {
  none,
  parquet,
  ceramic,
  marble,
  marbleStep,
  epoxy
}

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

