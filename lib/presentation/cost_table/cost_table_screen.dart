import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:kost/domain/model/category/category.dart';
import 'package:kost/presentation/cost_table/widget/cost_item.dart';
import 'package:kost/presentation/cost_table/widget/main_category_title.dart';

import '../../domain/bloc/project_bloc.dart';
import '../../domain/bloc/project_state.dart';
import '../../domain/model/cost/cost.dart';

class CostTableScreen extends StatelessWidget {
  const CostTableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      GroupedListView<Cost, String>(
                        shrinkWrap: true,
                        elements: state.costs,
                        groupBy: (cost) => cost.category.mainCategory.nameTr,
                        groupSeparatorBuilder: (String groupByValue) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MainCategoryTitle(text: groupByValue),
                          );
                        },
                        sort: false,
                        indexedItemBuilder: (context, cost, index) {
                          return Container(
                            color: index.isOdd ? Colors.grey.shade400 : Colors.grey.shade200,
                            child: CostItem(
                              cost: cost,
                              unitPrices: state.unitPricePool.where((element) => cost.category.jobCategory.unitPriceCategories.contains(element.category)).toList()
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
