import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/quantity_details/presentation/quantity_details_listener.dart';
import 'package:kost/quantity_details/presentation/qunatity_details_view.dart';

import '../domain/bloc/quantity_details_bloc.dart';

class QuantityDetailsScreen extends StatelessWidget {
  const QuantityDetailsScreen({Key? key}) : super(key: key);

  static const route = "quantity_details";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuantityDetailsBloc(),
      child: const QuantityDetailsListener(
        child: QuantityDetailsView()
      ),
    );
  }
}