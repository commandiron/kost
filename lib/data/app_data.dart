import '../domain/model/unit_price.dart';
import '../domain/model/currency.dart';
import '../domain/model/category.dart';
import '../domain/model/unit.dart';

class AppData {
  static List<UnitPrice> unitPrices = [
    UnitPrice(
      category: UnitPriceCategory.shutcrete,
      amount: 1540,
      currency: Currency.lira,
      unit: Unit.squareMeters,
    ),
    UnitPrice(
      category: UnitPriceCategory.excavation,
      amount: 450,
      currency: Currency.lira,
      unit: Unit.cubicMeters,
    ),
    UnitPrice(
      category: UnitPriceCategory.breaker,
      amount: 1500,
      currency: Currency.lira,
      unit: Unit.hour,
    ),
    UnitPrice(
      category: UnitPriceCategory.foundationStabilizationGravel,
      amount: 450,
      currency: Currency.lira,
      unit: Unit.cubicMeters,
    ),
    UnitPrice(
      category: UnitPriceCategory.c16Concrete,
      amount: 1800,
      currency: Currency.lira,
      unit: Unit.cubicMeters,
    ),
    UnitPrice(
      category: UnitPriceCategory.c30Concrete,
      amount: 1750,
      currency: Currency.lira,
      unit: Unit.cubicMeters,
    ),
    UnitPrice(
      category: UnitPriceCategory.c35Concrete,
      amount: 1850,
      currency: Currency.lira,
      unit: Unit.cubicMeters,
    ),
  ];
}