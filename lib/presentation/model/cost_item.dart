import '../../domain/model/cost_unit_price.dart';
import '../../domain/model/currency.dart';

class CostItem {
  final UnitPrice jobUnitPrice;
  final double quantity;
  final CurrencyRates currencyRates;
  final double totalPriceTRY;

  CostItem(
    {
      required this.jobUnitPrice,
      required this.quantity,
      required this.currencyRates,
    }
  ) : totalPriceTRY = jobUnitPrice.amount * quantity * jobUnitPrice.currency.toLiraRate(currencyRates);
}

