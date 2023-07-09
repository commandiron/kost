import '../model/category/category.dart';

abstract class QuantityCalculator {
  double? shoringArea;
  String get shoringAreaExplanation;

  double? excavationVolume;
  String get excavationVolumeExplanation;

  double? breakerHour;
  String get breakerHourExplanation;

  double?  foundationStabilizationVolume;
  String get foundationStabilizationVolumeExplanation;

  double? subFoundationConcreteVolume;
  String get subFoundationConcreteVolumeExplanation;

  double? concreteFormWorkArea;
  String get concreteFormWorkAreaExplanation;

  double? pouringConcreteVolume;
  String get pouringConcreteVolumeExplanation;

  double? rebarWeight;
  String get rebarWeightExplanation;

  double? hollowFloorFillingVolume;
  String get hollowFloorFillingVolumeExplanation;

  double? foundationWaterProofingArea;
  String get foundationWaterProofingAreaExplanation;

  double? curtainWaterProofingArea;
  String get curtainWaterProofingAreaExplanation;

  double? curtainProtectionBeforeFillingArea;
  String get curtainProtectionBeforeFillingAreaExplanation;

  double? wallMaterialVolume;
  String get wallMaterialVolumeExplanation;

  double? wallWorkmanShipArea;
  String get wallWorkmanShipAreaExplanation;

  double? roofingArea;
  String get roofingAreaExplanation;

  double? facadeScaffoldingArea;
  String get facadeScaffoldingAreaExplanation;

  double? windowsArea;
  String get windowAreaExplanation;

  double? facadeRailsLength;
  String get facadeRailsLengthExplanation;

  double? facadeSystemArea;
  String get facadeSystemAreaExplanation;

  double? interiorPlasteringArea;
  String get interiorPlasteringAreaExplanation;

  double? interiorPaintingArea;
  String get interiorPaintingAreaExplanation;

  double? interiorWaterproofingArea;
  String get interiorWaterproofingAreaExplanation;

  double? ceilingCoveringArea;
  String get ceilingCoveringAreaExplanation;

  double? covingPlasterArea;
  String get covingPlasterAreaExplanation;

  double? screedingArea;
  String get screedingAreaExplanation;

  double? marbleArea;
  String get marbleAreaExplanation;

  double? marbleStepLength;
  String get marbleStepLengthExplanation;

  double? marbleWindowsillLength;
  String get marbleWindowsillLengthExplanation;

  double? stairRailingsLength;
  String get stairRailingsLengthExplanation;

  double? ceramicTileArea;
  String get ceramicTileAreaExplanation;

  double? parquetTileArea;
  String get parquetTileAreaExplanation;

  double? steelDoorNumber;
  String get steelDoorNumberExplanation;

  double? entranceDoorArea;
  String get entranceDoorAreaExplanation;

  double? fireDoorNumber;
  String get fireDoorNumberExplanation;

  double? woodenDoorNumber;
  String get woodenDoorNumberExplanation;

  double? kitchenCupboardLength;
  String get kitchenCupboardLengthExplanation;

  double? kitchenCounterLength;
  String get kitchenCounterLengthExplanation;

  double? coatCabinetArea;
  String get coatCabinetAreaExplanation;

  double? bathroomCabinetArea;
  String get bathroomCabinetAreaExplanation;

  double? floorPlinthLength;
  String get floorPlinthLengthExplanation;

  double? mechanicalInfrastructureApartment;
  String get mechanicalInfrastructureApartmentExplanation;

  double? airConditionerNumber;
  String get airConditionerNumberExplanation;

  double? ventilationArea;
  String get ventilationAreaExplanation;

  double? elevationStop;
  String get elevationStopExplanation;

  double? sinkNumber;
  String get sinkNumberExplanation;

  double? sinkBatteryNumber;
  String get sinkBatteryNumberExplanation;

  double? concealedCisternNumber;
  String get concealedCisternNumberExplanation;

  double? showerNumber;
  String get showerNumberExplanation;

  double? showerBatteryNumber;
  String get showerBatteryNumberExplanation;

  double? kitchenFaucetAndSinkNumber;
  String get kitchenFaucetAndSinkNumberExplanation;

  double? electricalInfrastructureApartment;
  String get electricalInfrastructureApartmentExplanation;

