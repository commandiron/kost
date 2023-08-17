import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/config/app_space.dart';
import 'package:kost/config/app_text_style.dart';
import 'package:kost/quantity_details/presentation/widget/floor_viewer.dart';
import '../domain/bloc/quantity_details_bloc.dart';
import '../domain/bloc/quantity_details_event.dart';
import '../domain/bloc/quantity_details_state.dart';

class QuantityDetailsScreen extends StatelessWidget {
  const QuantityDetailsScreen({Key? key}) : super(key: key);

  static const route = "quantity_details";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuantityDetailsBloc(),
      child: const QuantityDetailsPage(),
    );
  }
}

class QuantityDetailsPage extends StatelessWidget {
  const QuantityDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<QuantityDetailsBloc, QuantityDetailsState>(
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
                          foundationArea: state.jobCalculator.foundationArea,
                          floors: state.jobCalculator.floors,
                          onFloorAreaChanged: (String floorAreaText, int no) {
                            context.read<QuantityDetailsBloc>().add(FloorAreaChanged(floorAreaText, no));
                          },
                          onFloorDelete: (no) {
                            context.read<QuantityDetailsBloc>().add(FloorDelete(no));
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
                            Text(state.jobCalculator.landArea.toString()),
                            Text(state.jobCalculator.landPerimeter.toString()),
                            ElevatedButton(
                                onPressed:() => context.read<QuantityDetailsBloc>().add(CalculateCost(context)),
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

