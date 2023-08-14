import 'detailed/floor.dart';
import 'detailed/project_constants.dart';

abstract class QuantityCalculator {
  final ProjectConstants projectConstants;
  final double landArea;
  final double landPerimeter;
  final double excavationArea;
  final double excavationPerimeter;
  final double coreCurtainLength;
  final double curtainsExceeding1MeterLength;
  final double basementCurtainLength;
  final double columnsLess1MeterPerimeter;
  final double elevationTowerArea;
  final double elevationTowerHeightWithoutSlab;
  List<Floor> floors;
  final double foundationArea;
  final double foundationPerimeter;
  final double foundationHeight;

  QuantityCalculator({
    required this.projectConstants,
    required this.landArea,
    required this.landPerimeter,
    required this.excavationArea,
    required this.excavationPerimeter,
    required this.coreCurtainLength,
    required this.curtainsExceeding1MeterLength,
    required this.basementCurtainLength,
    required this.columnsLess1MeterPerimeter,
    required this.elevationTowerArea,
    required this.elevationTowerHeightWithoutSlab,
    required this.floors,
    required this.foundationArea,
    required this.foundationPerimeter,
    required this.foundationHeight,
  });

  double get calculatedShoringArea;
  double? shoringArea;
  String get shoringAreaExplanation;

  double get calculatedExcavationVolume;
  double? excavationVolume;
  String get excavationVolumeExplanation;

  double get calculatedBreakerHour;
  double? breakerHour;
  String get breakerHourExplanation;

  double get calculatedFoundationStabilizationVolume;
  double? foundationStabilizationWeight;
  String get foundationStabilizationWeightExplanation;

  double get calculatedSubFoundationConcreteVolume;
  double? subFoundationConcreteVolume;
  String get subFoundationConcreteVolumeExplanation;

  double get calculatedConcreteFormWorkArea;
  double? concreteFormWorkArea;
  String get concreteFormWorkAreaExplanation;

  double get calculatedPouringConcreteVolume;
  double? pouringConcreteVolume;
  String get pouringConcreteVolumeExplanation;

  double get calculatedRebarWeight;
  double? rebarWeight;
  String get rebarWeightExplanation;

  double get calculatedHollowFloorFillingVolume;
  double? hollowFloorFillingVolume;
  String get hollowFloorFillingVolumeExplanation;

  double get calculatedFoundationWaterProofingArea;
  double? foundationWaterProofingArea;
  String get foundationWaterProofingAreaExplanation;

  double get calculatedCurtainWaterProofingArea;
  double? curtainWaterProofingArea;
  String get curtainWaterProofingAreaExplanation;

  double get calculatedCurtainProtectionBeforeFillingArea;
  double? curtainProtectionBeforeFillingArea;
  String get curtainProtectionBeforeFillingAreaExplanation;

  double get calculatedWallMaterialVolume;
  double? wallMaterialVolume;
  String get wallMaterialVolumeExplanation;

  double get calculatedWallWorkmanShipArea;
  double? wallWorkmanShipArea;
  String get wallWorkmanShipAreaExplanation;

  double get calculatedRoofingArea;
  double? roofingArea;
  String get roofingAreaExplanation;

  double get calculatedFacadeScaffoldingArea;
  double? facadeScaffoldingArea;
  String get facadeScaffoldingAreaExplanation;

  double get calculatedWindowsArea;
  double? windowsArea;
  String get windowAreaExplanation;

  double get calculatedFacadeRailsLength;
  double? facadeRailsLength;
  String get facadeRailsLengthExplanation;

  double get calculatedFacadeSystemArea;
  double? facadeSystemArea;
  String get facadeSystemAreaExplanation;

  double get calculatedInteriorPlasteringArea;
  double? interiorPlasteringArea;
  String get interiorPlasteringAreaExplanation;

  double get calculatedInteriorPaintingArea;
  double? interiorPaintingArea;
  String get interiorPaintingAreaExplanation;

  double get calculatedInteriorWaterproofingArea;
  double? interiorWaterproofingArea;
  String get interiorWaterproofingAreaExplanation;

  double get calculatedCeilingCoveringArea;
  double? ceilingCoveringArea;
  String get ceilingCoveringAreaExplanation;

  double get calculatedCovingPlasterArea;
  double? covingPlasterArea;
  String get covingPlasterAreaExplanation;

  double get calculatedScreedingArea;
  double? screedingArea;
  String get screedingAreaExplanation;