  double? householdAppliancesApartment;
  String get householdAppliancesApartmentExplanation;

  double? landScapeGardenArea;
  String get landScapeGardenAreaExplanation;

  double? outdoorParkingTileArea;
  String get outdoorParkingTileAreaExplanation;

  double? carLiftStop;
  String get carLiftStopExplanation;

  double? automaticBarrierNumber;
  String get automaticBarrierNumberExplanation;

  double? enclosingTheLandLength;
  String get enclosingTheLandLengthExplanation;

  double? craneHour;
  String get craneHourExplanation;

  double? siteSafetyMonth;
  String get siteSafetyMonthExplanation;

  double? officeExpensesMonth;
  String get officeExpensesMonthExplanation;

  double? sergeantMonth;
  String get sergeantMonthExplanation;

  double? projectManagerMonth;
  String get projectManagerMonthExplanation;

  double? calculateQuantity(JobCategory jobCategory) {
    return switch (jobCategory) {
      JobCategory.shoring => shoringArea,
      JobCategory.excavation => excavationVolume,
      JobCategory.breaker => breakerHour,
      JobCategory.foundationStabilization => foundationStabilizationVolume,
      JobCategory.subFoundationConcrete => subFoundationConcreteVolume,
      JobCategory.concreteFormWork => concreteFormWorkArea,
      JobCategory.pouringConcrete => pouringConcreteVolume,
      JobCategory.rebar => rebarWeight,
      JobCategory.hollowFloorFilling => hollowFloorFillingVolume,
      JobCategory.foundationWaterproofing => foundationWaterProofingArea,
      JobCategory.curtainWaterproofing => curtainWaterProofingArea,
      JobCategory.curtainProtectionBeforeFilling => curtainProtectionBeforeFillingArea,
      JobCategory.wallMaterial => wallMaterialVolume,
      JobCategory.wallWorkmanShip => wallWorkmanShipArea,
      JobCategory.roofing => roofingArea,
      JobCategory.facadeScaffolding => facadeScaffoldingArea,
      JobCategory.windows => windowsArea,
      JobCategory.facadeRails => facadeRailsLength,
      JobCategory.facadeSystem => facadeSystemArea,
      JobCategory.interiorPlastering => interiorPlasteringArea,
      JobCategory.interiorPainting => interiorPaintingArea,
      JobCategory.interiorWaterproofing => interiorWaterproofingArea,
      JobCategory.ceilingCovering => ceilingCoveringArea,
      JobCategory.covingPlaster => covingPlasterArea,
      JobCategory.screeding => screedingArea,
      JobCategory.marble => marbleArea,
      JobCategory.marbleStep => marbleStepLength,
      JobCategory.marbleWindowsill => marbleWindowsillLength,
      JobCategory.stairRailings => stairRailingsLength,
      JobCategory.ceramicTile => ceramicTileArea,
      JobCategory.parquetTile => parquetTileArea,
      JobCategory.steelDoor => steelDoorNumber,
      JobCategory.entranceDoor => entranceDoorArea,
      JobCategory.fireDoor => fireDoorNumber,
      JobCategory.woodenDoor => woodenDoorNumber,
      JobCategory.kitchenCupboard => kitchenCupboardLength,
      JobCategory.kitchenCounter => kitchenCounterLength,
      JobCategory.coatCabinet => coatCabinetArea,
      JobCategory.bathroomCabinet => bathroomCabinetArea,
      JobCategory.floorPlinth => floorPlinthLength,
      JobCategory.mechanicalInfrastructure => mechanicalInfrastructureApartment,
      JobCategory.airConditioner => airConditionerNumber,
      JobCategory.ventilation => ventilationArea,
      JobCategory.waterTank => 1,
      JobCategory.elevation => elevationStop,
      JobCategory.sink => sinkNumber,
      JobCategory.sinkBattery => sinkBatteryNumber,
      JobCategory.concealedCistern => concealedCisternNumber,
      JobCategory.shower => showerNumber,
      JobCategory.showerBattery => showerBatteryNumber,
      JobCategory.kitchenFaucetAndSink => kitchenFaucetAndSinkNumber,
      JobCategory.electricalInfrastructure => electricalInfrastructureApartment,
      JobCategory.generator => 1,
      JobCategory.householdAppliances => householdAppliancesApartment,
      JobCategory.landScapeGarden => landScapeGardenArea,
      JobCategory.outdoorParkingTile => outdoorParkingTileArea,
      JobCategory.carLift => carLiftStop,
      JobCategory.automaticBarrier => automaticBarrierNumber,
      JobCategory.enclosingTheLand => enclosingTheLandLength,
      JobCategory.mobilizationDemobilization => 1,
      JobCategory.crane => craneHour,
      JobCategory.siteSafety => siteSafetyMonth,
      JobCategory.siteExpenses => officeExpensesMonth,
      JobCategory.sergeant => sergeantMonth,
      JobCategory.projectManager => projectManagerMonth,
      JobCategory.projectsFeesPayments => 1,
    };
  }

