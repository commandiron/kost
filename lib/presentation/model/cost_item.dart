import 'package:kost/domain/model/category.dart';
import 'package:kost/domain/model/unit.dart';

import '../../domain/model/unit_price.dart';
import '../../domain/model/currency.dart';
import 'package:intl/intl.dart';

class CostItem {
  final UnitPrice unitPrice;
  final double quantity;
  final CurrencyRates currencyRates;
  final double totalPriceTRY;

  CostItem(
    {
      required this.unitPrice,
      required this.quantity,
      required this.currencyRates,
    }
  ) : totalPriceTRY = unitPrice.amount * quantity * unitPrice.currency.toLiraRate(currencyRates);

  UiCostItem toUiCostItem() {
    return UiCostItem(
      mainCategory: unitPrice.category.mainCategory,
      jobName: unitPrice.category.jobCategory.nameTr,
      unitPriceName: unitPrice.category.nameTr,
      formattedUnitPrice: "${unitPrice.amount} ${unitPrice.currency.symbol}/${unitPrice.unit.symbol}",
      formattedQuantity: "${NumberFormat("#,##0.00", "tr_TR").format(quantity)} ${unitPrice.unit.symbol}",
      formattedTotalPriceTRY: "${NumberFormat("#,##0.00", "tr_TR").format(totalPriceTRY)} TL"
    );
  }
}

class UiCostItem {
  MainCategory mainCategory;
  String jobName;
  String unitPriceName;
  String formattedUnitPrice;
  String formattedQuantity;
  String formattedTotalPriceTRY;

  UiCostItem(
    {
      required this.mainCategory,
      required this.jobName,
      required this.unitPriceName,
      required this.formattedUnitPrice,
      required this.formattedQuantity,
      required this.formattedTotalPriceTRY,
    }
  );
}