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
      required this.index
    });

  static const List<int> basementIndexes = [
    -3,
    -2,
    -1,
  ];

  static const int groundIndex = 0;

  static const List<int> normalIndexes = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
  ];

  static const List<int> indexes = [
    ...basementIndexes,
    groundIndex,
    ...normalIndexes
  ];

  static List<Floor> duplicateFloorsWithTypeOrdered(Floor floor, int count) {
    if (floor.index == -1 ||
        floor.index == -2 ||
        floor.index == -3) {
      throw (Exception("Basements cannot be duplicate"));
    }

    int floorIndex = Floor.indexes.firstWhere((element) => element == floor.index);
    final List<Floor> duplicatedFloors = [];
    for (var i = 1; i <= count; i++) {
      final floorTypeIndex = floorIndex + (i - 1);

      if (floorTypeIndex > Floor.indexes.length - 1) {
        throw (Exception("Exceed maximum floor type (>FloorType.k20)"));
      }

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
          index: Floor.indexes[floorTypeIndex]));
    }
    return duplicatedFloors.reversed.toList();
  }
}
