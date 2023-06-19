class Floor {
  final double area;
  final double height;
  final FloorType type;

  Floor (
    {
      required this.area,
      this.height = 3.3,
      required this.type
    }
  );
}

enum FloorType {
  b3, b2, b1, z, k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k20
}