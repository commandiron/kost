import 'package:kost/constants.dart';
import 'package:kost/logic/cost_item/price.dart';
import 'package:kost/logic/quantity_calculator.dart';

abstract class CostItem {
  String name;
  String explanation;
  Price? unitPrice;
  QuantityCalculator? quantityCalculator;
  double liraDollarRate;
  Price totalPriceLira;

  CostItem(
    {
      required this.name,
      required this.explanation,
      this.unitPrice,
      required this.quantityCalculator,
      this.liraDollarRate = Constants.currentLiraDollarRate,
    }
  ) : totalPriceLira = Price(
    amount: unitPrice != null && quantityCalculator != null
      ? (unitPrice.amount * (unitPrice.currency == Currency.dollar ? liraDollarRate : 1) * quantityCalculator.quantity)
      : 0,
    currency: Currency.nan,
    unit: unitPrice != null ? unitPrice.unit : Unit.nan
  );
}



class Iksa extends CostItem {
  Iksa({super.name = "İksa Yapılması", super.explanation = "Shutcreate", super.unitPrice, required super.quantityCalculator, super.liraDollarRate});
}