import 'package:equatable/equatable.dart';

class ProjectVariables extends Equatable {
  final double landArea;
  final double landPerimeter;
  final double foundationArea;
  final double foundationPerimeter;
  final double foundationHeight;
  final double excavationArea;
  final double excavationPerimeter;
  final double coreCurtainLength;
  final double curtainsExceeding1MeterLength;
  final double basementCurtainLength;
  final double columnsLess1MeterPerimeter;
  final double elevationTowerArea;
  final double elevationTowerHeightWithoutSlab;

  const ProjectVariables({
    this.landArea = 0,
    this.landPerimeter = 0,
    this.foundationArea = 0,
    this.foundationPerimeter = 0,
    this.foundationHeight = 0,
    this.excavationArea = 0,
    this.excavationPerimeter = 0,
    this.coreCurtainLength = 0,
    this.curtainsExceeding1MeterLength = 0,
    this.basementCurtainLength = 0,
    this.columnsLess1MeterPerimeter = 0,
    this.elevationTowerArea = 0,
    this.elevationTowerHeightWithoutSlab = 0,
  });

  @override
  List<Object?> get props => [
    landArea,
    landPerimeter,
    foundationArea,
    foundationPerimeter,
    foundationHeight,
    excavationArea,
    excavationPerimeter,
    coreCurtainLength,
    curtainsExceeding1MeterLength,
    basementCurtainLength,
    columnsLess1MeterPerimeter,
    elevationTowerArea,
    elevationTowerHeightWithoutSlab,
  ];
}