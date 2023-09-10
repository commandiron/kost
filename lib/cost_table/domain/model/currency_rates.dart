import 'package:kost/common/model/unit_price.dart';

class ManualCurrencyRates extends CurrencyRates {
  ManualCurrencyRates({super.usdTry = 27, super.eurTry = 29.72});
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

extension CurrencyRatesExtension on CurrencyRates {
  double getLiraRate(Currency currency) {
    switch(currency) {
      case Currency.lira: return 1;
      case Currency.dollar : return usdTry;
      case Currency.euro : return eurTry;
    }
  }
}