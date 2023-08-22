import 'package:equatable/equatable.dart';

import '../model/calculator/floor.dart';

abstract class QuantityDetailsEvent extends Equatable {
  const QuantityDetailsEvent();

  @override
  List<Object?> get props => [];
}

class AddFloor extends QuantityDetailsEvent {
  final Floor? floor;
  const AddFloor(this.floor);
  @override
  List<Object?> get props => [floor];
}

class DeleteFloor extends QuantityDetailsEvent {
  final Floor floor;
  const DeleteFloor(this.floor);
  @override
  List<Object?> get props => [floor];
}

class EditFloor extends QuantityDetailsEvent {
  final Floor? floor;
  const EditFloor(this.floor);
  @override
  List<Object?> get props => [floor];
}

class CalculateCost extends QuantityDetailsEvent {
  const CalculateCost();
  @override
  List<Object?> get props => [];
}

class ClearSnackbarMessage extends QuantityDetailsEvent {
  const ClearSnackbarMessage();
  @override
  List<Object?> get props => [];
}
