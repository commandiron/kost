import 'package:kost/quantity_details/domain/model/floor/room.dart';
import 'package:kost/quantity_details/domain/model/floor/window.dart';

class InitialFloor extends Floor {
  InitialFloor(
      {super.no = 0,
      super.area = 0,
      super.perimeter = 0,
      super.heightWithSlab = 3.3,
      super.slabHeight = 0.3,
      super.thickWallLength = 0,
      super.thinWallLength = 0,
      super.isSlabHollow = true,
      super.windows = const [],
      super.rooms = const []});
}

class Floor {
  int no;
  final double area;
  final double perimeter;
  final double heightWithSlab;
  final double slabHeight;
  final bool isSlabHollow;
  final double thickWallLength;
  final double thinWallLength;
  final List<Window> windows;
  final List<Room> rooms;

  Floor(
      {required this.no,
      required this.area,
      required this.perimeter,
      required this.heightWithSlab,
      required this.slabHeight,
      required this.isSlabHollow,
      required this.thickWallLength,
      required this.thinWallLength,
      required this.windows,
      required this.rooms});

  Floor copyWith({
    int? no,
    double? area,
    final double? perimeter,
    final double? heightWithSlab,
    final double? slabHeight,
    final bool? isSlabHollow,
    final double? thickWallLength,
    final double? thinWallLength,
    final List<Window>? windows,
    final List<Room>? rooms,
  }) {
    return Floor(
        no: no ?? this.no,
        area: area ?? this.area,
        perimeter: perimeter ?? this.perimeter,
        heightWithSlab: heightWithSlab ?? this.heightWithSlab,
        slabHeight: slabHeight ?? this.slabHeight,
        isSlabHollow: isSlabHollow ?? this.isSlabHollow,
        thickWallLength: thickWallLength ?? this.thickWallLength,
        thinWallLength: thinWallLength ?? this.thinWallLength,
        windows: windows ?? this.windows,
        rooms: rooms ?? this.rooms);
  }

  static List<Floor> duplicateFloors(Floor floor, int count) {
    if (floor.no == -3 || floor.no == -2 || floor.no == -1 || floor.no == 0) {
      throw (Exception("Basements or ground floor cannot be duplicate"));
    }

    final List<Floor> duplicatedFloors = [];
    for (var i = floor.no; i <= count; i++) {
      duplicatedFloors.add(Floor(
        no: i,
        area: floor.area,
        perimeter: floor.perimeter,
        heightWithSlab: floor.heightWithSlab,
        slabHeight: floor.slabHeight,
        isSlabHollow: floor.isSlabHollow,
        thickWallLength: floor.thickWallLength,
        thinWallLength: floor.thinWallLength,
        windows: floor.windows,
        rooms: floor.rooms,
      ));
    }
    return duplicatedFloors;
  }
}

extension FloorExtension on Floor {
  String get floorName {
    return switch (no) {
      -4 => "4. Bodrum Kat",
      -3 => "3. Bodrum Kat",
      -2 => "2. Bodrum Kat",
      -1 => "1. Bodrum Kat",
      0 => "Zemin Kat",
      1 => "1. Kat",
      2 => "2. Kat",
      3 => "3. Kat",
      4 => "4. Kat",
      5 => "5. Kat",
      6 => "6. Kat",
      7 => "7. Kat",
      8 => "8. Kat",
      9 => "9. Kat",
      10 => "10. Kat",
      11 => "11. Kat",
      12 => "12. Kat",
      13 => "13. Kat",
      14 => "14. Kat",
      15 => "15. Kat",
      16 => "16. Kat",
      17 => "17. Kat",
      _ => throw Exception("Maximum number of floors exceeded")
    };
  }
}