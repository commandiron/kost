import 'package:kost/domain/model/unit_price/unit_price_category.dart';
import 'currency.dart';

class UnitPrice {
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