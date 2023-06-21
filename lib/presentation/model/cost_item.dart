import 'package:kost/domain/model/category.dart';
import 'package:kost/domain/model/unit.dart';

import '../../domain/model/unit_price.dart';
import '../../domain/model/currency.dart';

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
      jobName: unitPrice.category.jobCategory.nameTr,
      unitPriceName: unitPrice.category.nameTr,
      formattedUnitPrice: "${unitPrice.amount} ${unitPrice.currency.symbol}/${unitPrice.unit.symbol}",
      formattedTotalPrice: "$totalPriceTRY TL"
    );
  }
}


class UiCostItem {
  String jobName;
  String unitPriceName;
  String formattedUnitPrice;
  String formattedTotalPrice;

  UiCostItem(
    {
      required this.jobName,
      required this.unitPriceName,
      required this.formattedUnitPrice,
      required this.formattedTotalPrice,
    }
  );

  UiCostItem fromCostItem(CostItem costItem) {
    return UiCostItem(
      jobName: jobName,
      unitPriceName: unitPriceName,
      formattedUnitPrice: formattedUnitPrice,
      formattedTotalPrice: formattedTotalPrice
    );
  }
}

