import 'package:kost/domain/calculator/detailed/floor_area.dart';
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
  final List<FloorArea> floorAreas;
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
      required this.floorAreas,
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
          floorAreas: floor.floorAreas,
          type: Floor.types[floorTypeIndex]
        )
      );
    }
    return duplicatedFloors;
  }
}

enum FloorType {
  b3, b2, b1, z, k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k20
}