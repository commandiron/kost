import '../model/category/category.dart';

abstract class QuantityCalculator {

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
  double? foundationStabilizationVolume;
  String get foundationStabilizationVolumeExplanation;

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

  setQuantityManually(JobCategory jobCategory, double quantity) {
    switch (jobCategory) {
      case JobCategory.shoring : shoringArea = quantity;
      case JobCategory.excavation : excavationVolume = quantity;
      case JobCategory.breaker : breakerHour = quantity;
      case JobCategory.foundationStabilization : foundationStabilizationVolume = quantity;
      case JobCategory.subFoundationConcrete : subFoundationConcreteVolume = quantity;
      case JobCategory.concreteFormWork : concreteFormWorkArea = quantity;
      case JobCategory.pouringConcrete : pouringConcreteVolume = quantity;
      case JobCategory.rebar : rebarWeight = quantity;
      case JobCategory.hollowFloorFilling : hollowFloorFillingVolume = quantity;
      case JobCategory.foundationWaterproofing : foundationWaterProofingArea = quantity;
      case JobCategory.curtainWaterproofing : curtainWaterProofingArea = quantity;
      case JobCategory.curtainProtectionBeforeFilling : curtainProtectionBeforeFillingArea = quantity;
      case JobCategory.wallMaterial : wallMaterialVolume = quantity;
      case JobCategory.wallWorkmanShip : wallWorkmanShipArea = quantity;
      case JobCategory.roofing : roofingArea = quantity;
      case JobCategory.facadeScaffolding : facadeScaffoldingArea = quantity;
      case JobCategory.windows : windowsArea = quantity;
      case JobCategory.facadeRails : facadeRailsLength = quantity;
      case JobCategory.facadeSystem : facadeSystemArea = quantity;
      case JobCategory.interiorPlastering : interiorPlasteringArea = quantity;
      case JobCategory.interiorPainting : interiorPaintingArea = quantity;
      case JobCategory.interiorWaterproofing : interiorWaterproofingArea = quantity;
      case JobCategory.ceilingCovering : ceilingCoveringArea = quantity;
      case JobCategory.covingPlaster : covingPlasterArea = quantity;
      case JobCategory.screeding : screedingArea = quantity;
      case JobCategory.marble : marbleArea = quantity;
      case JobCategory.marbleStep : marbleStepLength = quantity;
      case JobCategory.marbleWindowsill : marbleWindowsillLength = quantity;
      case JobCategory.stairRailings : stairRailingsLength = quantity;
      case JobCategory.ceramicTile : ceramicTileArea = quantity;
      case JobCategory.parquetTile : parquetTileArea = quantity;
      case JobCategory.steelDoor : steelDoorNumber = quantity;
      case JobCategory.entranceDoor : entranceDoorArea = quantity;
      case JobCategory.fireDoor : fireDoorNumber = quantity;
      case JobCategory.woodenDoor : woodenDoorNumber = quantity;
      case JobCategory.kitchenCupboard : kitchenCupboardLength = quantity;
      case JobCategory.kitchenCounter : kitchenCounterLength = quantity;
      case JobCategory.coatCabinet : coatCabinetArea = quantity;
      case JobCategory.bathroomCabinet : bathroomCabinetArea = quantity;
      case JobCategory.floorPlinth : floorPlinthLength = quantity;
      case JobCategory.mechanicalInfrastructure : mechanicalInfrastructureApartment = quantity;
      case JobCategory.airConditioner : airConditionerNumber = quantity;
      case JobCategory.ventilation : ventilationArea = quantity;
      case JobCategory.waterTank : 1;
      case JobCategory.elevation : elevationStop = quantity;
      case JobCategory.sink : sinkNumber = quantity;
      case JobCategory.sinkBattery : sinkBatteryNumber = quantity;
      case JobCategory.concealedCistern : concealedCisternNumber = quantity;
      case JobCategory.shower : showerNumber = quantity;
      case JobCategory.showerBattery : showerBatteryNumber = quantity;
      case JobCategory.kitchenFaucetAndSink : kitchenFaucetAndSinkNumber = quantity;
      case JobCategory.electricalInfrastructure : electricalInfrastructureApartment = quantity;
      case JobCategory.generator : 1;
      case JobCategory.householdAppliances : householdAppliancesApartment = quantity;
      case JobCategory.landScapeGarden : landScapeGardenArea = quantity;
      case JobCategory.outdoorParkingTile : outdoorParkingTileArea = quantity;
      case JobCategory.carLift : carLiftStop = quantity;
      case JobCategory.automaticBarrier : automaticBarrierNumber = quantity;
      case JobCategory.enclosingTheLand : enclosingTheLandLength = quantity;
      case JobCategory.mobilizationDemobilization : 1;
      case JobCategory.crane : craneHour = quantity;
      case JobCategory.siteSafety : siteSafetyMonth = quantity;
      case JobCategory.siteExpenses : officeExpensesMonth = quantity;
      case JobCategory.sergeant : sergeantMonth = quantity;
      case JobCategory.projectManager : projectManagerMonth = quantity;
      case JobCategory.projectsFeesPayments : 1;
    }
  }

