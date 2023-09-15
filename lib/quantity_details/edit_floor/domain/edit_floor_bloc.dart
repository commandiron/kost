import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kost/quantity_details/floor_viewer/domain/model/floor/floor.dart';
import 'package:kost/quantity_details/edit_floor/domain/edit_floor_state.dart';

import 'edit_floor_event.dart';

class EditFloorBloc extends Bloc<EditFloorEvent, EditFloorState> {
  EditFloorBloc()
    : super(
      EditFloorState(floor: InitialFloor()),
    )
  {
    on<InitEditFloorBloc>((event, emit) async {
      emit(state.copyWith(floor: event.floor));
    });
  }
}