import 'package:kost/domain/model/category.dart';

import '../../domain/model/unit_price.dart';
import '../../domain/model/currency.dart';

class CostItem {
  final MainCategory mainCategory;
  final UnitPrice unitPrice;
  final double quantity;
  final CurrencyRates currencyRates;
  final double totalPriceTRY;

  CostItem(
    {
      required this.mainCategory,
      required this.unitPrice,
      required this.quantity,
      required this.currencyRates,
    }
  ) : totalPriceTRY = unitPrice.amount * quantity * unitPrice.currency.toLiraRate(currencyRates);
}

