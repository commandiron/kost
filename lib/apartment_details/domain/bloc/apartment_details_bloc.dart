import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/common/bloc/bloc_state.dart';
import 'package:kost/cost_table/presentation/cost_table_screen.dart';
import 'package:kost/apartment_details/domain/bloc/apartment_details_event.dart';
import 'package:kost/apartment_details/domain/bloc/apartment_details_state.dart';
import 'package:kost/apartment_details/domain/model/jobs_generator/impl/apartment_jobs_generator.dart';

import '../model/floor/floor.dart';
import '../model/project_constants.dart';
import '../model/project_variables.dart';

class ApartmentDetailsBloc
    extends Bloc<ApartmentDetailsEvent, ApartmentDetailsState> {
  ApartmentDetailsBloc()
      : super(
          ApartmentDetailsState(
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
              columnsLess1MeterPerimeter: 24.8, //✓
              elevationTowerArea: 27, //✓
              elevationTowerHeightWithoutSlab: 3, //✓
            ),
            floors: const [],
          ),
        ) {
    on<InitApartmentDetailsBloc>((event, emit) {
      final floors = Floor.selviliApt1Blok;
      emit(state.copyWith(floors: getSortedFloors(floors)));
    });
    on<AddFloor>((event, emit) {
      if(event.floor == null) {
        emit(state.copyWith(snackBarMessage: "Değişiklik yapılmadı"));
        return;
      }

      final floorValidationMessage = event.floor!.validate();
      if(floorValidationMessage.isNotEmpty) {
        emit(state.copyWith(snackBarMessage: floorValidationMessage));
        return;
      }

      List<Floor> floors = state.floors;

      floors.add(event.floor!);

      emit(state.copyWith(
        snackBarMessage: "${event.floor!.floorName} Eklendi.",
        floors: getSortedFloors(floors),
      ));
    });
    on<EditFloor>((event, emit) {
      if(event.floor == null) {
        emit(state.copyWith(snackBarMessage: "Değişiklik yapılmadı"));
        return;
      }

      final floorValidationMessage = event.floor!.validate();
      if(floorValidationMessage.isNotEmpty) {
        emit(state.copyWith(snackBarMessage: floorValidationMessage));
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
    on<ClearSnackBarMessage>((event, emit) {
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

