import 'package:equatable/equatable.dart';

import '../model/calculator/floor.dart';

abstract class QuantityDetailsEvent extends Equatable {
  const QuantityDetailsEvent();

  @override
  List<Object?> get props => [];
}

class FloorAdd extends QuantityDetailsEvent {
  const FloorAdd();
  @override
  List<Object?> get props => [];
}

class FloorDelete extends QuantityDetailsEvent {
  final Floor floor;
  const FloorDelete(this.floor);
  @override
  List<Object?> get props => [floor];
}

class FloorAreaChanged extends QuantityDetailsEvent {
  final String floorAreaText;
  final int no;
  const FloorAreaChanged(this.floorAreaText, this.no);
  @override
  List<Object?> get props => [floorAreaText, no];
}

class CalculateCost extends QuantityDetailsEvent {
  const CalculateCost();
  @override
  List<Object?> get props => [];
}