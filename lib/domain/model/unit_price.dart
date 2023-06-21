import 'package:kost/domain/model/unit.dart';

import 'category.dart';
import 'currency.dart';

class UnitPrice {
  UnitPriceCategory category;
  double amount;
  Currency currency;
  Unit unit;

  UnitPrice(
    {
      required this.category,
      required this.amount,
      required this.currency,
      required this.unit,
    }
  );
}