import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/apartment_details/domain/model/project.dart';
import 'package:kost/common/bloc/bloc_state.dart';
import 'package:kost/cost_table/presentation/cost_table_screen.dart';
import 'package:kost/apartment_details/domain/bloc/apartment_details_event.dart';
import 'package:kost/apartment_details/domain/bloc/apartment_details_state.dart';
import 'package:kost/apartment_details/domain/model/jobs_generator/impl/apartment_jobs_generator.dart';

import '../model/floor/floor.dart';

class ApartmentDetailsBloc
    extends Bloc<ApartmentDetailsEvent, ApartmentDetailsState> {
  ApartmentDetailsBloc()
    : super(
      ApartmentDetailsState(
        blocState: Initial(),
        snackBarMessage: "",
        project: Project.selviliApt1Blok,
      ),
    ) {
    on<InitApartmentDetailsBloc>((event, emit) {

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

      List<Floor> floors = state.project.floors;

      floors.add(event.floor!);

      emit(state.copyWith(
        snackBarMessage: "${event.floor!.floorName} Eklendi.",
        project: state.project.copyWith(floors: floors),
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

      final floors = state.project.floors;

      final floorIndex =
      floors.indexWhere((element) => element.no == event.floor!.no);

      floors[floorIndex] = event.floor!;

      emit(state.copyWith(
        snackBarMessage: "${event.floor!.floorName} Değiştirildi.",
        project: state.project.copyWith(floors: floors),
      ));
    });
    on<DeleteFloor>((event, emit) {
      final basementFloorsCount =
          state.project.floors.where((element) => element.no < 0).length;
      if (event.floor.no == -1 && basementFloorsCount == 1) {
        emit(state.copyWith(snackBarMessage: "İlk bodrum kat silinemez"));
        return;
      }
      if (event.floor.no == 0) {
        emit(state.copyWith(snackBarMessage: "Zemin kat silinemez"));
        return;
      }

      final floors = state.project.floors;

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
        project: state.project.copyWith(floors: floors),
      ));
    });
    on<ClearSnackBarMessage>((event, emit) {
      emit(state.copyWith(snackBarMessage: ""));
    });
    on<CalculateCost>((event, emit) {
      final apartmentJobsGenerator = ApartmentJobsGenerator(
        projectConstants: state.project.projectConstants,
        projectVariables: state.project.projectVariables,
        floors: state.project.floors,
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
}

