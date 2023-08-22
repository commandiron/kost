import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/common/widget/are_you_sure_dialog.dart';
import 'package:kost/quantity_details/presentation/widget/edit_floor_dialog/add_edit_floor_dialog.dart';
import 'package:kost/quantity_details/presentation/widget/floor_viewer.dart';

import '../../common/config/app_space.dart';
import '../../common/config/app_text_style.dart';
import '../domain/bloc/quantity_details_bloc.dart';
import '../domain/bloc/quantity_details_event.dart';
import '../domain/bloc/quantity_details_state.dart';
import '../domain/model/calculator/floor.dart';

class QuantityDetailsView extends StatelessWidget {
  const QuantityDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuantityDetailsBloc, QuantityDetailsState>(
      buildWhen: (previous, current) {
        return previous.jobCalculator != current.jobCalculator;
      },
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
                    height: MediaQuery.of(context).size.height / 1.6,
                    foundationArea: state.jobCalculator.foundationArea,
                    floors: state.jobCalculator.floors,
                    onAddFloor: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AddEditFloorDialog(
                            floor: Floor(
                                no: state.jobCalculator.floors
                                        .reduce((value, element) =>
                                            element.no > value.no
                                                ? element
                                                : value)
                                        .no +
                                    1,
                                ceilingArea: 0,
                                ceilingPerimeter: 0,
                                fullHeight: 0,
                                area: 0,
                                perimeter: 0,
                                heightWithoutSlab: 0,
                                thickWallLength: 0,
                                thinWallLength: 0,
                                isCeilingHollowSlab: true,
                                windows: [],
                                rooms: []),
                            onSubmitFloor: (submittedFloor) {
                              context
                                  .read<QuantityDetailsBloc>()
                                  .add(AddFloor(submittedFloor));
                              Navigator.of(context).pop();
                            },
                          );
                        },
                      );
                    },
                    onClickFloor: (Floor floor) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AddEditFloorDialog(
                            isEditMode: true,
                            floor: floor,
                            onDeleteFloor: () async {
                              final result = await showAreYouSureDialog(context,
                                      frontTitle: "Silmek istediğinize") ??
                                  false;
                              if (context.mounted) {
                                if (result) {
                                  context
                                      .read<QuantityDetailsBloc>()
                                      .add(DeleteFloor(floor));
                                  Navigator.of(context).pop();
                                }
                              }
                            },
                            onSubmitFloor: (Floor? submittedFloor) {
                              context
                                  .read<QuantityDetailsBloc>()
                                  .add(EditFloor(submittedFloor));
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
    );
  }
}