import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/presentation/cost_table/widget/custom_grouped_list_view.dart';

import '../../domain/bloc/cost_table_bloc.dart';
import '../../domain/bloc/cost_table_state.dart';

class CostTableScreen extends StatelessWidget {
  const CostTableScreen({Key? key}) : super(key: key);

  static const route = "cost_table";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<CostTableBloc, CostTableState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Text(
                        state.costTemplate.name,
                        style: const TextStyle(fontSize: 26),
                      ),
                      Text(state.formattedGrandTotalTRY),
                      CostsListView(
                          costs: state.costs,
                          formattedSubTotalsTRY: state.formattedSubTotalsTRY,
                          unitPricePool: state.unitPricePool),
                      const SizedBox(
                        height: 512,
                      )
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
