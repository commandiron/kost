import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../domain/model/category/category.dart';
import '../../../domain/model/cost/cost.dart';
import '../../../domain/model/unit_price/unit_price.dart';
import 'cost_item.dart';
import 'main_category_title.dart';

class CustomGroupedListView extends StatefulWidget {
  const CustomGroupedListView({Key? key, required this.costs, required this.formattedSubTotalsTRY, required this.unitPricePool}) : super(key: key);

  final List<Cost> costs;
  final Map<MainCategory, String> formattedSubTotalsTRY;
  final List<UnitPrice> unitPricePool;

  @override
  State<CustomGroupedListView> createState() => _CustomGroupedListViewState();
}

class _CustomGroupedListViewState extends State<CustomGroupedListView> {

  final List<Cost> hiddenCosts = [];

  @override
  Widget build(BuildContext context) {
    return GroupedListView<Cost, MainCategory>(
      shrinkWrap: true,
      elements: widget.costs,
      groupBy: (cost) => cost.category.mainCategory,
      groupSeparatorBuilder: (MainCategory mainCategory) {
        return Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                  flex: 5,
                  child: MainCategoryTitle(text: mainCategory.nameTr)),
              Expanded(
                child: Text(widget.formattedSubTotalsTRY[mainCategory] ?? ""),
              ),
              IconButton(
                icon: Icon(
                    hiddenCosts.any((cost) => cost.category.mainCategory == mainCategory) ? Icons.arrow_right : Icons.arrow_drop_down
                ),
                onPressed: () {
                  for (var cost in widget.costs) {
                    if(cost.category.mainCategory == mainCategory) {
                      if(hiddenCosts.contains(cost)) {
                        hiddenCosts.remove(cost);
                      } else {
                        hiddenCosts.add(cost);
                      }
                    }
                  }
                  setState(() {});
                },
              )
            ],
          ),
        );
      },
      sort: false,
      indexedItemBuilder: (context, cost, index) {
        return Visibility(
          visible: !hiddenCosts.contains(cost),
          child: CostItem(
              cost: cost,
              index: index,
              unitPrices: widget.unitPricePool
                  .where((element) => cost
                  .category.jobCategory.unitPriceCategories
                  .contains(element.category))
                  .toList(),
          ),
        );
      },
    );
  }
}
