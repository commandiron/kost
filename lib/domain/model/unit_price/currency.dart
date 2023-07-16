enum Currency {
  lira, dollar, euro
}
extension CurrencyExtension on Currency {
  String get symbol {
    switch(this) {
      case Currency.lira : return "TL";
      case Currency.dollar : return "\$";
      case Currency.euro : return "€";
      default : throw Exception();
    }
  }
  double toLiraRate(CurrencyRates currencyRates) {
    switch(this) {
      case Currency.lira: return 1;
      case Currency.dollar : return currencyRates.usdTry;
      case Currency.euro : return currencyRates.eurTry;
    }
  }
}

class ManualCurrencyRates extends CurrencyRates {
  ManualCurrencyRates({super.usdTry = 26.17, super.eurTry = 29.42});
}

abstract class CurrencyRates {
  double usdTry;
  double eurTry;
  CurrencyRates(
    {
      required this.usdTry,
      required this.eurTry,
    }
  );
}