  double get calculatedMarbleArea;
  double? marbleArea;
  String get marbleAreaExplanation;

  double get calculatedMarbleStepLength;
  double? marbleStepLength;
  String get marbleStepLengthExplanation;

  double get calculatedMarbleWindowsillLength;
  double? marbleWindowsillLength;
  String get marbleWindowsillLengthExplanation;

  double get calculatedStairRailingsLength;
  double? stairRailingsLength;
  String get stairRailingsLengthExplanation;

  double get calculatedCeramicTileArea;
  double? ceramicTileArea;
  String get ceramicTileAreaExplanation;

  double get calculatedParquetTileArea;
  double? parquetTileArea;
  String get parquetTileAreaExplanation;

  double get calculatedSteelDoorNumber;
  double? steelDoorNumber;
  String get steelDoorNumberExplanation;

  double get calculatedEntranceDoorArea;
  double? entranceDoorArea;
  String get entranceDoorAreaExplanation;

  double get calculatedFireDoorNumber;
  double? fireDoorNumber;
  String get fireDoorNumberExplanation;

  double get calculatedWoodenDoorNumber;
  double? woodenDoorNumber;
  String get woodenDoorNumberExplanation;

  double get calculatedKitchenCupboardLength;
  double? kitchenCupboardLength;
  String get kitchenCupboardLengthExplanation;

  double get calculatedKitchenCounterLength;
  double? kitchenCounterLength;
  String get kitchenCounterLengthExplanation;

  double get calculatedCoatCabinetArea;
  double? coatCabinetArea;
  String get coatCabinetAreaExplanation;

  double get calculatedBathroomCabinetArea;
  double? bathroomCabinetArea;
  String get bathroomCabinetAreaExplanation;

  double get calculatedFloorPlinthLength;
  double? floorPlinthLength;
  String get floorPlinthLengthExplanation;

  double get calculatedMechanicalInfrastructureApartment;
  double? mechanicalInfrastructureApartment;
  String get mechanicalInfrastructureApartmentExplanation;

  double get calculatedAirConditionerNumber;
  double? airConditionerNumber;
  String get airConditionerNumberExplanation;

  double get calculatedVentilationArea;
  double? ventilationArea;
  String get ventilationAreaExplanation;

  double get calculatedElevationStop;
  double? elevationStop;
  String get elevationStopExplanation;

  double get calculatedSinkNumber;
  double? sinkNumber;
  String get sinkNumberExplanation;

  double get calculatedSinkBatteryNumber;
  double? sinkBatteryNumber;
  String get sinkBatteryNumberExplanation;

  double get calculatedConcealedCisternNumber;
  double? concealedCisternNumber;
  String get concealedCisternNumberExplanation;

  double get calculatedShowerNumber;
  double? showerNumber;
  String get showerNumberExplanation;

  double get calculatedShowerBatteryNumber;
  double? showerBatteryNumber;
  String get showerBatteryNumberExplanation;

  double get calculatedKitchenFaucetAndSinkNumber;
  double? kitchenFaucetAndSinkNumber;
  String get kitchenFaucetAndSinkNumberExplanation;

  double get calculatedElectricalInfrastructureApartment;
  double? electricalInfrastructureApartment;
  String get electricalInfrastructureApartmentExplanation;

  double get calculatedHouseholdAppliancesApartment;
  double? householdAppliancesApartment;
  String get householdAppliancesApartmentExplanation;

  double get calculatedLandScapeGardenArea;
  double? landScapeGardenArea;
  String get landScapeGardenAreaExplanation;

  double get calculatedOutdoorParkingTileArea;
  double? outdoorParkingTileArea;
  String get outdoorParkingTileAreaExplanation;

  double get calculatedCarLiftStop;
  double? carLiftStop;
  String get carLiftStopExplanation;

  double get calculatedAutomaticBarrierNumber;
  double? automaticBarrierNumber;
  String get automaticBarrierNumberExplanation;

  double get calculatedEnclosingTheLandLength;
  double? enclosingTheLandLength;
  String get enclosingTheLandLengthExplanation;

  double get calculatedCraneHour;
  double? craneHour;
  String get craneHourExplanation;

  double get calculatedSiteSafetyMonth;
  double? siteSafetyMonth;
  String get siteSafetyMonthExplanation;

