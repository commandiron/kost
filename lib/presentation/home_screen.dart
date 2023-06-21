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
          return Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.costItems.length,
                  itemBuilder: (context, index) {
                    final costItem = state.costItems[index];
                    return Column(
                      children: [
                        Row(
                          children: [
                            Text(costItem.jobCategory.mainCategory.name),
                            SizedBox(width: 16,),
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
                            SizedBox(width: 4,),
                            Text("TL"),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                Row(
                  children: [
                    Text(state.grandTotalTRY.toString()),
                    SizedBox(width: 4,),
                    Text("TL"),
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
