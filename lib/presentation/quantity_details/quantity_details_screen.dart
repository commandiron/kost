import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/presentation/cost_table/cost_table_screen.dart';

import '../../domain/bloc/cost_table_bloc.dart';
import '../../domain/bloc/cost_table_state.dart';

class QuantityDetails extends StatelessWidget {
  const QuantityDetails({Key? key}) : super(key: key);

  static const route = "quantity_details";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<CostTableBloc, CostTableState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Text("Bilgiler"),
                      Text(state.quantityCalculator.landArea.toString()),
                      Text(state.quantityCalculator.landPerimeter.toString()),
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pushNamed(CostTableScreen.route),
                        child: const Text("Hesapla")
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
