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
  final FloorType type;

  Floor (
    {
      required this.ceilingArea,
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
      required this.type
    }
  );

  static const List<FloorType> basementTypes = [
    FloorType.b3,
    FloorType.b2,
    FloorType.b1,
  ];

  static const FloorType groundType = FloorType.z;

  static const List<FloorType> normalTypes = [
    FloorType.k1,
    FloorType.k2,
    FloorType.k3,
    FloorType.k4,
    FloorType.k5,
    FloorType.k6,
    FloorType.k7,
    FloorType.k8,
    FloorType.k9,
    FloorType.k10,
    FloorType.k11,
    FloorType.k12,
    FloorType.k13,
    FloorType.k14,
    FloorType.k15,
    FloorType.k16,
    FloorType.k17,
    FloorType.k18,
    FloorType.k19,
    FloorType.k20,
  ];

  static const List<FloorType> types = [
    ...basementTypes,
    groundType,
    ...normalTypes
  ];

  static List<Floor> duplicateFloorsWithTypeOrdered(Floor floor, int count) {

    if(floor.type == FloorType.b3 || floor.type == FloorType.b2 || floor.type == FloorType.b3) {
      throw(Exception("Basements cannot be duplicate"));
    }

    int floorIndex = Floor.types.firstWhere((element) => element == floor.type).index;
    final List<Floor> duplicatedFloors = [];
    for(var i = 1 ; i <= count; i++ ) {

      final floorTypeIndex = floorIndex + (i - 1);

      if(floorTypeIndex > Floor.types.length - 1) {
        throw(Exception("Exceed maximum floor type (>FloorType.k20)"));
      }

      duplicatedFloors.add(
        Floor(
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
          type: Floor.types[floorTypeIndex]
        )
      );
    }
    return duplicatedFloors.reversed.toList();
  }
}

enum FloorType {
  b3, b2, b1, z, k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k20
}

extension FloorTypeExtension on FloorType {
  String get nameTr {
    return switch (this) {
      FloorType.b3 => "3. Bodrum Kat",
      FloorType.b2 => "2. Bodrum Kat",
      FloorType.b1 => "1. Bodrum Kat",
      FloorType.z => "Zemin Kat",
      FloorType.k1 => "1. Kat",
      FloorType.k2 => "2. Kat",
      FloorType.k3 => "3. Kat",
      FloorType.k4 => "4. Kat",
      FloorType.k5 => "5. Kat",
      FloorType.k6 => "6. Kat",
      FloorType.k7 => "7. Kat",
      FloorType.k8 => "8. Kat",
      FloorType.k9 => "9. Kat",
      FloorType.k10 => "10. Kat",
      FloorType.k11 => "11. Kat",
      FloorType.k12 => "12. Kat",
      FloorType.k13 => "13. Kat",
      FloorType.k14 => "14. Kat",
      FloorType.k15 => "15. Kat",
      FloorType.k16 => "16. Kat",
      FloorType.k17 => "17. Kat",
      FloorType.k18 => "18. Kat",
      FloorType.k19 => "19. Kat",
      FloorType.k20 => "20. Kat",
    };
  }
}