  double calculateQuantity(JobCategory jobCategory) {
    return switch (jobCategory) {
      JobCategory.shoring => shoringArea ?? calculatedShoringArea,
      JobCategory.excavation => excavationVolume ?? calculatedExcavationVolume,
      JobCategory.breaker => breakerHour ?? calculatedBreakerHour,
      JobCategory.foundationStabilization => foundationStabilizationVolume ?? calculatedFoundationStabilizationVolume,
      JobCategory.subFoundationConcrete => subFoundationConcreteVolume ?? calculatedSubFoundationConcreteVolume,
      JobCategory.concreteFormWork => concreteFormWorkArea ?? calculatedConcreteFormWorkArea,
      JobCategory.pouringConcrete => pouringConcreteVolume ?? calculatedPouringConcreteVolume,
      JobCategory.rebar => rebarWeight ?? calculatedRebarWeight,
      JobCategory.hollowFloorFilling => hollowFloorFillingVolume ?? calculatedHollowFloorFillingVolume,
      JobCategory.foundationWaterproofing => foundationWaterProofingArea ?? calculatedFoundationWaterProofingArea,
      JobCategory.curtainWaterproofing => curtainWaterProofingArea ?? calculatedCurtainWaterProofingArea,
      JobCategory.curtainProtectionBeforeFilling => curtainProtectionBeforeFillingArea ?? calculatedCurtainProtectionBeforeFillingArea,
      JobCategory.wallMaterial => wallMaterialVolume ?? calculatedWallMaterialVolume,
      JobCategory.wallWorkmanShip => wallWorkmanShipArea ?? calculatedWallWorkmanShipArea,
      JobCategory.roofing => roofingArea ?? calculatedRoofingArea,
      JobCategory.facadeScaffolding => facadeScaffoldingArea ?? calculatedFacadeScaffoldingArea,
      JobCategory.windows => windowsArea ?? calculatedWindowsArea,
      JobCategory.facadeRails => facadeRailsLength ?? calculatedFacadeRailsLength,
      JobCategory.facadeSystem => facadeSystemArea ?? calculatedFacadeSystemArea,
      JobCategory.interiorPlastering => interiorPlasteringArea ?? calculatedInteriorPlasteringArea,
      JobCategory.interiorPainting => interiorPaintingArea ?? calculatedInteriorPaintingArea,
      JobCategory.interiorWaterproofing => interiorWaterproofingArea ?? calculatedInteriorWaterproofingArea,
      JobCategory.ceilingCovering => ceilingCoveringArea ?? calculatedCeilingCoveringArea,
      JobCategory.covingPlaster => covingPlasterArea ?? calculatedCovingPlasterArea,
      JobCategory.screeding => screedingArea ?? calculatedScreedingArea,
      JobCategory.marble => marbleArea ?? calculatedMarbleArea,
      JobCategory.marbleStep => marbleStepLength ?? calculatedMarbleStepLength,
      JobCategory.marbleWindowsill => marbleWindowsillLength ?? calculatedMarbleWindowsillLength,
      JobCategory.stairRailings => stairRailingsLength ?? calculatedStairRailingsLength,
      JobCategory.ceramicTile => ceramicTileArea ?? calculatedCeramicTileArea,
      JobCategory.parquetTile => parquetTileArea ?? calculatedParquetTileArea,
      JobCategory.steelDoor => steelDoorNumber ?? calculatedSteelDoorNumber,
      JobCategory.entranceDoor => entranceDoorArea ?? calculatedEntranceDoorArea,
      JobCategory.fireDoor => fireDoorNumber ?? calculatedFireDoorNumber,
      JobCategory.woodenDoor => woodenDoorNumber ?? calculatedWoodenDoorNumber,
      JobCategory.kitchenCupboard => kitchenCupboardLength ?? calculatedKitchenCupboardLength,
      JobCategory.kitchenCounter => kitchenCounterLength ?? calculatedKitchenCounterLength,
      JobCategory.coatCabinet => coatCabinetArea ?? calculatedCoatCabinetArea,
      JobCategory.bathroomCabinet => bathroomCabinetArea ?? calculatedBathroomCabinetArea,
      JobCategory.floorPlinth => floorPlinthLength ?? calculatedFloorPlinthLength,
      JobCategory.mechanicalInfrastructure => mechanicalInfrastructureApartment ?? calculatedMechanicalInfrastructureApartment,
      JobCategory.airConditioner => airConditionerNumber ?? calculatedAirConditionerNumber,
      JobCategory.ventilation => ventilationArea ?? calculatedVentilationArea,
      JobCategory.waterTank => 1,
      JobCategory.elevation => elevationStop ?? calculatedElevationStop,
      JobCategory.sink => sinkNumber ?? calculatedSinkNumber,
      JobCategory.sinkBattery => sinkBatteryNumber ?? calculatedSinkBatteryNumber,
      JobCategory.concealedCistern => concealedCisternNumber ?? calculatedConcealedCisternNumber,
      JobCategory.shower => showerNumber ?? calculatedShowerNumber,
      JobCategory.showerBattery => showerBatteryNumber ?? calculatedShowerBatteryNumber,
      JobCategory.kitchenFaucetAndSink => kitchenFaucetAndSinkNumber ?? calculatedKitchenFaucetAndSinkNumber,
      JobCategory.electricalInfrastructure => electricalInfrastructureApartment ?? calculatedElectricalInfrastructureApartment,
      JobCategory.generator => 1,
      JobCategory.householdAppliances => householdAppliancesApartment ?? calculatedHouseholdAppliancesApartment,
      JobCategory.landScapeGarden => landScapeGardenArea ?? calculatedLandScapeGardenArea,
      JobCategory.outdoorParkingTile => outdoorParkingTileArea ?? calculatedOutdoorParkingTileArea,
      JobCategory.carLift => carLiftStop ?? calculatedCarLiftStop,
      JobCategory.automaticBarrier => automaticBarrierNumber ?? calculatedAutomaticBarrierNumber,
      JobCategory.enclosingTheLand => enclosingTheLandLength ?? calculatedEnclosingTheLandLength,
      JobCategory.mobilizationDemobilization => 1,
      JobCategory.crane => craneHour ?? calculatedCraneHour,
      JobCategory.siteSafety => siteSafetyMonth ?? calculatedSiteSafetyMonth,
      JobCategory.siteExpenses => officeExpensesMonth  ?? calculatedOfficeExpensesMonth,
      JobCategory.sergeant => sergeantMonth ?? calculatedSergeantMonth,
      JobCategory.projectManager => projectManagerMonth ?? calculatedProjectManagerMonth,
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
  String get foundationStabilizationVolumeExplanation => "";

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