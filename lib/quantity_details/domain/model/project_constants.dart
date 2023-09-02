import 'package:equatable/equatable.dart';

class ProjectConstants extends Equatable {
  final double projectDurationMonth;
  final double foundationHeight;
  final double insulationConcreteHeight;
  final double leanConcreteHeight;
  final double stabilizationHeight;
  final double hollowFillingThickness;
  final ExcavationAreaRockDensityConstant excavationAreaRockDensityConstant;
  final double gravelTonForOneCubicMeter;
  final double concreteCubicMeterForOneSquareMeterFormWork;
  final double rebarTonForOneCubicMeterConcrete;
  final double hollowAreaForOneSquareMeterConstructionArea;
  final double thickWallThickness;
  final double thinWallThickness;
  final double stairRiserHeight;
  final double stairTreadDepth;
  final double stairLength;
  final double buildingEntranceDoorArea;
  final int airConditionerNumberForOneApartment;
  final double bathroomCabinetArea;
  final double kitchenLength;
  final double coatCabinetArea;
  final double gardenOutdoorParkingAreaRate;
  final int automaticBarrierNumber;
  final double craneHourForOneSquareMeterRoughConstructionArea;

  const ProjectConstants({
    this.projectDurationMonth = 14,
    this.foundationHeight = 1,
    this.insulationConcreteHeight = 0.05,
    this.leanConcreteHeight = 0.10,
    this.stabilizationHeight = 0.30,
    this.hollowFillingThickness = 0.2,
    this.excavationAreaRockDensityConstant = ExcavationAreaRockDensityConstant.medium,
    this.gravelTonForOneCubicMeter = 1.8,
    this.concreteCubicMeterForOneSquareMeterFormWork = 0.35,
    this.rebarTonForOneCubicMeterConcrete = 0.16,
    this.hollowAreaForOneSquareMeterConstructionArea = 0.40,
    this.thickWallThickness = 0.135,
    this.thinWallThickness = 0.085,
    this.stairRiserHeight = 0.18,
    this.stairTreadDepth = 0.26,
    this.stairLength = 1,
    this.buildingEntranceDoorArea = 6,
    this.airConditionerNumberForOneApartment = 2,
    this.bathroomCabinetArea = 1,
    this.kitchenLength = 5,
    this.coatCabinetArea = 5,
    this.gardenOutdoorParkingAreaRate = 0.50,
    this.automaticBarrierNumber = 1,
    this.craneHourForOneSquareMeterRoughConstructionArea = 0.02,
  });

  @override
  List<Object?> get props => [
    projectDurationMonth,
    foundationHeight,
    insulationConcreteHeight,
    leanConcreteHeight,
    stabilizationHeight,
    hollowFillingThickness,
    excavationAreaRockDensityConstant,
    gravelTonForOneCubicMeter,
    concreteCubicMeterForOneSquareMeterFormWork,
    rebarTonForOneCubicMeterConcrete,
    hollowAreaForOneSquareMeterConstructionArea,
    thickWallThickness,
    thinWallThickness,
    stairRiserHeight,
    stairTreadDepth,
    stairLength,
    buildingEntranceDoorArea,
    airConditionerNumberForOneApartment,
    bathroomCabinetArea,
    kitchenLength,
    coatCabinetArea,
    gardenOutdoorParkingAreaRate,
    automaticBarrierNumber,
    craneHourForOneSquareMeterRoughConstructionArea,
  ];
}

enum ExcavationAreaRockDensityConstant {
  zero(0.0),
  low(0.02),
  medium(0.0436),
  hard(0.08);
  const ExcavationAreaRockDensityConstant(this.breakerHourForOneCubicMeterExcavation);
  final double breakerHourForOneCubicMeterExcavation;
}
