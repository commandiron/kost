import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/domain/model/category/category.dart';
import 'package:kost/domain/model/cost/cost.dart';
import 'package:kost/domain/model/unit_price/currency.dart';
import 'package:kost/domain/model/unit_price/unit.dart';
import 'package:kost/domain/model/unit_price/unit_price_category.dart';

import '../../../domain/bloc/project_bloc.dart';
import '../../../domain/bloc/project_event.dart';
import '../../../domain/model/unit_price/unit_price.dart';

class CostItem extends StatelessWidget {
  const CostItem({Key? key, required this.cost, required this.unitPrices}) : super(key: key);

  final Cost cost;
  final List<UnitPrice> unitPrices;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: Text(cost.category.jobCategory.nameTr)),
        Expanded(child: Text(cost.category.unitPriceCategory.nameTr)),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(cost.formattedUnitPrice),
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return AlertDialog(
                          content: SizedBox(
                            width: 300,
                            height: 300,
                            child: ListView.builder(
                              itemCount:
                              unitPrices.length,
                              itemBuilder: (listContext, index) {
                                return TextButton(
                                    onPressed: () {
                                      context.read<ProjectBloc>().add(ReplaceCostCategory(cost.category, unitPrices[index].category));
                                      Navigator.of(context).pop();
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceEvenly,
                                      children: [
                                        Text(unitPrices[index].category.nameTr),
                                        Row(
                                          children: [
                                            Text(unitPrices[index].amount.toString()),
                                            Text(unitPrices[index].currency.symbol),
                                            const Text("/"),
                                            Text(unitPrices[index].category.unit.symbol),
                                          ],
                                        ),
                                      ],
                                    ));
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.edit)),
              const SizedBox(
                width: 16,
              )
            ],
          )
        ),
        Expanded(
          child: Row(
            children: [
              Tooltip(
                message: cost.quantityExplanation,
                verticalOffset: -12,
                child: const Icon(Icons.info_outlined),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(cost.formattedQuantity),
            ],
          )
        ),
        Expanded(
          child: Text(cost.formattedTotalPriceTRY)
        ),
        IconButton(
          onPressed: () {
            context.read<ProjectBloc>().add(DeleteCostCategory(cost.category));
          },
          icon: const Icon(Icons.delete)
        )
      ],
    );
  }
}