  double get calculatedOfficeExpensesMonth;
  double? officeExpensesMonth;
  String get officeExpensesMonthExplanation;

  double get calculatedSergeantMonth;
  double? sergeantMonth;
  String get sergeantMonthExplanation;

  double get calculatedProjectManagerMonth;
  double? projectManagerMonth;
  String get projectManagerMonthExplanation;
}

class InitialQuantityCalculator extends QuantityCalculator {
  InitialQuantityCalculator({
    required super.projectConstants,
    super.landArea = 0,
    super.landPerimeter = 0,
    super.excavationArea = 0,
    super.excavationPerimeter = 0,
    super.coreCurtainLength = 0,
    super.curtainsExceeding1MeterLength = 0,
    super.basementCurtainLength = 0,
    super.columnsLess1MeterPerimeter = 0,
    super.elevationTowerArea = 0,
    super.elevationTowerHeightWithoutSlab = 0,
    super.floors = const [],
    super.foundationArea = 0,
    super.foundationPerimeter = 0,
    super.foundationHeight = 1,
  });

  @override
  double get calculatedShoringArea => 0;
  @override
  String get shoringAreaExplanation => "";

  @override
  double get calculatedExcavationVolume => 0;
  @override
  String get excavationVolumeExplanation => "";

  @override
  double get calculatedBreakerHour => 0;
  @override
  String get breakerHourExplanation => "";

  @override
  double get calculatedFoundationStabilizationVolume => 0;
  @override
  String get foundationStabilizationWeightExplanation => "";

  @override
  double get calculatedSubFoundationConcreteVolume => 0;
  @override
  String get subFoundationConcreteVolumeExplanation => "";

  @override
  double get calculatedConcreteFormWorkArea => 0;
  @override
  String get concreteFormWorkAreaExplanation => "";

  @override
  double get calculatedPouringConcreteVolume => 0;
  @override
  String get pouringConcreteVolumeExplanation => "";

  @override
  double get calculatedRebarWeight => 0;
  @override
  String get rebarWeightExplanation => "";

  @override
  double get calculatedHollowFloorFillingVolume => 0;
  @override
  String get hollowFloorFillingVolumeExplanation => "";

  @override
  double get calculatedFoundationWaterProofingArea => 0;
  @override
  String get foundationWaterProofingAreaExplanation => "";

  @override
  double get calculatedCurtainWaterProofingArea => 0;
  @override
  String get curtainWaterProofingAreaExplanation => "";

  @override
  double get calculatedCurtainProtectionBeforeFillingArea => 0;
  @override
  String get curtainProtectionBeforeFillingAreaExplanation => "";

  @override
  double get calculatedWallMaterialVolume => 0;
  @override
  String get wallMaterialVolumeExplanation => "";

  @override
  double get calculatedWallWorkmanShipArea => 0;
  @override
  String get wallWorkmanShipAreaExplanation => "";

  @override
  double get calculatedRoofingArea => 0;
  @override
  String get roofingAreaExplanation => "";

  @override
  double get calculatedFacadeScaffoldingArea => 0;
  @override
  String get facadeScaffoldingAreaExplanation => "";

  @override
  double get calculatedWindowsArea => 0;
  @override
  String get windowAreaExplanation => "";

  @override
  double get calculatedFacadeRailsLength => 0;
  @override
  String get facadeRailsLengthExplanation => "";

  @override
  double get calculatedFacadeSystemArea => 0;
  @override
  String get facadeSystemAreaExplanation => "";

  @override
  double get calculatedInteriorPlasteringArea => 0;
  @override
  String get interiorPlasteringAreaExplanation => "";

  @override
  double get calculatedInteriorPaintingArea => 0;
  @override
  String get interiorPaintingAreaExplanation => "";

  @override
  double get calculatedInteriorWaterproofingArea => 0;
  @override
  String get interiorWaterproofingAreaExplanation => "";

  @override
  double get calculatedCeilingCoveringArea => 0;
  @override
  String get ceilingCoveringAreaExplanation => "";

  @override
  double get calculatedCovingPlasterArea => 0;
  @override
  String get covingPlasterAreaExplanation => "";

  @override
  double get calculatedScreedingArea => 0;
  @override
  String get screedingAreaExplanation => "";

  @override
  double get calculatedMarbleArea => 0;
  @override
  String get marbleAreaExplanation => "";

  @override
  double get calculatedMarbleStepLength => 0;
  @override
  String get marbleStepLengthExplanation => "";

