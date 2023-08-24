import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kost/common/config/app_padding.dart';
import 'package:kost/common/model/currency.dart';
import 'package:kost/common/model/unit_price/unit.dart';
import '../../../common/model/unit_price/unit_price.dart';

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
          itemBuilder: (context, index) {
            return Padding(
              padding: AppPadding.vS!,
              child: ElevatedButton(
                  onPressed: () {
                    onUnitPriceSelect(index);
                  },
                  child: Column(
                    children: [
                      Text(unitPrices[index].nameTr),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(unitPrices[index].amount.toStringAsFixed(2)),
                          Text(unitPrices[index]
                              .currency
                              .symbol),
                          const Text("/"),
                          Text(unitPrices[index].unit.symbol),
                        ],
                      ),
                      Text(DateFormat("MM.yyyy").format(unitPrices[index].dateTime)),
                    ],
                  )
              ),
            );
          },
        ),
      ),
    );
  }
}
