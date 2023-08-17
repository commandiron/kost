import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
  final BuildContext context;
  const CalculateCost(this.context);
  @override
  List<Object?> get props => [context];
}