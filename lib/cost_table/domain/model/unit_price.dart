import 'package:kost/common/model/unit_price_category.dart';
import 'package:uuid/uuid.dart';
import 'currency.dart';

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