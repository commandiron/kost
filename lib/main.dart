import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/bloc/model/cost_item.dart';

import 'bloc/project_bloc.dart';
import 'bloc/project_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MaterialChild()
    );
  }
}

class MaterialChild extends StatelessWidget {
  const MaterialChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProjectBloc()..init(),
        child: const HomeScreen()
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          final projectCalc = state.projectCalculator;
          return Container(
            alignment: Alignment.center,
            child: ListView.builder(
              itemCount: projectCalc.excavationCostItems.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text(projectCalc.excavationCostItems[index].name),
                    SizedBox(width: 16,),
                    Text(projectCalc.excavationCostItems[index].explanation),
                    SizedBox(width: 16,),
                    Text(projectCalc.excavationCostItems[index].unitPrice.toString()),
                    Text(projectCalc.excavationCostItems[index].currency.symbol),
                    Text("/"),
                    Text(projectCalc.excavationCostItems[index].unit.symbol),
                    SizedBox(width: 16,),
                    Text(projectCalc.excavationCostItems[index].quantity.toString()),
                    Text(projectCalc.excavationCostItems[index].unit.symbol),
                    SizedBox(width: 16,),
                    Text(projectCalc.excavationCostItems[index].totalPriceTRY.toString()),
                    Text(Currency.lira.symbol),
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

