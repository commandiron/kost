import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/quantity_details/floor_viewer/domain/bloc/floor_viewer_event.dart';
import 'package:kost/quantity_details/floor_viewer/presentation/floor_viewer_listener.dart';
import 'package:kost/quantity_details/floor_viewer/presentation/floor_viewer_view.dart';

import '../domain/bloc/floor_viewer_bloc.dart';

class FloorViewerScreen extends StatelessWidget {
  const FloorViewerScreen({Key? key}) : super(key: key);

  static const route = "floor_viewer";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FloorViewerBloc()..add(const InitFloorViewerBloc()),
      child: const FloorViewerListener(
        child: FloorViewerView()
      ),
    );
  }
}