  @override
  double get calculatedMarbleWindowsillLength => 0;
  @override
  String get marbleWindowsillLengthExplanation => "";

  @override
  double get calculatedStairRailingsLength => 0;
  @override
  String get stairRailingsLengthExplanation => "";

  @override
  double get calculatedCeramicTileArea => 0;
  @override
  String get ceramicTileAreaExplanation => "";

  @override
  double get calculatedParquetTileArea => 0;
  @override
  String get parquetTileAreaExplanation => "";

  @override
  double get calculatedSteelDoorNumber => 0;
  @override
  String get steelDoorNumberExplanation => "";

  @override
  double get calculatedWoodenDoorNumber => 0;
  @override
  String get woodenDoorNumberExplanation => "";

  @override
  double get calculatedEntranceDoorArea => 0;
  @override
  String get entranceDoorAreaExplanation => "";

  @override
  double get calculatedFireDoorNumber => 0;
  @override
  String get fireDoorNumberExplanation => "";

  @override
  double get calculatedAirConditionerNumber => 0;

  @override
  String get airConditionerNumberExplanation => "";

  @override
  double get calculatedBathroomCabinetArea => 0;
  @override
  String get bathroomCabinetAreaExplanation => "";

  @override
  double get calculatedCoatCabinetArea => 0;
  @override
  String get coatCabinetAreaExplanation => "";

  @override
  double get calculatedConcealedCisternNumber => 0;
  @override
  String get concealedCisternNumberExplanation => "";

  @override
  double get calculatedElectricalInfrastructureApartment => 0;
  @override
  String get electricalInfrastructureApartmentExplanation => "";

  @override
  double get calculatedElevationStop => 0;
  @override
  String get elevationStopExplanation => "";

  @override
  double get calculatedFloorPlinthLength => 0;
  @override
  String get floorPlinthLengthExplanation => "";

  @override
  double get calculatedHouseholdAppliancesApartment => 0;
  @override
  String get householdAppliancesApartmentExplanation => "";

  @override
  double get calculatedKitchenCounterLength => 0;
  @override
  String get kitchenCounterLengthExplanation => "";

  @override
  double get calculatedKitchenCupboardLength => 0;
  @override
  String get kitchenCupboardLengthExplanation => "";

  @override
  double get calculatedKitchenFaucetAndSinkNumber => 0;
  @override
  String get kitchenFaucetAndSinkNumberExplanation => "";

  @override
  double get calculatedMechanicalInfrastructureApartment => 0;
  @override
  String get mechanicalInfrastructureApartmentExplanation => "";

  @override
  double get calculatedShowerBatteryNumber => 0;
  @override
  String get showerBatteryNumberExplanation => "";

  @override
  double get calculatedShowerNumber => 0;
  @override
  String get showerNumberExplanation => "";

  @override
  double get calculatedSinkBatteryNumber => 0;
  @override
  String get sinkBatteryNumberExplanation => "";

  @override
  double get calculatedSinkNumber => 0;
  @override
  String get sinkNumberExplanation => "";

  @override
  double get calculatedVentilationArea => 0;
  @override
  String get ventilationAreaExplanation => "";

  @override
  double get calculatedLandScapeGardenArea => 0;
  @override
  String get landScapeGardenAreaExplanation => "";

  @override
  double get calculatedOutdoorParkingTileArea => 0;
  @override
  String get outdoorParkingTileAreaExplanation => "";

  @override
  double get calculatedCarLiftStop => 0;
  @override
  String get carLiftStopExplanation => "";

  @override
  double get calculatedAutomaticBarrierNumber => 0;
  @override
  String get automaticBarrierNumberExplanation => "";

  @override
  double get calculatedEnclosingTheLandLength => 0;
  @override
  String get enclosingTheLandLengthExplanation => "";

  @override
  double get calculatedCraneHour => 0;
  @override
  String get craneHourExplanation => "";

  @override
  double get calculatedSiteSafetyMonth => 0;
  @override
  String get siteSafetyMonthExplanation => "";

  @override
  double get calculatedOfficeExpensesMonth => 0;
  @override
  String get officeExpensesMonthExplanation => "";

  @override
  double get calculatedSergeantMonth => 0;
  @override
  String get sergeantMonthExplanation => "";

  @override
  double get calculatedProjectManagerMonth => 0;
  @override
  String get projectManagerMonthExplanation => "";
}
