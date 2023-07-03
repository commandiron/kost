import '../model/category/category.dart';

abstract class QuantityCalculator {
  double get shoringArea;
  String get shoringAreaExplanation;

  double get excavationVolume;
  String get excavationVolumeExplanation;

  double get breakerHour;
  String get breakerHourExplanation;

  double get foundationStabilizationVolume;
  String get foundationStabilizationVolumeExplanation;

  double get subFoundationConcreteVolume;
  String get subFoundationConcreteVolumeExplanation;

  double get concreteFormWorkArea;
  String get concreteFormWorkAreaExplanation;

  double get pouringConcreteVolume;
  String get pouringConcreteVolumeExplanation;

  double get rebarWeight;
  String get rebarWeightExplanation;

  double get hollowFloorFillingVolume;
  String get hollowFloorFillingVolumeExplanation;

  double get foundationWaterProofingArea;
  String get foundationWaterProofingAreaExplanation;

  double get curtainWaterProofingArea;
  String get curtainWaterProofingAreaExplanation;

  double get curtainProtectionBeforeFillingArea;
  String get curtainProtectionBeforeFillingAreaExplanation;

  double get wallMaterialVolume;
  String get wallMaterialVolumeExplanation;

  double get wallWorkmanShipArea;
  String get wallWorkmanShipAreaExplanation;

  double get roofingArea;
  String get roofingAreaExplanation;

  double get facadeScaffoldingArea;
  String get facadeScaffoldingAreaExplanation;

  double get windowsArea;
  String get windowAreaExplanation;

  double get facadeRailsLength;
  String get facadeRailsLengthExplanation;

  double get facadeSystemArea;
  String get facadeSystemAreaExplanation;

  double get interiorPlasteringArea;
  String get interiorPlasteringAreaExplanation;

  double get interiorPaintingArea;
  String get interiorPaintingAreaExplanation;

  double get interiorWaterproofingArea;
  String get interiorWaterproofingAreaExplanation;

  double get ceilingCoveringArea;
  String get ceilingCoveringAreaExplanation;

  double get covingPlasterArea;
  String get covingPlasterAreaExplanation;

  double get screedingArea;
  String get screedingAreaExplanation;

  double get marbleArea;
  String get marbleAreaExplanation;

  double get marbleStepLength;
  String get marbleStepLengthExplanation;

  double get marbleWindowsillLength;
  String get marbleWindowsillLengthExplanation;

  double get stairRailingsLength;
  String get stairRailingsLengthExplanation;

  double get ceramicTileArea;
  String get ceramicTileAreaExplanation;

  double get parquetTileArea;
  String get parquetTileAreaExplanation;

  double get steelDoorNumber;
  String get steelDoorNumberExplanation;

  double get entranceDoorArea;
  String get entranceDoorAreaExplanation;

  double get fireDoorNumber;
  String get fireDoorNumberExplanation;

  double get woodenDoorNumber;
  String get woodenDoorNumberExplanation;

  double get kitchenCupboardLength;
  String get kitchenCupboardLengthExplanation;

  double get kitchenCounterLength;
  String get kitchenCounterLengthExplanation;

  double get coatCabinetArea;
  String get coatCabinetAreaExplanation;

  double get bathroomCabinetArea;
  String get bathroomCabinetAreaExplanation;

  double get floorPlinthLength;
  String get floorPlinthLengthExplanation;

  double get mechanicalInfrastructureApartment;
  String get mechanicalInfrastructureApartmentExplanation;

  double get airConditionerNumber;
  String get airConditionerNumberExplanation;

  double get ventilationArea;
  String get ventilationAreaExplanation;

  double get waterTankNumber;
  String get waterTankNumberExplanation;

  double get elevationNumber;
  String get elevationNumberExplanation;

  double get sinkNumber;
  String get sinkNumberExplanation;

  double get sinkBatteryNumber;
  String get sinkBatteryNumberExplanation;

