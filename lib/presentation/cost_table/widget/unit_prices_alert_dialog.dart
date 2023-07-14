import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kost/domain/model/unit_price/currency.dart';
import 'package:kost/domain/model/unit_price/unit.dart';
import 'package:kost/domain/model/unit_price/unit_price_category.dart';
import '../../../domain/model/unit_price/unit_price.dart';

class UnitPricesAlertDialog extends StatelessWidget {
  const UnitPricesAlertDialog({Key? key, required this.unitPrices, required this.onUnitPriceSelect,}) : super(key: key);

  final List<UnitPrice> unitPrices;
  final void Function(int index) onUnitPriceSelect;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 300,
        height: 300,
        child: ListView.builder(
          itemCount: unitPrices.length,
          itemBuilder: (listContext, index) {
            return TextButton(
                onPressed: () {
                  onUnitPriceSelect(index);
                },
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(unitPrices[index]
                        .category
                        .nameTr),
                    Row(
                      children: [
                        Text(unitPrices[index].amount.toStringAsFixed(2)),
                        Text(unitPrices[index]
                            .currency
                            .symbol),
                        const Text("/"),
                        Text(unitPrices[index]
                            .category
                            .unit
                            .symbol),
                      ],
                    ),
                    Text(DateFormat("MM.yyyy").format(unitPrices[index].dateTime)),
                  ],
                ));
          },
        ),
      ),
    );
  }
}
