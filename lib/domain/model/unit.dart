enum Unit {
  meter, squareMeters, cubicMeters, piece, hour, lumpSum, apartment
}
extension UnitExtension on Unit {
  String get symbol {
    switch(this) {
      case Unit.meter : return "m";
      case Unit.squareMeters : return "m²";
      case Unit.cubicMeters : return "m³";
      case Unit.piece : return "adet";
      case Unit.hour : return "saat";
      case Unit.lumpSum : return "gtr";
      case Unit.apartment : return "daire";
      default : throw Exception();
    }
  }
}