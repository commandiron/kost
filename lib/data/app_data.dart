import '../domain/model/unit_price.dart';
import '../domain/model/currency.dart';
import '../domain/model/category.dart';
import '../domain/model/unit.dart';

class AppData {
  static List<UnitPrice> unitPrices = [
    UnitPrice(
      category: UnitPriceCategory.shutCrete,
      amount: 1540,
      currency: Currency.lira,
      unit: Unit.squareMeters,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.excavation,
      amount: 450,
      currency: Currency.lira,
      unit: Unit.cubicMeters,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.breaker,
      amount: 1500,
      currency: Currency.lira,
      unit: Unit.hour,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.foundationStabilizationGravel,
      amount: 450,
      currency: Currency.lira,
      unit: Unit.cubicMeters,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.c16Concrete,
      amount: 1800,
      currency: Currency.lira,
      unit: Unit.cubicMeters,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.c30Concrete,
      amount: 1750,
      currency: Currency.lira,
      unit: Unit.cubicMeters,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.c35Concrete,
      amount: 1850,
      currency: Currency.lira,
      unit: Unit.cubicMeters,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.s420Steel,
      amount: 15930,
      currency: Currency.lira,
      unit: Unit.ton,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.plywood,
      amount: 600,
      currency: Currency.lira,
      unit: Unit.squareMeters,
      dateTime: DateTime(2023, 01)
    ),
  ];
}