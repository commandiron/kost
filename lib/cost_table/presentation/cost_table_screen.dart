import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/common/bloc/bloc_state.dart';
import 'package:kost/common/config/app_space.dart';
import 'package:kost/common/config/app_text_style.dart';
import 'package:kost/cost_table/presentation/widget/custom_grouped_list_view.dart';

import '../../common/model/job.dart';
import '../../quantity_details/presentation/quantity_details_screen.dart';
import '../domain/bloc/cost_table_bloc.dart';
import '../domain/bloc/cost_table_event.dart';
import '../domain/bloc/cost_table_state.dart';

class CostTableScreen extends StatelessWidget {
  const CostTableScreen({Key? key}) : super(key: key);

  static const route = "cost_table";

  @override
  Widget build(BuildContext context) {
    final jobs = ModalRoute.of(context)!.settings.arguments as List<Job>?;
    return BlocProvider(
      create: (context) => CostTableBloc()..add(Init(jobs)),
      child: const CostTableView(),
    );
  }
}

class CostTableView extends StatelessWidget {
  const CostTableView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocListener<CostTableBloc, CostTableState>(
      listenWhen: (previous, current) =>
          previous.blocState != current.blocState,
      listener: (context, state) {
        final blocState = state.blocState;
        if (blocState is Error) {
          Navigator.of(context)
              .pushReplacementNamed(QuantityDetailsScreen.route);
        }
      },
      child: Scaffold(appBar: AppBar(
        title: BlocBuilder<CostTableBloc, CostTableState>(
            builder: (context, state) {
          return Text(
            state.formattedGrandTotalTRY,
            style: AppTextStyle.b1,
          );
        }),
      ), body:
          BlocBuilder<CostTableBloc, CostTableState>(builder: (context, state) {
        if (state.blocState is! Completed) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Maliyet Hesaplanıyor..."),
                AppSpace.vL!,
                const CircularProgressIndicator(),      
              ],
            ),
          );
        }
        return Center(
          child: Column(
            children: [
              Text(
                state.tableName,
                style: const TextStyle(fontSize: 26),
              ),
              ElevatedButton(
                  onPressed: () => context
                      .read<CostTableBloc>()
                      .add(const ExpandCollapseAllMainCategory()),
                  child: Text(
                      state.categoryVisibilities.values.any((visible) => visible)
                          ? "Collapse All"
                          : "Expand All")),
              Expanded(
                child: CostsListView(
                  costs: state.costs,
                  formattedSubTotalsTRY: state.formattedSubTotalsTRY,
                  categoryVisibilities: state.categoryVisibilities,
                ),
              ),
            ],
          ),
        );
      })),
    );
  }
}