  String getQuantityExplanation(JobCategory jobCategory) {
    return switch (jobCategory) {
      JobCategory.shoring => shoringAreaExplanation,
      JobCategory.excavation => excavationVolumeExplanation,
      JobCategory.breaker => breakerHourExplanation,
      JobCategory.foundationStabilization => foundationStabilizationVolumeExplanation,
      JobCategory.subFoundationConcrete => subFoundationConcreteVolumeExplanation,
      JobCategory.concreteFormWork => concreteFormWorkAreaExplanation,
      JobCategory.pouringConcrete => pouringConcreteVolumeExplanation,
      JobCategory.rebar => rebarWeightExplanation,
      JobCategory.hollowFloorFilling => hollowFloorFillingVolumeExplanation,
      JobCategory.foundationWaterproofing => foundationWaterProofingAreaExplanation,
      JobCategory.curtainWaterproofing => curtainWaterProofingAreaExplanation,
      JobCategory.curtainProtectionBeforeFilling => curtainProtectionBeforeFillingAreaExplanation,
      JobCategory.wallMaterial => wallMaterialVolumeExplanation,
      JobCategory.wallWorkmanShip => wallWorkmanShipAreaExplanation,
      JobCategory.roofing => roofingAreaExplanation,
      JobCategory.facadeScaffolding => facadeScaffoldingAreaExplanation,
      JobCategory.windows => windowAreaExplanation,
      JobCategory.facadeRails => facadeRailsLengthExplanation,
      JobCategory.facadeSystem => facadeSystemAreaExplanation,
      JobCategory.interiorPlastering => interiorPlasteringAreaExplanation,
      JobCategory.interiorPainting => interiorPaintingAreaExplanation,
      JobCategory.interiorWaterproofing => interiorWaterproofingAreaExplanation,
      JobCategory.ceilingCovering => ceilingCoveringAreaExplanation,
      JobCategory.covingPlaster => covingPlasterAreaExplanation,
      JobCategory.screeding => screedingAreaExplanation,
      JobCategory.marble => marbleAreaExplanation,
      JobCategory.marbleStep => marbleStepLengthExplanation,
      JobCategory.marbleWindowsill => marbleWindowsillLengthExplanation,
      JobCategory.stairRailings => stairRailingsLengthExplanation,
      JobCategory.ceramicTile => ceramicTileAreaExplanation,
      JobCategory.parquetTile => parquetTileAreaExplanation,
      JobCategory.steelDoor => steelDoorNumberExplanation,
      JobCategory.entranceDoor => entranceDoorAreaExplanation,
      JobCategory.fireDoor => fireDoorNumberExplanation,
      JobCategory.woodenDoor => woodenDoorNumberExplanation,
      JobCategory.kitchenCupboard => kitchenCupboardLengthExplanation,
      JobCategory.kitchenCounter => kitchenCounterLengthExplanation,
      JobCategory.coatCabinet => coatCabinetAreaExplanation,
      JobCategory.bathroomCabinet => bathroomCabinetAreaExplanation,
      JobCategory.floorPlinth => floorPlinthLengthExplanation,
      JobCategory.mechanicalInfrastructure => mechanicalInfrastructureApartmentExplanation,
      JobCategory.airConditioner => airConditionerNumberExplanation,
      JobCategory.ventilation => ventilationAreaExplanation,
      JobCategory.waterTank => "Götürü bedel",
      JobCategory.elevation => elevationStopExplanation,
      JobCategory.sink => sinkNumberExplanation,
      JobCategory.sinkBattery => sinkBatteryNumberExplanation,
      JobCategory.concealedCistern => concealedCisternNumberExplanation,
      JobCategory.shower => showerNumberExplanation,
      JobCategory.showerBattery => showerBatteryNumberExplanation,
      JobCategory.kitchenFaucetAndSink => kitchenFaucetAndSinkNumberExplanation,
      JobCategory.electricalInfrastructure => electricalInfrastructureApartmentExplanation,
      JobCategory.generator => "Götürü bedel",
      JobCategory.householdAppliances => householdAppliancesApartmentExplanation,
      JobCategory.landScapeGarden => landScapeGardenAreaExplanation,
      JobCategory.outdoorParkingTile => outdoorParkingTileAreaExplanation,
      JobCategory.carLift => carLiftStopExplanation,
      JobCategory.automaticBarrier => automaticBarrierNumberExplanation,
      JobCategory.enclosingTheLand => enclosingTheLandLengthExplanation,
      JobCategory.mobilizationDemobilization => "Götürü bedel",
      JobCategory.crane => craneHourExplanation,
      JobCategory.siteSafety => siteSafetyMonthExplanation,
      JobCategory.siteExpenses => officeExpensesMonthExplanation,
      JobCategory.sergeant => sergeantMonthExplanation,
      JobCategory.projectManager => projectManagerMonthExplanation,
      JobCategory.projectsFeesPayments => "Götürü bedel",
    };
  }
}

