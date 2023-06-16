class Price {
  double amount;
  Currency currency;
  Unit unit;
  Price(
    {
      required this.amount,
      this.currency = Currency.lira,
      required this.unit,
    }
  );
}

enum Unit {
  nan, meter, squareMeters, cubicMeters, piece, hour, lumpSum, apartment
}
extension UnitExtension on Unit {
  String get symbol {
    switch(this) {
      case Unit.nan : return "NaN";
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

enum Currency {
  nan, lira, dollar,
}
extension CurrencyExtension on Currency {
  String get symbol {
    switch(this) {
      case Currency.nan : return "NaN";
      case Currency.lira : return "₺";
      case Currency.dollar : return "\$";
      default : throw Exception();
    }
  }
}