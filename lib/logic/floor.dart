class ArchitecturalFloor {
  double floorAreaM2;
  double lengthM;
  double floorToCeilingHeightM;
  ArchitecturalFloorType floorType;
  ArchitecturalFloor(
    {
      required this.floorAreaM2,
      required this.lengthM,
      this.floorToCeilingHeightM = 3,
      required this.floorType
    }
  );
}
enum ArchitecturalFloorType {
  b3, b2, b1, z, k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k20
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