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
          return Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                ElevatedButton(onPressed: () => context.read<ProjectBloc>().add(ReplaceUnitPriceCategory(UnitPriceCategory.c35Concrete)), child: Text("selam")),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.uiCostItems.length,
                  itemBuilder: (context, index) {
                    final uiCostItem = state.uiCostItems[index];
                    return Column(
                      children: [
                        Row(
                          children: [
                            Text(uiCostItem.jobName),
                            SizedBox(width: 16,),
                            Text(uiCostItem.unitPriceName),
                            SizedBox(width: 16,),
                            Text(uiCostItem.formattedUnitPrice),
                            SizedBox(width: 16,),
                            Text(uiCostItem.formattedTotalPriceTRY),
                          ],
                        ),
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
            ),
          );
        },
      ),
    );
  }
}
