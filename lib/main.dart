import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/presentation/cost_table/cost_table_screen.dart';
import 'package:kost/presentation/quantity_details/quantity_details_screen.dart';

import 'config/app_config.dart';
import 'domain/bloc/cost_table_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfig.init(context);
    return BlocProvider(
      create: (context) => CostTableBloc()..init(),
      child: MaterialApp(
        initialRoute: CostTableScreen.route,
        routes: {
          QuantityDetailsScreen.route : (context) => const QuantityDetailsScreen(),
          CostTableScreen.route : (context) => const CostTableScreen(),
        },
      )
    );
  }
}