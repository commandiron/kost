import 'package:equatable/equatable.dart';

import '../model/floor/floor.dart';

abstract class ApartmentDetailsEvent extends Equatable {
  const ApartmentDetailsEvent();
  @override
  List<Object?> get props => [];
}

class InitApartmentDetailsBloc extends ApartmentDetailsEvent {
  const InitApartmentDetailsBloc();
  @override
  List<Object?> get props => [];
}

class AddFloor extends ApartmentDetailsEvent {
  final Floor? floor;
  const AddFloor(this.floor);
  @override
  List<Object?> get props => [floor];
}

class EditFloor extends ApartmentDetailsEvent {
  final Floor? floor;
  const EditFloor(this.floor);
  @override
  List<Object?> get props => [floor];
}

class DeleteFloor extends ApartmentDetailsEvent {
  final Floor floor;
  const DeleteFloor(this.floor);
  @override
  List<Object?> get props => [floor];
}

class ClearSnackBarMessage extends ApartmentDetailsEvent {
  const ClearSnackBarMessage();
  @override
  List<Object?> get props => [];
}

class CalculateCost extends ApartmentDetailsEvent {
  const CalculateCost();
  @override
  List<Object?> get props => [];
}