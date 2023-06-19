import '../domain/model/cost_unit_price.dart';
import '../domain/model/currency.dart';
import '../domain/model/job_id.dart';
import '../domain/model/unit.dart';

class AppData {
  static List<UnitPrice> unitPrices = [
    UnitPrice(
      jobId: JobId.shoring,
      name: "İksa yapılması",
      explanation: "Shutcreate",
      amount: 1540,
      currency: Currency.lira,
      unit: Unit.squareMeters,
    ),
    UnitPrice(
      jobId: JobId.excavation,
      name: "Kazı yapılması ve molozun şantiye dışına gönderilmesi",
      explanation: "Hafriyat",
      amount: 450,
      currency: Currency.lira,
      unit: Unit.cubicMeters,
    ),
    UnitPrice(
      jobId: JobId.breaker,
      name: "Kırıcı Çalıştırılması",
      explanation: "Kırıcı",
      amount: 1500,
      currency: Currency.lira,
      unit: Unit.hour,
    ),
  ];
}