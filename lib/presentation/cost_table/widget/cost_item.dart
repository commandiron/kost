import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/domain/model/category/category.dart';
import 'package:kost/domain/model/cost/cost.dart';
import 'package:kost/domain/model/unit_price/unit.dart';
import 'package:kost/presentation/cost_table/widget/quantity_text_field.dart';
import 'package:kost/presentation/cost_table/widget/unit_prices_alert_dialog.dart';

import '../../../domain/bloc/cost_table_bloc.dart';
import '../../../domain/bloc/cost_table_event.dart';
import '../../../domain/model/unit_price/unit_price.dart';

class CostItem extends StatelessWidget {
  const CostItem({Key? key, required this.cost, required this.index, required this.unitPrices})
      : super(key: key);

  final Cost cost;
  final int index;
  final List<UnitPrice> unitPrices;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index.isOdd ? Colors.grey.shade400 : Colors.grey.shade200,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(flex: 4, child: Text(cost.category.jobCategory.nameTr)),
          Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(child: Text(cost.unitPriceExplanation)),
                  IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return UnitPricesAlertDialog(
                              unitPrices: unitPrices,
                              onUnitPriceSelect: (index) {
                                context.read<CostTableBloc>().add(ReplaceUnitPrice(cost.category, unitPrices[index].category));
                                Navigator.of(context).pop();
                              },
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.edit)),
                  Expanded(child: Text(cost.formattedUnitPrice)),
                ],
              )),
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  Tooltip(
                    message: cost.quantityExplanation,
                    child: const Icon(Icons.info_outlined),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                      width: 100,
                      child: QuantityTextField(
                        formattedQuantity: cost.formattedQuantity,
                        symbol: cost.category.unitPriceCategory.unit.symbol,
                        onFieldSubmitted: (value) {
                          context.read<CostTableBloc>().add(
                            ChangeQuantityManually(cost.category.jobCategory, value)
                          );
                        },
                      ))
                ],
              )),
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  Text(cost.formattedTotalPriceTRY),
                ],
              )),
          IconButton(
              onPressed: () {
                context
                    .read<CostTableBloc>()
                    .add(DeleteCostCategory(cost.category));
              },
              icon: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
