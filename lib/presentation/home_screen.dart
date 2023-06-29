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
import 'model/ui_cost_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                      Text(state.costTemplate.name, style: const TextStyle(fontSize: 26),),
                      GroupedListView<UiCostItem, String>(
                        shrinkWrap: true,
                        elements: state.uiCostItems,
                        groupBy: (uiCostItem) => uiCostItem.category.mainCategory.nameTr,
                        groupSeparatorBuilder: (String groupByValue) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(groupByValue, style: const TextStyle(fontSize: 20),),
                          );
                        },
                        sort: false,
                        itemBuilder: (context, uiCostItem) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(uiCostItem.category.jobCategory.nameTr)
                                ),
                                Expanded(
                                    child: Text(uiCostItem.category.unitPriceCategory.nameTr)
                                ),
                                Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(uiCostItem.formattedUnitPrice),
                                        IconButton(
                                          onPressed: () {
                                            final unitPrices = state.unitPricePool.where((element) => uiCostItem.category.jobCategory.unitPriceCategories.contains(element.category)).toList();
                                            showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return AlertDialog(
                                                  content: SizedBox(
                                                    width: 300,
                                                    height: 300,
                                                    child: ListView.builder(
                                                      itemCount: unitPrices.length,
                                                      itemBuilder: (listContext, index) {
                                                        return TextButton(
                                                          onPressed: () {
                                                            context.read<ProjectBloc>().add(ReplaceCostCategory(uiCostItem.category, unitPrices[index].category));
                                                            Navigator.of(context).pop();
                                                          },
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                                          )
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          icon: const Icon(Icons.edit)
                                        ),
                                        const SizedBox(width: 16,)
                                      ],
                                    )
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Tooltip(
                                        message: uiCostItem.quantityExplanation,
                                        verticalOffset: -12,
                                        child: const Icon(Icons.info_outlined),
                                      ),
                                      const SizedBox(width: 8,),
                                      Text(uiCostItem.formattedQuantity),
                                    ],
                                  )
                                ),
                                Expanded(
                                  child: Text(uiCostItem.formattedTotalPriceTRY)
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Text(state.formattedGrandTotalTRY),
                      const SizedBox(height: 512,)
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
