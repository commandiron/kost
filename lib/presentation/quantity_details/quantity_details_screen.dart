import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/config/app_space.dart';
import 'package:kost/config/app_text_style.dart';
import 'package:kost/domain/bloc/cost_table_event.dart';
import 'package:kost/presentation/quantity_details/widget/floor_viewer.dart';

import '../../domain/bloc/cost_table_bloc.dart';
import '../../domain/bloc/cost_table_state.dart';

class QuantityDetailsScreen extends StatelessWidget {
  const QuantityDetailsScreen({Key? key}) : super(key: key);

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
                      style: AppTextStyle.responsiveH4B(context),
                    ),
                    AppSpace.vS!,
                    Text(
                      "Detaylarını görmek istediğiniz kata dokunun",
                      style: AppTextStyle.responsiveB2(context).copyWith(color: Colors.grey)
                    ),
                    AppSpace.vL!,
                    FloorViewer(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 1.4,
                      foundationArea: state.costBuilder.foundationArea,
                      floors: state.costBuilder.floors,
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
                        Text(state.costBuilder.landArea.toString()),
                        Text(state.costBuilder.landPerimeter.toString()),
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
