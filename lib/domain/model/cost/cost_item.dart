import 'package:kost/domain/model/category/category.dart';
import 'package:kost/domain/model/category/unit.dart';

import '../../../presentation/model/ui_cost_item.dart';
import '../unit_price/unit_price.dart';
import '../unit_price/currency.dart';
import 'package:intl/intl.dart';

class CostItem {
  final CostCategory costCategory;
  final UnitPrice unitPrice;
  final double quantity;
  final String quantityExplanation;
  final CurrencyRates currencyRates;
  final double totalPriceTRY;

  CostItem(
    {
      required this.costCategory,
      required this.unitPrice,
      required this.quantity,
      required this.quantityExplanation,
      required this.currencyRates,
    }
  ) : totalPriceTRY = unitPrice.amount * quantity * unitPrice.currency.toLiraRate(currencyRates);

  UiCostItem toUiCostItem() {
    return UiCostItem(
      costCategory: costCategory,
      formattedUnitPrice: "${unitPrice.amount} ${unitPrice.currency.symbol}/${unitPrice.category.unit.symbol}",
      formattedQuantity: "${NumberFormat("#,##0.00", "tr_TR").format(quantity)} ${unitPrice.category.unit.symbol}",
      quantityExplanation: quantityExplanation,
      totalPriceTRY: totalPriceTRY,
      formattedTotalPriceTRY: "${NumberFormat("#,##0.00", "tr_TR").format(totalPriceTRY)} TL"
    );
  }
}