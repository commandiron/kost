import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/bloc/bloc_state.dart';

import '../../floor_viewer/presentation/floor_viewer_screen.dart';
import '../domain/bloc/cost_table_bloc.dart';
import '../domain/bloc/cost_table_state.dart';

class CostTableListener extends StatelessWidget {
  const CostTableListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CostTableBloc, CostTableState>(
      listenWhen: (previous, current) =>
          previous.blocState != current.blocState,
      listener: (context, state) {
        final blocState = state.blocState;
        if (blocState is Error) {
          Navigator.of(context)
              .pushReplacementNamed(FloorViewerScreen.route);
        }
      },
      child: child,
    );
  }
}
