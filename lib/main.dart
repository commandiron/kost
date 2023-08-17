import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/cost_table/presentation/cost_table_screen.dart';
import 'package:kost/quantity_details/domain/bloc/quantity_details_bloc.dart';
import 'package:kost/quantity_details/presentation/quantity_details_screen.dart';

import 'config/app_config.dart';
import 'cost_table/domain/bloc/cost_table_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfig.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => QuantityDetailsBloc(),),
        BlocProvider(create: (context) => CostTableBloc()..init(),),
      ],
      child: MaterialApp(
        initialRoute: QuantityDetailsScreen.route,
        routes: {
          QuantityDetailsScreen.route : (context) => const QuantityDetailsScreen(),
          CostTableScreen.route : (context) => const CostTableScreen(),
        },
      )
    );
  }
}