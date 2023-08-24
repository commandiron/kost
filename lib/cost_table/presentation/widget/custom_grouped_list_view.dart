import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:kost/cost_table/presentation/widget/cost_seperator.dart';

import '../../../common/model/job.dart';
import '../../domain/bloc/cost_table_bloc.dart';
import '../../domain/bloc/cost_table_event.dart';
import '../../domain/model/cost.dart';
import 'cost_item.dart';

class CostsListView extends StatelessWidget {
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
  Widget build(BuildContext context) {
    if (!categoryVisibilities.values.any((value) => value)) {
      return ListView.builder(
        itemCount: formattedSubTotalsTRY.keys.length,
        itemBuilder: (context, index) {
          return CostSeparator(
              mainCategory:
                  costs.map((e) => e.mainCategory).toSet().toList()[index],
              formattedSubTotalsTRY: formattedSubTotalsTRY);
        },
      );
    }
    return GroupedListView<Cost, MainCategory>(
      elements: costs,
      groupBy: (cost) => cost.mainCategory,
      groupSeparatorBuilder: (MainCategory mainCategory) {
        return CostSeparator(
            mainCategory: mainCategory,
            formattedSubTotalsTRY: formattedSubTotalsTRY);
      },
      sort: false,
      indexedItemBuilder: (context, cost, index) {
        final formKey = GlobalKey<FormState>();
        return Form(
          key: formKey,
          child: CostItem(
            cost: cost,
            index: index,
            visible: categoryVisibilities[cost.mainCategory] ?? true,
            onQuantityTextChanged: (value) {
              formKey.currentState!.validate();
            },
            onQuantityTextSubmitted: (value) {
              if (formKey.currentState!.validate()) {
                context
                    .read<CostTableBloc>()
                    .add(ChangeQuantityManually(cost.jobId, value));
              }
            },
          ),
        );
      },
    );
  }
}
