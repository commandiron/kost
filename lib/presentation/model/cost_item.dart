import 'package:kost/domain/model/category/category.dart';
import 'package:kost/domain/model/category/unit.dart';

import '../../domain/model/unit_price/unit_price.dart';
import '../../domain/model/unit_price/currency.dart';
import 'package:intl/intl.dart';

class CostItem {
  final UnitPrice unitPrice;
  final double quantity;
  final String quantityExplanation;
  final CurrencyRates currencyRates;
  final double totalPriceTRY;

  CostItem(
    {
      required this.unitPrice,
      required this.quantity,
      required this.quantityExplanation,
      required this.currencyRates,
    }
  ) : totalPriceTRY = unitPrice.amount * quantity * unitPrice.currency.toLiraRate(currencyRates);

  UiCostItem toUiCostItem() {
    return UiCostItem(
      unitPriceCategory: unitPrice.category,
      formattedUnitPrice: "${unitPrice.amount} ${unitPrice.currency.symbol}/${unitPrice.category.unit.symbol}",
      formattedQuantity: "${NumberFormat("#,##0.00", "tr_TR").format(quantity)} ${unitPrice.category.unit.symbol}",
      quantityExplanation: quantityExplanation,
      totalPriceTRY: totalPriceTRY,
      formattedTotalPriceTRY: "${NumberFormat("#,##0.00", "tr_TR").format(totalPriceTRY)} TL"
    );
  }
}

class UiCostItem {
  UnitPriceCategory unitPriceCategory;
  String formattedUnitPrice;
  String formattedQuantity;
  String quantityExplanation;
  double totalPriceTRY;
  String formattedTotalPriceTRY;

  UiCostItem(
    {
      required this.unitPriceCategory,
      required this.formattedUnitPrice,
      required this.formattedQuantity,
      required this.quantityExplanation,
      required this.totalPriceTRY,
      required this.formattedTotalPriceTRY,
    }
  );
}