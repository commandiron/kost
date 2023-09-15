import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/quantity_details/edit_floor/domain/edit_floor_event.dart';
import 'package:kost/quantity_details/edit_floor/presentation/edit_floor_view.dart';

import '../../floor_viewer/domain/model/floor/floor.dart';
import '../domain/edit_floor_bloc.dart';

class EditFloorArguments {
  EditFloorArguments({
    required this.floor,
  });
  final Floor floor;
}

class EditFloorScreen extends StatelessWidget {
  const EditFloorScreen({Key? key}) : super(key: key);

  static const route = "edit_floor";

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as EditFloorArguments?;
    return BlocProvider(
      create: (context) => EditFloorBloc()..add(InitEditFloorBloc(arguments?.floor ?? InitialFloor())),
      child: const EditFloorView()
    );
  }
}