  double get concealedCisternNumber;
  String get concealedCisternNumberExplanation;

  double get showerNumber;
  String get showerNumberExplanation;

  double get showerBatteryNumber;
  String get showerBatteryNumberExplanation;

  double get kitchenFaucetAndSinkNumber;
  String get kitchenFaucetAndSinkNumberExplanation;

  double get electricalInfrastructureApartment;
  String get electricalInfrastructureApartmentExplanation;

  double get generatorNumber;
  String get generatorNumberExplanation;

  double get householdAppliancesApartment;
  String get householdAppliancesApartmentExplanation;

  double get landScapeGardenArea;
  String get landScapeGardenAreaExplanation;

  double get outdoorParkingTileArea;
  String get outdoorParkingTileAreaExplanation;

  double get carLiftNumber;
  String get carLiftNumberExplanation;

  double get automaticBarrierNumber;
  String get automaticBarrierNumberExplanation;

  double getQuantityFromJobCategory(JobCategory jobCategory) {
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
      JobCategory.waterTank => waterTankNumber,
      JobCategory.elevation => elevationNumber,
      JobCategory.sink => sinkNumber,
      JobCategory.sinkBattery => sinkBatteryNumber,
      JobCategory.concealedCistern => concealedCisternNumber,
      JobCategory.shower => showerNumber,
      JobCategory.showerBattery => showerBatteryNumber,
      JobCategory.kitchenFaucetAndSink => kitchenFaucetAndSinkNumber,
      JobCategory.electricalInfrastructure => electricalInfrastructureApartment,
      JobCategory.generator => generatorNumber,
      JobCategory.householdAppliances => householdAppliancesApartment,
      JobCategory.landScapeGarden => landScapeGardenArea,
      JobCategory.outdoorParkingTile => outdoorParkingTileArea,
      JobCategory.carLift => carLiftNumber,
      JobCategory.automaticBarrier => automaticBarrierNumber,
    };
  }

  String getQuantityExplanationFromJobCategory(JobCategory jobCategory) {
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
      JobCategory.waterTank => waterTankNumberExplanation,
      JobCategory.elevation => elevationNumberExplanation,
      JobCategory.sink => sinkNumberExplanation,
      JobCategory.sinkBattery => sinkBatteryNumberExplanation,
      JobCategory.concealedCistern => concealedCisternNumberExplanation,
      JobCategory.shower => showerNumberExplanation,
      JobCategory.showerBattery => showerBatteryNumberExplanation,
      JobCategory.kitchenFaucetAndSink => kitchenFaucetAndSinkNumberExplanation,
      JobCategory.electricalInfrastructure => electricalInfrastructureApartmentExplanation,
      JobCategory.generator => generatorNumberExplanation,
      JobCategory.householdAppliances => householdAppliancesApartmentExplanation,
      JobCategory.landScapeGarden => landScapeGardenAreaExplanation,
      JobCategory.outdoorParkingTile => outdoorParkingTileAreaExplanation,
      JobCategory.carLift => carLiftNumberExplanation,
      JobCategory.automaticBarrier => automaticBarrierNumberExplanation,
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
  double get elevationNumber => 0;
  @override
  String get elevationNumberExplanation => "";

  @override
  double get floorPlinthLength => 0;
  @override
  String get floorPlinthLengthExplanation => "";

  @override
  double get generatorNumber => 0;
  @override
  String get generatorNumberExplanation => "";

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
  double get waterTankNumber => 0;
  @override
  String get waterTankNumberExplanation => "";

  @override
  double get landScapeGardenArea => 0;
  @override
  String get landScapeGardenAreaExplanation => "";

  @override
  double get outdoorParkingTileArea => 0;
  @override
  String get outdoorParkingTileAreaExplanation => "";

  @override
  double get carLiftNumber => 0;
  @override
  String get carLiftNumberExplanation => "";

  @override
  double get automaticBarrierNumber => 0;
  @override
  String get automaticBarrierNumberExplanation => "";
}
