import '../domain/model/unit_price.dart';
import '../domain/model/currency.dart';
import '../domain/model/category.dart';
import '../domain/model/unit.dart';

class AppData {
  static Map<MainCategory, List<UnitPrice>> unitPrices = {
    MainCategory.shoring : [
      UnitPrice(
        jobCategory: JobCategory.shutcrete,
        name: "İksa yapılması",
        explanation: "Shutcreate",
        amount: 1540,
        currency: Currency.lira,
        unit: Unit.squareMeters,
      ),
      UnitPrice(
        jobCategory: JobCategory.boredPile,
        name: "İksa yapılması",
        explanation: "Fore Kazık",
        amount: 1540,
        currency: Currency.lira,
        unit: Unit.squareMeters,
      ),
    ],
    MainCategory.excavation : [UnitPrice(
      jobCategory: JobCategory.excavation,
      name: "Kazı yapılması ve molozun şantiye dışına gönderilmesi",
      explanation: "Hafriyat",
      amount: 450,
      currency: Currency.lira,
      unit: Unit.cubicMeters,
    )],
    MainCategory.breaker : [UnitPrice(
      jobCategory: JobCategory.breaker,
      name: "Kırıcı Çalıştırılması",
      explanation: "Kırıcı",
      amount: 1500,
      currency: Currency.lira,
      unit: Unit.hour,
    )],
  };
}