import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:kost/presentation/cost_table/widget/cost_seperator.dart';

import '../../../domain/model/job/job.dart';
import '../../../domain/model/cost/cost.dart';
import 'cost_item.dart';

class CostsListView extends StatelessWidget {
  const CostsListView(
      {Key? key,
      required this.costs,
      required this.formattedSubTotalsTRY})
      : super(key: key);

  final List<Cost> costs;
  final Map<MainCategory, String> formattedSubTotalsTRY;

  @override
  Widget build(BuildContext context) {
    return GroupedListView<Cost, MainCategory>(
      shrinkWrap: true,
      elements: costs,
      groupBy: (cost) => cost.mainCategory,
      groupSeparatorBuilder: (MainCategory mainCategory) {
        final visible = costs.firstWhere((cost) => cost.mainCategory == mainCategory).visible;
        return CostSeparator(mainCategory: mainCategory, visible: visible, formattedSubTotalsTRY: formattedSubTotalsTRY);
      },
      sort: false,
      indexedItemBuilder: (context, cost, index) {
        return CostItem(
          cost: cost,
          index: index,
        );
      },
    );
  }
}
