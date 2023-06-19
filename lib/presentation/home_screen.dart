import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          final items = state.costItems;
          return Container(
            alignment: Alignment.center,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text(items[index].jobUnitPrice.name),
                    SizedBox(width: 16,),
                    Text(items[index].jobUnitPrice.explanation),
                    SizedBox(width: 16,),
                    Text(items[index].jobUnitPrice.amount.toString()),
                    Text(items[index].jobUnitPrice.currency.symbol),
                    Text("/"),
                    Text(items[index].jobUnitPrice.unit.symbol),
                    SizedBox(width: 16,),
                    Text(items[index].quantity.toString()),
                    Text(items[index].jobUnitPrice.unit.symbol),
                    SizedBox(width: 16,),
                    Text(items[index].totalPriceTRY.toString()),
                    Text("TL"),
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
