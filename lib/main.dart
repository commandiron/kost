import 'package:flutter/material.dart';
import 'package:kost/cost_table/presentation/cost_table_screen.dart';
import 'package:kost/apartment_details/presentation/apartment_details_screen.dart';

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
        initialRoute: ApartmentDetailsScreen.route,
        routes: {
          ApartmentDetailsScreen.route : (context) => const ApartmentDetailsScreen(),
          CostTableScreen.route : (context) => const CostTableScreen(),
        },
      ),
    );
  }
}