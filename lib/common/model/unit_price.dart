import 'package:kost/common/model/unit_price_category.dart';
import 'package:uuid/uuid.dart';

class UnitPrice {
  String id = const Uuid().v4();
  UnitPriceCategory category;
  double amount;
  double fixedAmount;
  Currency currency;
  DateTime dateTime;

  UnitPrice(
    {
      required this.category,
      required this.amount,
      this.fixedAmount = 0,
      required this.currency,
      required this.dateTime,
    }
  );
}

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
}