import 'package:equatable/equatable.dart';

import '../../floor_viewer/domain/model/floor/floor.dart';

abstract class EditFloorEvent extends Equatable {
  const EditFloorEvent();
  @override
  List<Object?> get props => [];
}

class InitEditFloorBloc extends EditFloorEvent {
  final Floor? floor;
  const InitEditFloorBloc(this.floor);
  @override
  List<Object?> get props => [floor];
}