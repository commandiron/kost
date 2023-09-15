import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/quantity_details/edit_floor/presentation/edit_floor_screen.dart';
import 'package:kost/quantity_details/floor_viewer/presentation/widget/edit_floor_dialog/edit_floor_dialog.dart';
import 'package:kost/quantity_details/floor_viewer/presentation/widget/floor_viewer.dart';

import '../../../common/config/app_space.dart';
import '../../../common/config/app_text_style.dart';
import '../domain/bloc/floor_viewer_bloc.dart';
import '../domain/bloc/floor_viewer_event.dart';
import '../domain/bloc/floor_viewer_state.dart';
import '../domain/model/floor/floor.dart';

class FloorViewerView extends StatelessWidget {
  const FloorViewerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FloorViewerBloc, FloorViewerState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => context.read<FloorViewerBloc>().add(const CalculateCost()),
                  child: const Text("Hesapla"),
                ),
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
                    Text(
                      "Detaylarını görmek istediğiniz kata dokunun",
                      style: AppTextStyle.responsiveB2(context).copyWith(color: Colors.grey),
                    ),
                    AppSpace.vS!,
                    FloorViewer(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 1.6,
                      floors: state.floors,
                      onAddFloor: (int newFloorNo) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return EditFloorDialog(
                              floor: InitialFloor(no: newFloorNo),
                              onSubmit: (Floor? submittedFloor) {
                                context.read<FloorViewerBloc>().add(AddFloor(submittedFloor));
                                Navigator.of(context).pop();
                              },
                            );
                          },
                        );
                      },
                      onClickFloor: (Floor floor) async {
                        final Floor? editedFloor = await Navigator.pushNamed<dynamic>(context, EditFloorScreen.route, arguments: EditFloorArguments(floor: floor));

                        // showDialog(
                        //   context: context,
                        //   builder: (_) {
                        //     return EditFloorDialog(
                        //       floor: floor,
                        //       onDeleteFloor: () async {
                        //         final result = await showAreYouSureDialog(
                        //               context,
                        //               frontTitle: "Silmek istediğinize",
                        //             ) ??
                        //             false;
                        //         if (context.mounted) {
                        //           if (result) {
                        //             context.read<FloorViewerBloc>().add(DeleteFloor(floor));
                        //             Navigator.of(context).pop();
                        //           }
                        //         }
                        //       },
                        //       onSubmit: (Floor? submittedFloor) {
                        //         context.read<FloorViewerBloc>().add(EditFloor(submittedFloor));
                        //         Navigator.of(context).pop();
                        //       },
                        //     );
                        //   },
                        // );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
