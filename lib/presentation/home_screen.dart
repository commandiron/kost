import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/domain/bloc/project_event.dart';
import 'package:kost/domain/model/category.dart';

import '../domain/bloc/project_bloc.dart';
import '../domain/bloc/project_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          final mainCategories =  state.groupedUiCostItems.keys.toList();
          return Column(
            children: [
              ElevatedButton(onPressed: () => context.read<ProjectBloc>().add(const ReplaceUnitPriceCategory(UnitPriceCategory.c35Concrete)), child: const Text("selam")),
              ListView.builder(
                shrinkWrap: true,
                itemCount: mainCategories.length,
                itemBuilder: (context, categoryIndex) {
                  final mainCategory = mainCategories[categoryIndex];
                  final uiCostItems = state.groupedUiCostItems[mainCategory] ?? [];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(mainCategory.nameTr, style: TextStyle(fontSize: 20),),
                      SizedBox(height: 8,),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: uiCostItems.length,
                        itemBuilder: (context, index) {
                          final uiCostItem = uiCostItems[index];
                          return Column(
                            children: [
                              Row(
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
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 16,),
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
