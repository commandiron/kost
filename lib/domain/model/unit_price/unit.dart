enum Unit {
  meter, squareMeters, cubicMeters, ton, number, hour, apartment, stop
}
extension UnitExtension on Unit {
  String get symbol {
    switch(this) {
      case Unit.meter : return "m";
      case Unit.squareMeters : return "m²";
      case Unit.cubicMeters : return "m³";
      case Unit.ton : return "ton";
      case Unit.number : return "adet";
      case Unit.hour : return "saat";
      case Unit.apartment : return "daire";
      case Unit.stop : return "durak";
    }
  }
}