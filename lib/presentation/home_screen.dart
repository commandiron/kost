import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    Row(
                      children: costItems.map((e) => Text(e.jobCategory.name)).toList(),
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
