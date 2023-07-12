import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:kost/domain/model/category/category.dart';
import 'package:kost/presentation/cost_table/widget/cost_item.dart';
import 'package:kost/presentation/cost_table/widget/main_category_title.dart';

import '../../domain/bloc/cost_table_bloc.dart';
import '../../domain/bloc/cost_table_state.dart';
import '../../domain/model/cost/cost.dart';

class CostTableScreen extends StatelessWidget {
  const CostTableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<CostTableBloc, CostTableState>(
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
                      Text(state.formattedGrandTotalTRY),
                      GroupedListView<Cost, MainCategory>(
                        shrinkWrap: true,
                        elements: state.costs,
                        groupBy: (cost) => cost.category.mainCategory,
                        groupSeparatorBuilder: (MainCategory mainCategory) {
                          return Container(
                            height: 80,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Expanded(
                                    child: MainCategoryTitle(
                                        text: mainCategory.nameTr)),
                                Text(
                                    state.formattedSubTotalsTRY[mainCategory] ??
                                        "")
                              ],
                            ),
                          );
                        },
                        sort: false,
                        indexedItemBuilder: (context, cost, index) {
                          return Container(
                            color: index.isOdd
                                ? Colors.grey.shade400
                                : Colors.grey.shade200,
                            height: 80,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CostItem(
                                cost: cost,
                                unitPrices: state.unitPricePool
                                    .where((element) => cost.category
                                        .jobCategory.unitPriceCategories
                                        .contains(element.category))
                                    .toList()),
                          );
                        },
                      ),
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
