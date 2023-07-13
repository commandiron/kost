import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:kost/domain/bloc/cost_table_event.dart';
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
                                    flex: 5,
                                    child: MainCategoryTitle(
                                        text: mainCategory.nameTr)),
                                Expanded(
                                  child: Text(state.formattedSubTotalsTRY[
                                          mainCategory] ??
                                      ""),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.arrow_drop_down),
                                  onPressed: () {
                                    context
                                        .read<CostTableBloc>()
                                        .add(ShowHideCostCategories(mainCategory));
                                  },
                                )
                              ],
                            ),
                          );
                        },
                        sort: false,
                        indexedItemBuilder: (context, cost, index) {
                          return CostItem(
                              cost: cost,
                              index: index,
                              unitPrices: state.unitPricePool
                                  .where((element) => cost
                                      .category.jobCategory.unitPriceCategories
                                      .contains(element.category))
                                  .toList());
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
