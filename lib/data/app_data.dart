import '../domain/model/unit_price.dart';
import '../domain/model/currency.dart';
import '../domain/model/category.dart';
import '../domain/model/unit.dart';

class AppData {
  static List<UnitPrice> unitPrices = [
    UnitPrice(
      jobCategory: JobCategory.shutcrete,
      amount: 1540,
      currency: Currency.lira,
      unit: Unit.squareMeters,
    ),
    UnitPrice(
      jobCategory: JobCategory.excavation,
      amount: 450,
      currency: Currency.lira,
      unit: Unit.cubicMeters,
    ),
    UnitPrice(
      jobCategory: JobCategory.breaker,
      amount: 1500,
      currency: Currency.lira,
      unit: Unit.hour,
    ),
    UnitPrice(
      jobCategory: JobCategory.foundationStabilizationGravel,
      amount: 450,
      currency: Currency.lira,
      unit: Unit.cubicMeters,
    )
  ];
}