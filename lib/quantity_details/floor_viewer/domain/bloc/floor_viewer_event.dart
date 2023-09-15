import 'package:equatable/equatable.dart';

import '../model/floor/floor.dart';

abstract class FloorViewerEvent extends Equatable {
  const FloorViewerEvent();
  @override
  List<Object?> get props => [];
}

class InitFloorViewerBloc extends FloorViewerEvent {
  const InitFloorViewerBloc();
  @override
  List<Object?> get props => [];
}

class AddFloor extends FloorViewerEvent {
  final Floor? floor;
  const AddFloor(this.floor);
  @override
  List<Object?> get props => [floor];
}

class DeleteFloor extends FloorViewerEvent {
  final Floor floor;
  const DeleteFloor(this.floor);
  @override
  List<Object?> get props => [floor];
}

class EditFloor extends FloorViewerEvent {
  final Floor? floor;
  const EditFloor(this.floor);
  @override
  List<Object?> get props => [floor];
}

class ClearSnackbarMessage extends FloorViewerEvent {
  const ClearSnackbarMessage();
  @override
  List<Object?> get props => [];
}

class CalculateCost extends FloorViewerEvent {
  const CalculateCost();
  @override
  List<Object?> get props => [];
}