import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/common/bloc/bloc_state.dart';
import 'package:kost/common/config/app_space.dart';
import 'package:kost/common/config/app_text_style.dart';
import 'package:kost/quantity_details/presentation/widget/add_floor_dialog.dart';
import 'package:kost/quantity_details/presentation/widget/are_you_sure_dialog.dart';
import 'package:kost/quantity_details/presentation/widget/edit_floor_dialog.dart';
import 'package:kost/quantity_details/presentation/widget/floor_viewer.dart';
import '../../cost_table/presentation/cost_table_screen.dart';
import '../domain/bloc/quantity_details_bloc.dart';
import '../domain/bloc/quantity_details_event.dart';
import '../domain/bloc/quantity_details_state.dart';
import '../domain/model/calculator/floor.dart';

class QuantityDetailsScreen extends StatelessWidget {
  const QuantityDetailsScreen({Key? key}) : super(key: key);

  static const route = "quantity_details";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuantityDetailsBloc(),
      child: const QuantityDetailsView(),
    );
  }
}

class QuantityDetailsView extends StatelessWidget {
  const QuantityDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<QuantityDetailsBloc, QuantityDetailsState>(
          listenWhen: (previous, current) =>
              previous.blocState != current.blocState,
          listener: (context, state) {
            final blocState = state.blocState;
            if (blocState is Completed) {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              Navigator.of(context)
                  .pushNamed(CostTableScreen.route, arguments: blocState.data);
            }
          },
        ),
        BlocListener<QuantityDetailsBloc, QuantityDetailsState>(
          listenWhen: (previous, current) =>
              previous.snackBarMessage != current.snackBarMessage,
          listener: (context, state) {
            if (state.snackBarMessage.isEmpty) {
              return;
            }
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.snackBarMessage)));
          },
        ),
      ],
      child: BlocBuilder<QuantityDetailsBloc, QuantityDetailsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () => context
                          .read<QuantityDetailsBloc>()
                          .add(const CalculateCost()),
                      child: const Text("Hesapla")),
                )
              ],
            ),
            body: CustomScrollView(
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
                    Text("Detaylarını görmek istediğiniz kata dokunun",
                        style: AppTextStyle.responsiveB2(context)
                            .copyWith(color: Colors.grey)),
                    AppSpace.vL!,
                    FloorViewer(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 1.4,
                      foundationArea: state.jobCalculator.foundationArea,
                      floors: state.jobCalculator.floors,
                      onFloorAdd: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return const AddFloorDialog();
                          },
                        );
                      },
                      onFloorClick: (Floor floor) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return EditFloorDialog(
                              floor: floor,
                              onFloorDelete: () {
                                showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AreYouSureDialog(
                                      onDeclinePressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      onApprovePressed: () {
                                        context
                                            .read<QuantityDetailsBloc>()
                                            .add(FloorDelete(floor));
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  },
                                );
                              },
                              onFloorApproved: (Floor? floor) {
                                context
                                    .read<QuantityDetailsBloc>()
                                    .add(EdittedFloorApproved(floor));
                                Navigator.of(context).pop();
                              },
                            );
                          },
                        );
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
                      ],
                    ),
                  ],
                )),
              ],
            ),
          );
        },
      ),
    );
  }
}
