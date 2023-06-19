import 'package:kost/domain/model/unit.dart';

import 'category.dart';
import 'currency.dart';

class UnitPrice {
  JobCategory jobCategory;
  String name;
  String explanation;
  double amount;
  Currency currency;
  Unit unit;

  UnitPrice(
    {
      required this.jobCategory,
      required this.name,
      required this.explanation,
      required this.amount,
      required this.currency,
      required this.unit,
    }
  );
}