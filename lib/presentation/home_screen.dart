import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/domain/model/category.dart';
import 'package:kost/domain/model/currency.dart';
import 'package:kost/domain/model/unit.dart';

import '../domain/bloc/project_bloc.dart';
import '../domain/bloc/project_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          final mainCategories = state.groupedCostItems.keys;
          return Container(
            alignment: Alignment.center,
            child: ListView.builder(
              itemCount: mainCategories.length,
              itemBuilder: (context, index) {
                final mainCategory = mainCategories.toList()[index];
                final costItems = state.groupedCostItems[mainCategory] ?? [];
                return Column(
                  children: [
                    Text(mainCategory.name),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: costItems.length,
                      itemBuilder: (context, costItemIndex) {
                        final costItem = costItems[costItemIndex];
                        return Row(
                          children: [
                            Text(costItem.jobCategory.name),
                            SizedBox(width: 16,),
                            Text(costItem.unitPrice.amount.toString()),
                            Text(costItem.unitPrice.currency.symbol),
                            Text("/"),
                            Text(costItem.unitPrice.unit.symbol),
                            SizedBox(width: 16,),
                            Text(costItem.quantity.toString()),
                            Text(costItem.unitPrice.unit.symbol),
                            SizedBox(width: 16,),
                            Text(costItem.totalPriceTRY.toString()),
                            Text("TL"),
                          ],
                        );
                      },
                    )
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
