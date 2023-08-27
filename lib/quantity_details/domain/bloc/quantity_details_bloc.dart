import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/common/bloc/bloc_state.dart';
import 'package:kost/quantity_details/domain/bloc/quantity_details_event.dart';
import 'package:kost/quantity_details/domain/bloc/quantity_details_state.dart';
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
              landArea: 806.24,
              landPerimeter: 117.93,
              excavationArea: 576.52,
              excavationPerimeter: 102.46,
              coreCurtainLength: 19.36,
              curtainsExceeding1MeterLength: 15.7,
              basementCurtainLength: 108.12,
              columnsLess1MeterPerimeter: 9,
              elevationTowerArea: 30,
              elevationTowerHeightWithoutSlab: 3,
            ),
            floors: [
              ...Floor.duplicateFloors(
                  Floor(
                    no: 1,
                    area: 213,
                    perimeter: 64.3,
                    heightWithSlab: 3.3,
                    slabHeight: 0.3,
                    isSlabHollow: true,
                    thickWallLength: 72.97,
                    thinWallLength: 36.28,
                    windows: [
                      Window(
                          width: 17,
                          height: 2.5,
                          hasRailing: true,
                          hasWindowsill: true,
                          count: 1),
                    ],
                    rooms: [
                      ElevatorShaft(area: 8.61, perimeter: 12.8),
                      Shaft(
                        area: 1.05,
                        perimeter: 5.2,
                      ),
                      FloorHall(area: 8.1, perimeter: 13.8),
                      FireEscapeHall(area: 11.1, perimeter: 20.9),
                      Stairs(area: 7.2, perimeter: 10.9),
                      Stairs(area: 5.1, perimeter: 10.9),
                      ApartmentEntree(area: 0, perimeter: 0),
                      SaloonWithKitchen(
                        area: 39.38,
                        perimeter: 35.3,
                      ),
                      NormalRoom(area: 18.37, perimeter: 18.5),
                      NormalRoom(area: 10.76, perimeter: 13.6),
                      Bathroom(area: 6.41, perimeter: 11.1),
                      Bathroom(area: 3.16, perimeter: 7.5),
                      ApartmentEntree(area: 0, perimeter: 0),
                      SaloonWithKitchen(
                        area: 35.7,
                        perimeter: 34.2,
                      ),
                      NormalRoom(area: 15.56, perimeter: 16.2),
                      NormalRoom(area: 10.06, perimeter: 13.2),
                      Bathroom(area: 5.63, perimeter: 10.10),
                      Bathroom(area: 3.16, perimeter: 7.5),
                    ],
                  ),
                  11),
              Floor(
                no: 0,
                area: 177.15,
                perimeter: 61.3,
                heightWithSlab: 3.3,
                slabHeight: 0.3,
                isSlabHollow: true,
                thickWallLength: 66.29,
                thinWallLength: 21.67,
                windows: [
                  Window(
                      width: 14,
                      height: 2.5,
                      hasRailing: true,
                      hasWindowsill: true,
                      count: 1),
                ],
                rooms: [
                  ElevatorShaft(area: 8.61, perimeter: 12.8),
                  Shaft(
                    area: 1.05,
                    perimeter: 5.2,
                  ),
                  FireEscapeHall(area: 11.1, perimeter: 20.9),
                  BuildingHall(area: 15.92, perimeter: 21.1),
                  Stairs(area: 7.2, perimeter: 10.9),
                  Stairs(area: 5.1, perimeter: 10.9),
                  ApartmentEntree(area: 0, perimeter: 0),
                  SaloonWithKitchen(
                    area: 33.40,
                    perimeter: 30.65,
                  ),
                  NormalRoom(area: 12.43, perimeter: 14.2),
                  Bathroom(area: 4.26, perimeter: 8.6),
                  Bathroom(area: 3.16, perimeter: 7.5),
                  ApartmentEntree(area: 0, perimeter: 0),
                  SaloonWithKitchen(
                    area: 33.40,
                    perimeter: 30.65,
                  ),
                  NormalRoom(area: 12.43, perimeter: 14.2),
                  Bathroom(area: 4.26, perimeter: 8.6),
                  Bathroom(area: 3.16, perimeter: 7.5),
                ],
              ),
              Floor(
                no: -1,
                area: 477,
                perimeter: 94.42,
                heightWithSlab: 3.3,
                slabHeight: 0.3,
                isSlabHollow: false,
                thickWallLength: 39.13,
                thinWallLength: 0,
                windows: [],
                rooms: [
                  ElevatorShaft(area: 8.61, perimeter: 12.8),
                  Shaft(
                    area: 1.05,
                    perimeter: 5.2,
                  ),
                  Stairs(area: 7.2, perimeter: 10.9),
                  Stairs(area: 5.1, perimeter: 10.9),
                  FloorHall(
                      area: 6.07,
                      perimeter: 11.1,
                      doors: [Door(count: 1, doorType: DoorType.fire)]),
                  FireEscapeHall(
                      area: 17.62,
                      perimeter: 20.9,
                      doors: [Door(count: 1, doorType: DoorType.fire)]),
                  ParkingArea(area: 296.25, perimeter: 94.82),
                  TechnicalArea(area: 7.10, perimeter: 10.7),
                  TechnicalArea(area: 7.25, perimeter: 10.8),
                  TechnicalArea(area: 17, perimeter: 16.6),
                  TechnicalArea(area: 52.6, perimeter: 33.6),
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
            data: apartmentJobsGenerator.createJobs(),
          ),
        ),
      );
    });
  }

  List<Floor> getSortedFloors(List<Floor> floors) {
    return floors.sorted((a, b) => a.no.compareTo(b.no)).reversed.toList();
  }
}
