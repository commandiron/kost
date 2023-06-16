import 'package:kost/constants.dart';

class Iksa extends CostItem {
  Iksa(
    {
      super.name = "İksa Yapılması",
      super.explanation = "Shutcreate",
      super.unitPrice = 1540,
      super.currency = Currency.lira,
      super.unit = Unit.squareMeters,
      super.currencyRates,
      super.quantity,
    }
  );
}
class Hafriyat extends CostItem {
  Hafriyat(
    {
      super.name = "Kazı yapılması ve şantiye dışına gönderilmesi",
      super.explanation = "Hafriyat",
      super.unitPrice = 450,
      super.currency = Currency.lira,
      super.unit = Unit.cubicMeters,
      super.currencyRates,
      super.quantity,
    }
  );
}

abstract class CostItem {
  String name;
  String explanation;
  double unitPrice;
  Currency currency;
  Unit unit;
  double quantity;
  CurrencyRates? currencyRates;
  double totalPriceTRY;

  CostItem(
    {
      required this.name,
      required this.explanation,
      required this.unitPrice,
      required this.currency,
      required this.unit,
      this.currencyRates,
      this.quantity = 0,
    }
  ) : totalPriceTRY = unitPrice * quantity * currency.toLiraRate(currencyRates);
}

enum Currency {
  lira, dollar, euro
}
extension CurrencyExtension on Currency {
  String get symbol {
    switch(this) {
      case Currency.lira : return "₺";
      case Currency.dollar : return "\$";
      case Currency.euro : return "€";
      default : throw Exception();
    }
  }
  double toLiraRate(CurrencyRates? currencyRates) {
    switch(this) {
      case Currency.lira: return 1;
      case Currency.dollar : return currencyRates?.USDTRY ?? Constants.USDTRY;
      case Currency.euro : return currencyRates?.EURTRY ?? Constants.EURTRY;
    }
  }
}

class CurrencyRates {
  double USDTRY;
  double EURTRY;
  CurrencyRates(
      {
        required this.USDTRY,
        required this.EURTRY,
      }
      );
}

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