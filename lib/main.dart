import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/presentation/cost_table/cost_table_screen.dart';
import 'package:kost/presentation/quantity_details/quantity_details_screen.dart';

import 'domain/bloc/cost_table_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CostTableBloc()..init(),
      child: MaterialApp(
        initialRoute: QuantityDetails.route,
        routes: {
          QuantityDetails.route : (context) => const QuantityDetails(),
          CostTableScreen.route : (context) => const CostTableScreen(),
        },
      )
    );
  }
}