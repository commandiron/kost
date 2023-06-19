import '../../domain/model/cost_unit_price.dart';
import '../../domain/model/currency.dart';

class CostItem {
  final UnitPrice jobUnitPrices;
  final double quantity;
  final CurrencyRates currencyRates;
  final double totalPriceTRY;

  CostItem(
    {
      required this.jobUnitPrices,
      required this.quantity,
      required this.currencyRates,
    }
  ) : totalPriceTRY = jobUnitPrices.amount * quantity * jobUnitPrices.currency.toLiraRate(currencyRates);
}

