import 'package:kost/quantity_details/domain/model/calculator/room.dart';
import 'package:kost/quantity_details/domain/model/calculator/window.dart';

class InitialFloor extends Floor {
  InitialFloor({
    super.no = 0, 
    super.ceilingArea = 0, 
    super.ceilingPerimeter = 0, 
    super.fullHeight = 0, 
    super.area = 0, 
    super.perimeter = 0, 
    super.heightWithoutSlab = 0, 
    super.thickWallLength = 0, 
    super.thinWallLength = 0, 
    super.isCeilingHollowSlab = true, 
    super.windows = const [],
    super.rooms = const []
  });
}

class Floor {
  int no;
  final double ceilingArea;
  final double ceilingPerimeter;
  final double fullHeight;
  double area;
  final double perimeter;
  final double heightWithoutSlab;
  final double thickWallLength;
  final double thinWallLength;
  final bool isCeilingHollowSlab;
  final List<Window> windows;
  final List<Room> rooms;

  Floor(
      {required this.no,
      required this.ceilingArea,
      required this.ceilingPerimeter,
      required this.fullHeight,
      required this.area,
      required this.perimeter,
      required this.heightWithoutSlab,
      required this.thickWallLength,
      required this.thinWallLength,
      required this.isCeilingHollowSlab,
      required this.windows,
      required this.rooms});

  Floor copyWith({
    int? no,
    final double? ceilingArea,
    final double? ceilingPerimeter,
    final double? fullHeight,
    double? area,
    final double? perimeter,
    final double? heightWithoutSlab,
    final double? thickWallLength,
    final double? thinWallLength,
    final bool? isCeilingHollowSlab,
    final List<Window>? windows,
    final List<Room>? rooms,
  }) {
    return Floor(
        no: no ?? this.no,
        ceilingArea: ceilingArea ?? this.ceilingArea,
        ceilingPerimeter: ceilingPerimeter ?? this.ceilingPerimeter,
        fullHeight: fullHeight ?? this.fullHeight,
        area: area ?? this.area,
        perimeter: perimeter ?? this.perimeter,
        heightWithoutSlab: heightWithoutSlab ?? this.heightWithoutSlab,
        thickWallLength: thickWallLength ?? this.thickWallLength,
        thinWallLength: thinWallLength ?? this.thinWallLength,
        isCeilingHollowSlab: isCeilingHollowSlab ?? this.isCeilingHollowSlab,
        windows: windows ?? this.windows,
        rooms: rooms ?? this.rooms
    );
  }

  static List<Floor> duplicateFloors(Floor floor, int count) {
    if (floor.no == -3 || floor.no == -2 || floor.no == -1 || floor.no == 0) {
      throw (Exception("Basements or ground floor cannot be duplicate"));
    }

    final List<Floor> duplicatedFloors = [];
    for (var i = floor.no; i <= count; i++) {
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
          no: i));
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
