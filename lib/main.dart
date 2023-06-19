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
          final items = state.excavationCostItems;
          return Container(
            alignment: Alignment.center,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text(items[index].name),
                    SizedBox(width: 16,),
                    Text(items[index].explanation),
                    SizedBox(width: 16,),
                    Text(items[index].unitPrice.toString()),
                    Text(items[index].currency.symbol),
                    Text("/"),
                    Text(items[index].unit.symbol),
                    SizedBox(width: 16,),
                    Text(items[index].quantity.toString()),
                    Text(items[index].unit.symbol),
                    SizedBox(width: 16,),
                    Text(items[index].totalPriceTRY.toString()),
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

