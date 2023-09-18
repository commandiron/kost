import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/apartment_details/domain/bloc/apartment_details_event.dart';

import '../../common/bloc/bloc_state.dart';
import '../../cost_table/presentation/cost_table_screen.dart';
import '../domain/bloc/apartment_details_bloc.dart';
import '../domain/bloc/apartment_details_state.dart';

class ApartmentDetailsListener extends StatelessWidget {
  const ApartmentDetailsListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(listeners: [
      BlocListener<ApartmentDetailsBloc, ApartmentDetailsState>(
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
      BlocListener<ApartmentDetailsBloc, ApartmentDetailsState>(
        listenWhen: (previous, current) =>
            current.snackBarMessage.isNotEmpty &&
            previous.snackBarMessage != current.snackBarMessage,
        listener: (context, state) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.snackBarMessage)),
          );
          context.read<ApartmentDetailsBloc>().add(const ClearSnackBarMessage());
        },
      ),
    ], child: child);
  }
}
