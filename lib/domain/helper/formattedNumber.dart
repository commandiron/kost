import 'package:intl/intl.dart';

String getFormattedNumber({
    String pattern = "#,##0.00",
    String locale = "tr_TR",
    required double number,
    String unit = "",
  }) {
    return "${NumberFormat(pattern, locale).format(number)}${unit.isEmpty ? "" : " $unit"}";
  }

  double parseFormattedNumber({
    String pattern = "#,##0.00",
    String locale = "tr_TR",
    required String value,
  }) {
    return NumberFormat(pattern, locale).parse(value).toDouble();
  }