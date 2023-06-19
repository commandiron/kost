import 'package:kost/domain/model/unit.dart';

import 'job_id.dart';
import 'currency.dart';

class UnitPrice {
  JobCategory jobCategory;
  int categoryIndex;
  String name;
  String explanation;
  double amount;
  Currency currency;
  Unit unit;

  UnitPrice(
    {
      required this.jobCategory,
      required this.categoryIndex,
      required this.name,
      required this.explanation,
      required this.amount,
      required this.currency,
      required this.unit,
    }
  );
}