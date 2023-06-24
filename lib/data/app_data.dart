import '../domain/model/unit_price.dart';
import '../domain/model/currency.dart';
import '../domain/model/category.dart';

class AppData {
  static List<UnitPrice> unitPrices = [
    UnitPrice(
      category: UnitPriceCategory.shutCrete,
      amount: 1540,
      currency: Currency.lira,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.excavation,
      amount: 450,
      currency: Currency.lira,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.breaker,
      amount: 1500,
      currency: Currency.lira,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.foundationStabilizationGravel,
      amount: 450,
      currency: Currency.lira,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.c16Concrete,
      amount: 1800,
      currency: Currency.lira,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.plywood,
      amount: 600,
      currency: Currency.lira,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.c30Concrete,
      amount: 1900,
      currency: Currency.lira,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.c35Concrete,
      amount: 2000,
      currency: Currency.lira,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.s420Steel,
      amount: 15930,
      currency: Currency.lira,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.eps,
      amount: 815,
      currency: Currency.lira,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.doubleLayerBitumenMembrane,
      amount: 180,
      currency: Currency.lira,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.bitumenSliding,
      amount: 155,
      currency: Currency.lira,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.drainPlate,
      amount: 30,
      currency: Currency.lira,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.aeratedConcreteMaterial,
      amount: 1500,
      currency: Currency.lira,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.aeratedConcreteWorkmanShip,
      amount: 60,
      currency: Currency.lira,
      dateTime: DateTime(2023, 01)
    ),
    UnitPrice(
      category: UnitPriceCategory.roofing,
      amount: 3000,
      currency: Currency.lira,
      dateTime: DateTime(2023, 01)
    ),
  ];
}