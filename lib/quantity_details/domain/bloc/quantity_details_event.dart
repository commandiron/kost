import 'package:equatable/equatable.dart';

abstract class QuantityDetailsEvent extends Equatable {
  const QuantityDetailsEvent();

  @override
  List<Object?> get props => [];
}

class FloorAreaChanged extends QuantityDetailsEvent {
  final String floorAreaText;
  final int no;
  const FloorAreaChanged(this.floorAreaText, this.no);
  @override
  List<Object?> get props => [floorAreaText, no];
}

class FloorDelete extends QuantityDetailsEvent {
  final int no;
  const FloorDelete(this.no);
  @override
  List<Object?> get props => [no];
}

class CalculateCost extends QuantityDetailsEvent {
  const CalculateCost();
  @override
  List<Object?> get props => [];
}