class InitialQuantityCalculator extends QuantityCalculator {
  @override
  double get shoringArea => 0;
  @override
  String get shoringAreaExplanation => "";

  @override
  double get excavationVolume => 0;
  @override
  String get excavationVolumeExplanation => "";

  @override
  double get breakerHour => 0;
  @override
  String get breakerHourExplanation => "";

  @override
  double get foundationStabilizationVolume => 0;
  @override
  String get foundationStabilizationVolumeExplanation => "";

  @override
  double get subFoundationConcreteVolume => 0;
  @override
  String get subFoundationConcreteVolumeExplanation => "";

  @override
  double get concreteFormWorkArea => 0;
  @override
  String get concreteFormWorkAreaExplanation => "";

  @override
  double get pouringConcreteVolume => 0;
  @override
  String get pouringConcreteVolumeExplanation => "";

  @override
  double get rebarWeight => 0;
  @override
  String get rebarWeightExplanation => "";

  @override
  double get hollowFloorFillingVolume => 0;
  @override
  String get hollowFloorFillingVolumeExplanation => "";

  @override
  double get foundationWaterProofingArea => 0;
  @override
  String get foundationWaterProofingAreaExplanation => "";

  @override
  double get curtainWaterProofingArea => 0;
  @override
  String get curtainWaterProofingAreaExplanation => "";

  @override
  double get curtainProtectionBeforeFillingArea => 0;
  @override
  String get curtainProtectionBeforeFillingAreaExplanation => "";

  @override
  double get wallMaterialVolume => 0;
  @override
  String get wallMaterialVolumeExplanation => "";

  @override
  double get wallWorkmanShipArea => 0;
  @override
  String get wallWorkmanShipAreaExplanation => "";

  @override
  double get roofingArea => 0;
  @override
  String get roofingAreaExplanation => "";

  @override
  double get facadeScaffoldingArea => 0;
  @override
  String get facadeScaffoldingAreaExplanation => "";

  @override
  double get windowsArea => 0;
  @override
  String get windowAreaExplanation => "";

  @override
  double get facadeRailsLength => 0;
  @override
  String get facadeRailsLengthExplanation => "";

  @override
  double get facadeSystemArea => 0;
  @override
  String get facadeSystemAreaExplanation => "";

  @override
  double get interiorPlasteringArea => 0;
  @override
  String get interiorPlasteringAreaExplanation => "";

  @override
  double get interiorPaintingArea => 0;
  @override
  String get interiorPaintingAreaExplanation => "";

  @override
  double get interiorWaterproofingArea => 0;
  @override
  String get interiorWaterproofingAreaExplanation => "";
  
  @override
  double get ceilingCoveringArea => 0;
  @override
  String get ceilingCoveringAreaExplanation => "";

  @override
  double get covingPlasterArea => 0;
  @override
  String get covingPlasterAreaExplanation => "";

