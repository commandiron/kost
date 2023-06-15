import 'package:kost/logic/constants.dart';

class CostItem {
  String name;
  String explanation;
  Price unitPrice;
  double quantity;
  double liraDollarRate;
  Price totalPriceLira;

  CostItem(
    {
      required this.name,
      required this.explanation,
      required this.unitPrice,
      this.quantity = 0,
      this.liraDollarRate = Constants.currentLiraDollarRate,
    }
  ) : totalPriceLira = Price(
    amount: unitPrice.amount * (unitPrice.currency == Currency.dollar ? liraDollarRate : 1) * quantity ,
    currency: Currency.lira,
    unit: unitPrice.unit
  );
}

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
  meter, squareMeters, cubicMeters, piece, hour, lumpSum, apartment
}

enum Currency {
  lira, dollar,
}