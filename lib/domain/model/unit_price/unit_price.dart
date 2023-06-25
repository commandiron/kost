import '../category/category.dart';
import 'currency.dart';

class UnitPrice {
  UnitPriceCategory category;
  double amount;
  Currency currency;
  DateTime dateTime;

  UnitPrice(
    {
      required this.category,
      required this.amount,
      required this.currency,
      required this.dateTime,
    }
  );
}