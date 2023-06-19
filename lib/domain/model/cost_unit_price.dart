import 'package:kost/domain/model/unit.dart';

import 'job_id.dart';
import 'currency.dart';

class UnitPrice {
  JobId jobId;
  String name;
  String explanation;
  double amount;
  Currency currency;
  Unit unit;

  UnitPrice(
    {
      required this.jobId,
      required this.name,
      required this.explanation,
      required this.amount,
      required this.currency,
      required this.unit,
    }
  );
}