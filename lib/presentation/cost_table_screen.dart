import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:kost/domain/model/category/category.dart';
import 'package:kost/domain/model/unit_price/currency.dart';
import 'package:kost/domain/model/unit_price/unit.dart';
import 'package:kost/domain/model/unit_price/unit_price_category.dart';

import '../domain/bloc/project_bloc.dart';
import '../domain/bloc/project_event.dart';
import '../domain/bloc/project_state.dart';
import '../domain/model/cost/cost_item.dart';

class CostTableScreen extends StatelessWidget {
  const CostTableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: BlocBuilder<ProjectBloc, ProjectState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Text(
                        state.costTemplate.name,
                        style: const TextStyle(fontSize: 26),
                      ),
                      GroupedListView<CostItem, String>(
                        shrinkWrap: true,
                        elements: state.costItems,
                        groupBy: (costItem) =>
                            costItem.category.mainCategory.nameTr,
                        groupSeparatorBuilder: (String groupByValue) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              groupByValue,
                              style: const TextStyle(fontSize: 20),
                            ),
                          );
                        },
                        sort: false,
                        itemBuilder: (context, costItem) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(costItem
                                        .category.jobCategory.nameTr)),
                                Expanded(
                                    child: Text(costItem
                                        .category.unitPriceCategory.nameTr)),
                                Expanded(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(costItem.formattedUnitPrice),
                                    IconButton(
                                        onPressed: () {
                                          final unitPrices = state.unitPricePool
                                              .where((element) => costItem
                                                  .category
                                                  .jobCategory
                                                  .unitPriceCategories
                                                  .contains(element.category))
                                              .toList();
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
                                                    itemBuilder:
                                                        (listContext, index) {
                                                      return TextButton(
                                                          onPressed: () {
                                                            context
                                                                .read<
                                                                    ProjectBloc>()
                                                                .add(ReplaceCostCategory(
                                                                    costItem
                                                                        .category,
                                                                    unitPrices[
                                                                            index]
                                                                        .category));
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Text(unitPrices[
                                                                      index]
                                                                  .category
                                                                  .nameTr),
                                                              Row(
                                                                children: [
                                                                  Text(unitPrices[
                                                                          index]
                                                                      .amount
                                                                      .toString()),
                                                                  Text(unitPrices[
                                                                          index]
                                                                      .currency
                                                                      .symbol),
                                                                  const Text(
                                                                      "/"),
                                                                  Text(unitPrices[
                                                                          index]
                                                                      .category
                                                                      .unit
                                                                      .symbol),
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
                                )),
                                Expanded(
                                    child: Row(
                                  children: [
                                    Tooltip(
                                      message: costItem.quantityExplanation,
                                      verticalOffset: -12,
                                      child: const Icon(Icons.info_outlined),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(costItem.formattedQuantity),
                                  ],
                                )),
                                Expanded(
                                    child: Text(
                                        costItem.formattedTotalPriceTRY)),
                                IconButton(
                                    onPressed: () {
                                      context.read<ProjectBloc>().add(
                                          DeleteCostCategory(
                                              costItem.category));
                                    },
                                    icon: const Icon(Icons.delete))
                              ],
                            ),
                          );
                        },
                      ),
                      Text(state.formattedGrandTotalTRY),
                      const SizedBox(
                        height: 512,
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
