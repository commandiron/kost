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
          landArea: 1500, //✓
          landPerimeter: 80, //✓
          foundationArea: 377, //✓
          foundationPerimeter: 78.3, //✓
          foundationHeight: 1, //✓
          excavationArea: 465, //✓
          excavationPerimeter: 86.3, //✓
          coreCurtainLength: 15, //✓
          curtainsExceeding1MeterLength: 10, //✓
          basementCurtainLength: 0, //✓
          columnsLess1MeterPerimeter: 16, //✓
          elevationTowerArea: 17.5, //✓
          elevationTowerHeightWithoutSlab: 3, //✓
        ),
        floors: Floor.selviliApt1Blok,
      ),
    ) {
    on<InitApartmentDetailsBloc>((event, emit) {
      emit(state.copyWith(floors: getSortedFloors(state.floors)));
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

