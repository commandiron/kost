import 'package:kost/constants.dart';
import 'package:kost/logic/cost_item/price.dart';

abstract class CostItem {
  String name;
  String explanation;
  Price? unitPrice;
  double quantity;
  double liraDollarRate;
  Price totalPriceLira;

  CostItem(
    {
      required this.name,
      required this.explanation,
      this.unitPrice,
      this.quantity = 0,
      this.liraDollarRate = Constants.currentLiraDollarRate,
    }
  ) : totalPriceLira = Price(
    amount: unitPrice != null
      ? (unitPrice.amount * (unitPrice.currency == Currency.dollar ? liraDollarRate : 1) * quantity)
      : 0,
    currency: Currency.nan,
    unit: unitPrice != null ? unitPrice.unit : Unit.nan
  );
}