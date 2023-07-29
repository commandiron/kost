import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/domain/bloc/cost_table_event.dart';
import 'package:kost/presentation/cost_table/widget/custom_grouped_list_view.dart';
import 'package:kost/presentation/quantity_details/quantity_details_screen.dart';

import '../../domain/bloc/cost_table_bloc.dart';
import '../../domain/bloc/cost_table_state.dart';

class CostTableScreen extends StatelessWidget {
  const CostTableScreen({Key? key}) : super(key: key);

  static const route = "cost_table";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, QuantityDetails.route),
              child: Text("To Quantity Details Screen")
            )
          ],
        ),
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
                      ElevatedButton(
                        onPressed: () => context.read<CostTableBloc>().add(const ExpandCollapseAllMainCategory()),
                        child: const Text("Collapse All")
                      ),
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
