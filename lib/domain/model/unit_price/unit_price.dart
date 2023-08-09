import 'package:kost/domain/model/unit_price/unit.dart';
import '../cost/job.dart';
import 'currency.dart';

class UnitPrice {
  UnitPriceCategory category;
  String nameTr;
  double amount;
  double fixedAmount;
  Currency currency;
  DateTime dateTime;
  Unit unit;

  UnitPrice(
    {
      required this.category,
      required this.nameTr,
      required this.amount,
      this.fixedAmount = 0,
      required this.currency,
      required this.dateTime,
      required this.unit,
    }
  );
}