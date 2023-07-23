import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/config/app_space.dart';
import 'package:kost/config/app_text_style.dart';
import 'package:kost/domain/bloc/cost_table_event.dart';
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
        body: BlocBuilder<CostTableBloc, CostTableState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: Column(
                  children: [
                    AppSpace.vL!,
                    Text(
                      "Bina Bilgileri",
                      style: AppTextStyle.b1,
                    ),
                    AppSpace.vS!,
                    Text(
                      "Detaylarını görmek istediğiniz kata dokunun",
                      style: AppTextStyle.l1!.copyWith(color: Colors.grey),
                    ),
                    AppSpace.vL!,
                    FloorViewer(
                      width: 350,
                      height: 360,
                      foundationArea: state.quantityCalculator.foundationArea,
                      floors: state.quantityCalculator.floors,
                      onFloorAreaChanged: (String floorAreaText, int index) {
                        context
                            .read<CostTableBloc>()
                            .add(FloorAreaChanged(floorAreaText, index));
                      },
                    ),
                    AppSpace.vL!,
                    Text(
                      "Diğer Bilgiler",
                      style: AppTextStyle.b1,
                    ),
                    AppSpace.vL!,
                    Column(
                      children: [
                        Text(state.quantityCalculator.landArea.toString()),
                        Text(state.quantityCalculator.landPerimeter.toString()),
                        ElevatedButton(
                            onPressed:() => context.read<CostTableBloc>().add(CalculateCost(context)),
                            child: const Text("Maliyet Hesapla"))
                      ],
                    ),
                  ],
                )),
              ],
            );
          },
        ),
      ),
    );
  }
}
