
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/cost_table/presentation/widget/custom_grouped_list_view.dart';

import '../../common/bloc/bloc_state.dart';
import '../../common/config/app_space.dart';
import '../../common/config/app_text_style.dart';
import '../domain/bloc/cost_table_bloc.dart';
import '../domain/bloc/cost_table_event.dart';
import '../domain/bloc/cost_table_state.dart';

class CostTableView extends StatelessWidget {
  const CostTableView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
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
                child: Text(state.categoryVisibilities.values
                        .any((visible) => visible)
                    ? "Collapse All"
                    : "Expand All")),
            AppSpace.vM!,
            ElevatedButton(
                onPressed: () => context
                    .read<CostTableBloc>()
                    .add(const ExportAsPdf()),
                child: Text("ExportAsPdf")),
            AppSpace.vM!,
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
    }));
  }
}
