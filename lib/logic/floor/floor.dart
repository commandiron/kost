import 'package:kost/constants.dart';

class ArchitecturalFloor {
  double floorAreaM2;
  double lengthM;
  double floorToCeilingHeightM;
  ArchitecturalFloorType floorType;
  ArchitecturalFloor(
    {
      required this.floorAreaM2,
      required this.lengthM,
      this.floorToCeilingHeightM = Constants.floorToCeilingHeightM,
      required this.floorType
    }
  );
}
enum ArchitecturalFloorType {
  b3, b2, b1, z, k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k20,
}

extension ArchitecturalFloorTypeExtension on ArchitecturalFloorType {
  StructuralFloorType get toStructuralFloorType {
    switch(this) {
      case ArchitecturalFloorType.b3 : return StructuralFloorType.b3;
      case ArchitecturalFloorType.b2 : return StructuralFloorType.b2;
      case ArchitecturalFloorType.b1 : return StructuralFloorType.b1;
      case ArchitecturalFloorType.z : return StructuralFloorType.z;
      case ArchitecturalFloorType.k1 : return StructuralFloorType.k1;
      case ArchitecturalFloorType.k2 : return StructuralFloorType.k2;
      case ArchitecturalFloorType.k3 : return StructuralFloorType.k3;
      case ArchitecturalFloorType.k4 : return StructuralFloorType.k4;
      case ArchitecturalFloorType.k5 : return StructuralFloorType.k5;
      case ArchitecturalFloorType.k6 : return StructuralFloorType.k6;
      case ArchitecturalFloorType.k7 : return StructuralFloorType.k7;
      case ArchitecturalFloorType.k8 : return StructuralFloorType.k8;
      case ArchitecturalFloorType.k9 : return StructuralFloorType.k9;
      case ArchitecturalFloorType.k10 : return StructuralFloorType.k10;
      case ArchitecturalFloorType.k11 : return StructuralFloorType.k11;
      case ArchitecturalFloorType.k12 : return StructuralFloorType.k12;
      case ArchitecturalFloorType.k13 : return StructuralFloorType.k13;
      case ArchitecturalFloorType.k14 : return StructuralFloorType.k14;
      case ArchitecturalFloorType.k15 : return StructuralFloorType.k15;
      case ArchitecturalFloorType.k16 : return StructuralFloorType.k16;
      case ArchitecturalFloorType.k17 : return StructuralFloorType.k17;
      case ArchitecturalFloorType.k18 : return StructuralFloorType.k18;
      case ArchitecturalFloorType.k19 : return StructuralFloorType.k19;
      case ArchitecturalFloorType.k20 : return StructuralFloorType.k20;
      default : throw Exception();
    }
  }
}

class StructuralFloor {
  double ceilingAreaM2;
  double lengthM;
  double floorToFloorHeightM;
  StructuralFloorType floorType;
  StructuralFloor(
    {
      required this.ceilingAreaM2,
      required this.lengthM,
      required this.floorToFloorHeightM,
      required this.floorType
    }
  );
}
enum StructuralFloorType {
  foundation, b3, b2, b1, z, k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k20, elevatorTower
}