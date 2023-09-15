import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/floor_viewer/domain/bloc/floor_viewer_event.dart';

import '../../common/bloc/bloc_state.dart';
import '../../cost_table/presentation/cost_table_screen.dart';
import '../domain/bloc/floor_viewer_bloc.dart';
import '../domain/bloc/floor_viewer_state.dart';

class FloorViewerListener extends StatelessWidget {
  const FloorViewerListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(listeners: [
      BlocListener<FloorViewerBloc, FloorViewerState>(
        listenWhen: (previous, current) => previous.blocState != current.blocState,
        listener: (context, state) {
          final blocState = state.blocState;
          if (blocState is Completed) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            Navigator.of(context).pushNamed(
              CostTableScreen.route,
              arguments: blocState.data,
            );
          }
        },
      ),
      BlocListener<FloorViewerBloc, FloorViewerState>(
        listenWhen: (previous, current) =>
            current.snackBarMessage.isNotEmpty &&
            previous.snackBarMessage != current.snackBarMessage,
        listener: (context, state) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.snackBarMessage)),
          );
          context.read<FloorViewerBloc>().add(const ClearSnackbarMessage());
        },
      ),
    ], child: child);
  }
}
