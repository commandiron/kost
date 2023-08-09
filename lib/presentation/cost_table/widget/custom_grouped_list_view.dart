import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:kost/config/app_text_style.dart';
import 'package:kost/config/responsive.dart';
import 'package:kost/domain/bloc/cost_table_bloc.dart';
import 'package:kost/domain/bloc/cost_table_event.dart';

import '../../../config/app_padding.dart';
import '../../../domain/model/cost/category.dart';
import '../../../domain/model/cost/cost.dart';
import '../../../domain/model/unit_price/unit_price.dart';
import 'cost_item.dart';
import 'main_category_title.dart';

class CostsListView extends StatelessWidget {
  const CostsListView(
      {Key? key,
      required this.costs,
      required this.formattedSubTotalsTRY,
      required this.unitPricePool})
      : super(key: key);

  final List<Cost> costs;
  final Map<MainCategory, String> formattedSubTotalsTRY;
  final List<UnitPrice> unitPricePool;

  @override
  Widget build(BuildContext context) {
    return GroupedListView<Cost, MainCategory>(
      shrinkWrap: true,
      elements: costs,
      groupBy: (cost) => cost.mainCategory,
      groupSeparatorBuilder: (MainCategory mainCategory) {
        final visible = costs.firstWhere((cost) => cost.mainCategory == mainCategory).visible;
        return InkWell(
          onTap: () => context.read<CostTableBloc>().add(ExpandCollapseMainCategory(mainCategory)),
          child: Container(
            height: 80,
            padding: Responsive.value(context, AppPadding.hS , AppPadding.hM, AppPadding.hM),
            decoration: BoxDecoration(
              border: visible ? null : Border.all()
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 4, child: MainCategoryTitle(text: mainCategory.nameTr)),
                Expanded(
                  flex: Responsive.value(context, 2, 1, 1),
                  child: Text(formattedSubTotalsTRY[mainCategory] ?? "", style: AppTextStyle.responsiveH5B(context),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(visible ? Icons.arrow_drop_down : Icons.arrow_right, size: 24,),
                )
              ],
            ),
          ),
        );
      },
      sort: false,
      indexedItemBuilder: (context, cost, index) {
        return Visibility(
          visible: cost.visible,
          child: CostItem(
            cost: cost,
            index: index,
          ),
        );
      },
    );
  }
}
