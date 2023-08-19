import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:kost/cost_table/presentation/widget/cost_seperator.dart';

import '../../../quantity_details/domain/model/job.dart';
import '../../domain/model/cost/cost.dart';
import 'cost_item.dart';

class CostsListView extends StatefulWidget {
  const CostsListView(
      {Key? key,
      required this.costs,
      required this.formattedSubTotalsTRY,
      required this.categoryVisibilities})
      : super(key: key);

  final List<Cost> costs;
  final Map<MainCategory, String> formattedSubTotalsTRY;
  final Map<MainCategory, bool> categoryVisibilities;

  @override
  State<CostsListView> createState() => _CostsListViewState();
}

class _CostsListViewState extends State<CostsListView> {
  bool _isListViewRenderFinished = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _isListViewRenderFinished = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if(!_isListViewRenderFinished)
          Container(
            color: Colors.white,
            height: double.infinity,
          ),
        GroupedListView<Cost, MainCategory>(
          shrinkWrap: true,
          elements: widget.costs,
          groupBy: (cost) => cost.mainCategory,
          groupSeparatorBuilder: (MainCategory mainCategory) {
            return CostSeparator(
                mainCategory: mainCategory,
                formattedSubTotalsTRY: widget.formattedSubTotalsTRY);
          },
          sort: false,
          indexedItemBuilder: (context, cost, index) {
            return CostItem(
              cost: cost,
              index: index,
              visible: widget.categoryVisibilities[cost.mainCategory] ?? true,
            );
          },
        ),
      ],
    );
  }
}
