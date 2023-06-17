import 'package:kost/constants.dart';

class Shoring extends CostItem {
  Shoring(
    {
      super.index = 0,
      super.name = "İksa yapılması",
      super.explanation = "Shutcreate",
      super.unitPrice = 1540,
      super.currency = Currency.lira,
      super.unit = Unit.squareMeters,
      super.currencyRates,
      super.quantity,
    }
  );
}
class Excavation extends CostItem {
  Excavation(
    {
      super.index = 1,
      super.name = "Kazı yapılması ve molozun şantiye dışına gönderilmesi",
      super.explanation = "Hafriyat",
      super.unitPrice = 450,
      super.currency = Currency.lira,
      super.unit = Unit.cubicMeters,
      super.currencyRates,
      super.quantity,
    }
  );
}
class Breaker extends CostItem {
  Breaker(
    {
      super.index = 2,
      super.name = "Kırıcı Çalıştırılması",
      super.explanation = "Kırıcı",
      super.unitPrice = 1500,
      super.currency = Currency.lira,
      super.unit = Unit.hour,
      super.currencyRates,
      super.quantity,
    }
);
}

class CostItem {
  int index;
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
      required this.index,
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