  @override
  double get screedingArea => 0;
  @override
  String get screedingAreaExplanation => "";

  @override
  double get marbleArea => 0;
  @override
  String get marbleAreaExplanation => "";

  @override
  double get marbleStepLength => 0;
  @override
  String get marbleStepLengthExplanation => "";

  @override
  double get marbleWindowsillLength => 0;
  @override
  String get marbleWindowsillLengthExplanation => "";

  @override

  double get stairRailingsLength => 0;
  @override
  String get stairRailingsLengthExplanation => "";

  @override
  double get ceramicTileArea => 0;
  @override
  String get ceramicTileAreaExplanation => "";

  @override
  double get parquetTileArea => 0;
  @override
  String get parquetTileAreaExplanation => "";

  @override
  double get steelDoorNumber => 0;
  @override
  String get steelDoorNumberExplanation => "";

  @override
  double get woodenDoorNumber => 0;
  @override
  String get woodenDoorNumberExplanation => "";

  @override
  double get entranceDoorArea => 0;
  @override
  String get entranceDoorAreaExplanation => "";

  @override
  double get fireDoorNumber => 0;
  @override
  String get fireDoorNumberExplanation => "";

  @override
  double get airConditionerNumber => 0;

  @override
  String get airConditionerNumberExplanation => "";

  @override
  double get bathroomCabinetArea => 0;
  @override
  String get bathroomCabinetAreaExplanation => "";

  @override
  double get coatCabinetArea => 0;
  @override
  String get coatCabinetAreaExplanation => "";

  @override
  double get concealedCisternNumber => 0;
  @override
  String get concealedCisternNumberExplanation => "";

  @override
  double get electricalInfrastructureApartment => 0;
  @override
  String get electricalInfrastructureApartmentExplanation => "";

  @override
  double get elevationStop => 0;
  @override
  String get elevationStopExplanation => "";

  @override
  double get floorPlinthLength => 0;
  @override
  String get floorPlinthLengthExplanation => "";

  @override
  double get householdAppliancesApartment => 0;
  @override
  String get householdAppliancesApartmentExplanation => "";

  @override
  double get kitchenCounterLength => 0;
  @override
  String get kitchenCounterLengthExplanation => "";

  @override
  double get kitchenCupboardLength => 0;
  @override
  String get kitchenCupboardLengthExplanation => "";

  @override
  double get kitchenFaucetAndSinkNumber => 0;
  @override
  String get kitchenFaucetAndSinkNumberExplanation => "";

  @override
  double get mechanicalInfrastructureApartment => 0;
  @override
  String get mechanicalInfrastructureApartmentExplanation => "";

  @override
  double get showerBatteryNumber => 0;
  @override
  String get showerBatteryNumberExplanation => "";

  @override
  double get showerNumber => 0;
  @override
  String get showerNumberExplanation => "";

  @override
  double get sinkBatteryNumber => 0;
  @override
  String get sinkBatteryNumberExplanation => "";

  @override
  double get sinkNumber => 0;
  @override
  String get sinkNumberExplanation => "";

  @override
  double get ventilationArea => 0;
  @override
  String get ventilationAreaExplanation => "";

  @override
  double get landScapeGardenArea => 0;
  @override
  String get landScapeGardenAreaExplanation => "";

  @override
  double get outdoorParkingTileArea => 0;
  @override
  String get outdoorParkingTileAreaExplanation => "";

  @override
  double get carLiftStop => 0;
  @override
  String get carLiftStopExplanation => "";

  @override
  double get automaticBarrierNumber => 0;
  @override
  String get automaticBarrierNumberExplanation => "";

  @override
  double get enclosingTheLandLength => 0;
  @override
  String get enclosingTheLandLengthExplanation => "";

  @override
  double get craneHour => 0;
  @override
  String get craneHourExplanation => "";

  @override
  double get siteSafetyMonth => 0;
  @override
  String get siteSafetyMonthExplanation => "";

  @override
  double get officeExpensesMonth => 0;
  @override
  String get officeExpensesMonthExplanation => "";

  @override
  double get sergeantMonth => 0;
  @override
  String get sergeantMonthExplanation => "";

  @override

  double get projectManagerMonth => 0;
  @override
  String get projectManagerMonthExplanation => "";
}