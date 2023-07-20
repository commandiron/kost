import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/config/app_padding.dart';
import 'package:kost/config/app_space.dart';
import 'package:kost/config/app_text_style.dart';
import 'package:kost/presentation/cost_table/cost_table_screen.dart';
import 'package:kost/presentation/quantity_details/widget/floor_viewer.dart';

import '../../domain/bloc/cost_table_bloc.dart';
import '../../domain/bloc/cost_table_state.dart';

class QuantityDetails extends StatelessWidget {
  const QuantityDetails({Key? key}) : super(key: key);

  static const route = "quantity_details";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppPadding.allM!,
          child: BlocBuilder<CostTableBloc, CostTableState>(
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Text("Bina Bilgileri", style: AppTextStyle.b1,)
                  ),
                  SliverToBoxAdapter(
                    child: AppSpace.vL!,
                  ),
                  SliverToBoxAdapter(
                    child: FloorViewer(
                      width: MediaQuery.of(context).size.width * 0.85,
                      floorHeight: MediaQuery.of(context).size.height / 2 / state.quantityCalculator.floors.length,
                      floors: state.quantityCalculator.floors,
                      foundationArea: state.quantityCalculator.foundationArea,
                    )
                  ),
                  SliverToBoxAdapter(
                    child: AppSpace.vL!,
                  ),
                  SliverToBoxAdapter(
                      child: Text("Diğer Bilgiler", style: AppTextStyle.b1,)
                  ),
                  SliverToBoxAdapter(
                    child: AppSpace.vL!,
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Text(state.quantityCalculator.landArea.toString()),
                        Text(state.quantityCalculator.landPerimeter.toString()),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pushNamed(CostTableScreen.route),
                          child: const Text("Maliyet Hesapla")
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}