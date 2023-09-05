import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/common/bloc/bloc_state.dart';
import 'package:kost/cost_table/presentation/cost_table_screen.dart';
import 'package:kost/quantity_details/domain/bloc/quantity_details_event.dart';
import 'package:kost/quantity_details/domain/bloc/quantity_details_state.dart';
import 'package:kost/quantity_details/domain/model/floor/floor_section.dart';
import 'package:kost/quantity_details/domain/model/jobs_generator/impl/apartment_jobs_generator.dart';

import '../model/floor/floor.dart';
import '../model/project_constants.dart';
import '../model/project_variables.dart';
import '../model/floor/room.dart';
import '../model/floor/window.dart';

class QuantityDetailsBloc
    extends Bloc<QuantityDetailsEvent, QuantityDetailsState> {
  QuantityDetailsBloc()
      : super(
          QuantityDetailsState(
            blocState: Initial(),
            snackBarMessage: "",
            projectConstants: const ProjectConstants(),
            projectVariables: const ProjectVariables(
              landArea: 773.29, //✓
              landPerimeter: 116.91, //✓
              foundationArea: 660.41, //✓
              foundationPerimeter: 108.90, //✓
              foundationHeight: 1, //✓
              excavationArea: 773.29, //✓
              excavationPerimeter: 116.91, //✓
              coreCurtainLength: 13.03, //✓
              curtainsExceeding1MeterLength: 8.1, //✓
              basementCurtainLength: 108.90, //✓
              columnsLess1MeterPerimeter: 24.8,
              elevationTowerArea: 27,
              elevationTowerHeightWithoutSlab: 3,
            ),
            floors: [
              ...Floor.duplicateFloors(
                Floor(
                  no: 1,
                  area: 228.68,
                  perimeter: 63.6,
                  heightWithSlab: 3.3,
                  slabHeight: 0.3,
                  isCeilingSlabHollow: true,
                  thickWallLength: 69.24,
                  thinWallLength: 49.54,
                  windows: [
                    Window(
                        width: 19,
                        height: 2.5,
                        hasRailing: true,
                        hasWindowsill: true,
                        count: 1),
                  ],
                  floorSections: [
                    CommonArea(
                      rooms: [
                        ElevatorShaft(area: 9.5, perimeter: 12.6),
                        Stairs(area: 6.86, perimeter: 10.5),
                        Stairs(area: 14.73, perimeter: 15.5),
                        FloorHall(area: 4.65, perimeter: 9.25,),
                      ]
                    ),
                    Apartment(
                      rooms: [
                        Hall(area: 10.66, perimeter: 20.65),
                        Saloon(area: 27.36, perimeter: 23.20),
                        Kitchen(area: 7.58, perimeter: 11.55),
                        NormalRoom(area: 7.45, perimeter: 10.95),
                        NormalRoom(area: 7.96, perimeter: 11.85),
                        NormalRoom(area: 12.11, perimeter: 15.15),
                        Bathroom(area: 4.87, perimeter: 9.05),
                        EscapeHallBathroom(area: 3.08, perimeter: 7.05),
                        Balcony(area: 2.53, perimeter: 6.40),
                      ]
                    ),
                    Apartment(
                      rooms: [
                        Hall(area: 10.66, perimeter: 20.65),
                        Saloon(area: 27.36, perimeter: 23.20),
                        Kitchen(area: 7.58, perimeter: 11.55),
                        NormalRoom(area: 7.45, perimeter: 10.95),
                        NormalRoom(area: 7.96, perimeter: 11.85),
                        NormalRoom(area: 12.11, perimeter: 15.15),
                        Bathroom(area: 4.87, perimeter: 9.05),
                        EscapeHallBathroom(area: 3.08, perimeter: 7.05),
                        Balcony(area: 2.53, perimeter: 6.40),
                      ]
                    )
                  ],
                ),
                count: 9,
              ),
              Floor(
                no: 0,
                area: 166.68,
                perimeter: 59.6,
                heightWithSlab: 3.3,
                slabHeight: 0.3,
                isCeilingSlabHollow: true,
                thickWallLength: 65.71,
                thinWallLength: 15.5,
                windows: [
                  Window(
                      width: 17.4,
                      height: 2.5,
                      hasRailing: true,
                      hasWindowsill: true,
                      count: 1),
                ],
                floorSections: [
                  CommonArea(
                    rooms: [
                      ElevatorShaft(area: 9.5, perimeter: 12.6),
                      Stairs(area: 6.86, perimeter: 10.5),
                      Stairs(area: 14.73, perimeter: 15.5),
                      ApartmentFloorHall(area: 4.65, perimeter: 9.25,),
                    ]
                  ),
                  Apartment(
                    rooms: [
                      SaloonWithKitchen(area: 28.06, perimeter: 30.95,),
                      NormalRoom(area: 12.93, perimeter: 18.6),
                      Bathroom(area: 4.74, perimeter: 8.75),
                      EscapeHallBathroom(area: 3.37, perimeter: 7.35),
                    ]
                  ),
                  Apartment(
                    rooms: [
                      SaloonWithKitchen(area: 28.06, perimeter: 30.95,),
                      NormalRoom(area: 12.93, perimeter: 18.6),
                      Bathroom(area: 4.74, perimeter: 8.75),
                      EscapeHallBathroom(area: 3.37, perimeter: 7.35),
                    ]
                  )
                ],
              ),
              Floor(
                no: -1,
                area: 660.41,
                perimeter: 108.90,
                heightWithSlab: 3.3,
                slabHeight: 0.3,
                isCeilingSlabHollow: false,
                thickWallLength: 50,
                thinWallLength: 0,
                windows: [],
                floorSections: [
                  CommonArea(
                    rooms: [
                      ElevatorShaft(area: 9.5, perimeter: 12.6),
                      Stairs(area: 6.86, perimeter: 10.5),
                      Stairs(area: 14.73, perimeter: 15.5),
                      FloorHall(area: 4.65, perimeter: 9.25, doors: [Door.fire]),
                      FireEscapeHall(area: 3.08, perimeter: 7.05),
                      ParkingArea(area: 500, perimeter: 120),
                      TechnicalArea(area: 7.10, perimeter: 10.7),
                      TechnicalArea(area: 7.25, perimeter: 10.8),
                      TechnicalArea(area: 17, perimeter: 16.6),
                      TechnicalArea(area: 52.6, perimeter: 33.6),
                    ]
                  )
                ],
              ),
            ],
          ),
        ) {
    on<Init>((event, emit) {
      emit(state.copyWith(floors: getSortedFloors(state.floors)));
    });
    on<AddFloor>((event, emit) {
      if (event.floor == null) {
        emit(state.copyWith(snackBarMessage: "Deşiklik yapılmadı."));
        return;
      }

      if (event.floor!.no >= 17) {
        emit(
            state.copyWith(snackBarMessage: "Maksimum kat sayısına ulaşıldı."));
        return;
      }

      if (event.floor!.no <= -4) {
        emit(state.copyWith(
            snackBarMessage: "Maksimum bodrum kat sayısına ulaşıldı."));
        return;
      }

      List<Floor> floors = state.floors;

      floors.add(event.floor!);

      emit(state.copyWith(
        snackBarMessage: "${event.floor!.floorName} Eklendi.",
        floors: getSortedFloors(floors),
      ));
    });
    on<DeleteFloor>((event, emit) {
      final basementFloorsCount =
          state.floors.where((element) => element.no < 0).length;
      if (event.floor.no == -1 && basementFloorsCount == 1) {
        emit(state.copyWith(snackBarMessage: "İlk bodrum kat silinemez"));
        return;
      }
      if (event.floor.no == 0) {
        emit(state.copyWith(snackBarMessage: "Zemin kat silinemez"));
        return;
      }

      final floors = state.floors;

      floors.remove(event.floor);

      for (var floor in floors) {
        if (floor.no > event.floor.no) {
          if (event.floor.no > 0) {
            floor.no -= 1;
          }
        } else {
          if (event.floor.no < 0) {
            floor.no += 1;
          }
        }
      }

      emit(state.copyWith(
        snackBarMessage: "${event.floor.floorName} Silindi.",
        floors: floors,
      ));
    });
    on<EditFloor>((event, emit) {
      if (event.floor == null) {
        emit(state.copyWith(snackBarMessage: "Deşiklik yapılmadı."));
        return;
      }

      final floors = state.floors;

      final floorIndex =
          floors.indexWhere((element) => element.no == event.floor!.no);

      floors[floorIndex] = event.floor!;

      emit(state.copyWith(
        snackBarMessage: "${event.floor!.floorName} Değiştirildi.",
        floors: floors,
      ));
    });
    on<ClearSnackbarMessage>((event, emit) {
      emit(state.copyWith(snackBarMessage: ""));
    });
    on<CalculateCost>((event, emit) {
      final apartmentJobsGenerator = ApartmentJobsGenerator(
        projectConstants: state.projectConstants,
        projectVariables: state.projectVariables,
        floors: state.floors,
      );
      emit(
        state.copyWith(
          blocState: Completed(
            data: CostTableArguments(
              tableName: "${apartmentJobsGenerator.name} Maliyeti",
              jobs: apartmentJobsGenerator.createJobs(),
            ),
          ),
        ),
      );
    });
  }

  List<Floor> getSortedFloors(List<Floor> floors) {
    return floors.sorted((a, b) => a.no.compareTo(b.no)).reversed.toList();
  }
}
