import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:kost/domain/model/category/category.dart';
import 'package:kost/domain/model/unit_price/unit_price_category.dart';

import '../domain/bloc/project_bloc.dart';
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
                                    child: Text(uiCostItem.formattedUnitPrice)
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
                                    child: Text(uiCostItem.formattedTotalPriceTRY)),
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
