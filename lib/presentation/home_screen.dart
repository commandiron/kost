import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:kost/domain/bloc/project_event.dart';
import 'package:kost/domain/model/category.dart';
import 'package:kost/presentation/model/cost_item.dart';

import '../domain/bloc/project_bloc.dart';
import '../domain/bloc/project_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          return Column(
            children: [
              ElevatedButton(onPressed: () => context.read<ProjectBloc>().add(const ReplaceUnitPriceCategory(UnitPriceCategory.c35Concrete)), child: const Text("selam")),

              GroupedListView<UiCostItem, String>(
                shrinkWrap: true,
                elements: state.uiCostItems,
                groupBy: (uiCostItem) => uiCostItem.mainCategory.nameTr,
                groupSeparatorBuilder: (String groupByValue) => Text(groupByValue),
                itemBuilder: (context, uiCostItem) {
                  return Row(
                    children: [
                      Text(uiCostItem.jobName),
                      const SizedBox(width: 16,),
                      Text(uiCostItem.unitPriceName),
                      const SizedBox(width: 16,),
                      Text(uiCostItem.formattedUnitPrice),
                      const SizedBox(width: 16,),
                      Text(uiCostItem.formattedQuantity),
                      const SizedBox(width: 16,),
                      Text(uiCostItem.formattedTotalPriceTRY),
                    ],
                  );
                },
              ),
              Row(
                children: [
                  Text(state.formattedGrandTotalTRY),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
