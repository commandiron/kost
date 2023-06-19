import '../domain/model/cost_unit_price.dart';
import '../domain/model/currency.dart';
import '../domain/model/job_id.dart';
import '../domain/model/unit.dart';

class AppData {
  static Map<JobCategory,List<UnitPrice>> unitPrices = {
    JobCategory.shoring : [
      UnitPrice(
        jobCategory: JobCategory.shoring,
        categoryIndex: 0,
        name: "İksa yapılması",
        explanation: "Shutcreate",
        amount: 1540,
        currency: Currency.lira,
        unit: Unit.squareMeters,
      ),
      UnitPrice(
        jobCategory: JobCategory.shoring,
        categoryIndex: 1,
        name: "İksa yapılması",
        explanation: "Fore Kazık",
        amount: 1540,
        currency: Currency.lira,
        unit: Unit.squareMeters,
      ),
    ],
    JobCategory.excavation : [UnitPrice(
      jobCategory: JobCategory.excavation,
      categoryIndex: 0,
      name: "Kazı yapılması ve molozun şantiye dışına gönderilmesi",
      explanation: "Hafriyat",
      amount: 450,
      currency: Currency.lira,
      unit: Unit.cubicMeters,
    )],
    JobCategory.breaker : [UnitPrice(
      jobCategory: JobCategory.breaker,
      categoryIndex: 0,
      name: "Kırıcı Çalıştırılması",
      explanation: "Kırıcı",
      amount: 1500,
      currency: Currency.lira,
      unit: Unit.hour,
    )],
  };
}