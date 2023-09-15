import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/cost_table/presentation/cost_table_listener.dart';

import '../../common/model/job.dart';
import '../domain/bloc/cost_table_bloc.dart';
import '../domain/bloc/cost_table_event.dart';
import 'cost_table_view.dart';

class CostTableArguments {
  CostTableArguments({
    required this.tableName,
    required this.jobs,
  });
  final String tableName;
  final List<Job> jobs;
}

class CostTableScreen extends StatelessWidget {
  const CostTableScreen({Key? key}) : super(key: key);

  static const route = "cost_table";

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as CostTableArguments?;
    return BlocProvider(
      create: (context) => CostTableBloc()..add(InitCostTableBloc(arguments?.tableName, arguments?.jobs)),
      child: const CostTableListener(
        child: CostTableView(),
      ),
    );
  }
}
