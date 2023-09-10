import 'package:flutter/material.dart';
import 'package:kost/cost_table/presentation/cost_table_screen.dart';
import 'package:kost/quantity_details/presentation/quantity_details_screen.dart';

import 'common/config/app_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfig.init(context);
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: QuantityDetailsScreen.route,
        routes: {
          QuantityDetailsScreen.route : (context) => const QuantityDetailsScreen(),
          CostTableScreen.route : (context) => const CostTableScreen(),
        },
      ),
    );
  }
}


//MODEL EXPLANATION
//We have two main model; Job and UnitPrice classes.
//Job class creates on quantity_details feature package.
//UnitPrice class creates on data package.
//This two class merges in Cost class in cost_table package.