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

class DefaultCurrencyRates extends CurrencyRates {
  DefaultCurrencyRates({super.usdTry = 23.67, super.eurTry = 25.92});
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