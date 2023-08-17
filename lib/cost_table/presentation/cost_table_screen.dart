import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/config/app_text_style.dart';
import 'package:kost/cost_table/presentation/widget/custom_grouped_list_view.dart';

import '../domain/bloc/cost_table_bloc.dart';
import '../domain/bloc/cost_table_event.dart';
import '../domain/bloc/cost_table_state.dart';

class CostTableScreen extends StatelessWidget {
  const CostTableScreen({Key? key}) : super(key: key);

  static const route = "cost_table";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CostTableBloc()..init(),
      child: const CostTablePage(),
    );
  }
}

class CostTablePage extends StatelessWidget {
  const CostTablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<CostTableBloc, CostTableState>(
            builder: (context, state) {
              return Text(state.formattedGrandTotalTRY, style: AppTextStyle.b1,);
            },
          ),
        ),
        body: BlocBuilder<CostTableBloc, CostTableState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Text(
                        state.jobQuantityCalculator.name,
                        style: const TextStyle(fontSize: 26),
                      ),
                      ElevatedButton(
                          onPressed: () => context.read<CostTableBloc>().add(const ExpandCollapseAllMainCategory()),
                          child: Text(state.categoryVisibilities.values.any((visible) => visible) ? "Collapse All" : "Expand All")
                      ),
                      CostsListView(
                        costs: state.costs,
                        formattedSubTotalsTRY: state.formattedSubTotalsTRY,
                        categoryVisibilities: state.categoryVisibilities,
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
