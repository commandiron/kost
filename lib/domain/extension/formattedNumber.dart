import 'package:intl/intl.dart';

extension DoubleFormatting on double {
  String getFormattedNumber({
    String pattern = "#,##0.00",
    String locale = "tr_TR",
    String unit = "",
  }) {
    return "${NumberFormat(pattern, locale).format(this)}${unit.isEmpty ? "" : " $unit"}";
  }
}

extension DoubleParsing on String {
  double parseFormattedNumber({
    String pattern = "#,##0.00",
    String locale = "tr_TR",
  }) {
    return NumberFormat(pattern, locale).parse(this).toDouble();
  }
}