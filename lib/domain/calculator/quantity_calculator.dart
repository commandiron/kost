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

  double get woodenDoorNumber;
  String get woodenDoorNumberExplanation;

  double get entranceDoorArea;
  String get entranceDoorAreaExplanation;

  double get fireDoorNumber;
  String get fireDoorNumberExplanation;

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
      JobCategory.woodenDoor => woodenDoorNumber,
      JobCategory.entranceDoor => entranceDoorArea,
      JobCategory.fireDoor => fireDoorNumber,
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
      JobCategory.woodenDoor => woodenDoorNumberExplanation,
      JobCategory.entranceDoor => entranceDoorAreaExplanation,
      JobCategory.fireDoor => fireDoorNumberExplanation,
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
}
