import 'package:kost/domain/calculator/detailed/room.dart';
import 'package:kost/domain/calculator/detailed/window.dart';

class Floor {
  final double ceilingArea;
  final double ceilingPerimeter;
  final double fullHeight;
  final double area;
  final double perimeter;
  final double heightWithoutSlab;
  final double thickWallLength;
  final double thinWallLength;
  final bool isCeilingHollowSlab;
  final List<Window>? windows;
  final List<Room> rooms;
  final int index;

  Floor(
      {required this.ceilingArea,
      required this.ceilingPerimeter,
      required this.fullHeight,
      required this.area,
      required this.perimeter,
      required this.heightWithoutSlab,
      required this.thickWallLength,
      required this.thinWallLength,
      required this.isCeilingHollowSlab,
      this.windows,
      required this.rooms,
      required this.index});

  static List<Floor> duplicateFloors(Floor floor, int count) {
    if (floor.index == -3 || floor.index == -2 || floor.index == -1 || floor.index == 0) {
      throw (Exception("Basements or ground floor cannot be duplicate"));
    }

    final List<Floor> duplicatedFloors = [];
    for (var i = floor.index; i <= count; i++) {
      duplicatedFloors.add(Floor(
          ceilingArea: floor.ceilingArea,
          ceilingPerimeter: floor.ceilingPerimeter,
          fullHeight: floor.fullHeight,
          area: floor.area,
          perimeter: floor.perimeter,
          heightWithoutSlab: floor.heightWithoutSlab,
          thickWallLength: floor.thickWallLength,
          thinWallLength: floor.thinWallLength,
          isCeilingHollowSlab: floor.isCeilingHollowSlab,
          windows: floor.windows,
          rooms: floor.rooms,
          index: i));
    }
    return duplicatedFloors.reversed.toList();
  }
}
