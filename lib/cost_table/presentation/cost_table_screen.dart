import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/common/bloc/screen_state.dart';
import 'package:kost/common/config/app_text_style.dart';
import 'package:kost/cost_table/presentation/widget/custom_grouped_list_view.dart';

import '../../quantity_details/domain/model/job.dart';
import '../../quantity_details/presentation/quantity_details_screen.dart';
import '../domain/bloc/cost_table_bloc.dart';
import '../domain/bloc/cost_table_event.dart';
import '../domain/bloc/cost_table_state.dart';

class CostTableScreen extends StatelessWidget {
  const CostTableScreen({Key? key}) : super(key: key);

  static const route = "cost_table";

  @override
  Widget build(BuildContext context) {
    final jobs= ModalRoute.of(context)!.settings.arguments as List<Job>?;
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
      listenWhen: (previous, current) => previous.screenState != current.screenState,
      listener: (context, state) {
        final screenState = state.screenState;
        if(screenState is ErrorScreenState) {
          Navigator.of(context).pushReplacementNamed(QuantityDetailsScreen.route);
        }
      },
      child: BlocBuilder<CostTableBloc, CostTableState>(
          builder: (context, state) {
            if(state.screenState is! CompletedScreenState) {
              return const Center(child: CircularProgressIndicator());
            }
            return Scaffold(
              appBar: AppBar(
                title: Text(state.formattedGrandTotalTRY, style: AppTextStyle.b1,),
              ),
              body: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Text(
                          state.tableName,
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
              )
            );
          },
        ),
    );
  }
}
