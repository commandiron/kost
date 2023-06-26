import '../model/category/category.dart';

abstract class QuantityCalculator {
  double get totalShoringArea;
  String get totalShoringAreaExplanation;

  double get totalExcavationVolume;
  String get totalExcavationVolumeExplanation;

  double get totalBreakerHour;
  String get totalBreakerHourExplanation;

  double get totalFoundationStabilizationVolume;
  String get totalFoundationStabilizationVolumeExplanation;

  double get totalSubFoundationConcreteVolume;
  String get totalSubFoundationConcreteVolumeExplanation;

  double get totalConcreteFormWorkArea;
  String get totalConcreteFormWorkAreaExplanation;

  double get totalPouringConcreteVolume;
  String get totalPouringConcreteVolumeExplanation;

  double get totalRebarWeight;
  String get totalRebarWeightExplanation;

  double get totalHollowFloorFillingVolume;
  String get totalHollowFloorFillingVolumeExplanation;

  double get totalFoundationWaterProofingArea;
  String get totalFoundationWaterProofingAreaExplanation;

  double get totalCurtainWaterProofingArea;
  String get totalCurtainWaterProofingAreaExplanation;

  double get totalCurtainProtectionBeforeFillingArea;
  String get totalCurtainProtectionBeforeFillingAreaExplanation;

  double get totalWallMaterialVolume;
  String get totalWallMaterialVolumeExplanation;

  double get totalWallWorkmanShipArea;
  String get totalWallWorkmanShipAreaExplanation;

  double get totalRoofingArea;
  String get totalRoofingAreaExplanation;

  double get totalFacadeScaffoldingArea;
  String get totalFacadeScaffoldingAreaExplanation;

  double get totalWindowsArea;
  String get totalWindowAreaExplanation;

  double get totalFacadeRailsLength;
  String get totalFacadeRailsLengthExplanation;

  double get totalFacadeArea;
  String get totalFacadeAreaExplanation;

  double get totalInteriorPlasteringArea;
  String get totalInteriorPlasteringAreaExplanation;

  double get totalInteriorPaintingArea;
  String get totalInteriorPaintingAreaExplanation;

  double get totalInteriorWaterproofingArea;
  String get totalInteriorWaterproofingAreaExplanation;

  double getQuantityFromJobCategory(JobCategory jobCategory) {
    switch(jobCategory) {
      case JobCategory.shoring : return totalShoringArea;
      case JobCategory.excavation : return totalExcavationVolume;
      case JobCategory.breaker : return totalBreakerHour;
      case JobCategory.foundationStabilization : return totalFoundationStabilizationVolume;
      case JobCategory.subFoundationConcrete : return totalSubFoundationConcreteVolume;
      case JobCategory.concreteFormWork : return totalConcreteFormWorkArea;
      case JobCategory.pouringConcrete : return totalPouringConcreteVolume;
      case JobCategory.rebar : return totalRebarWeight;
      case JobCategory.hollowFloorFilling : return totalHollowFloorFillingVolume;
      case JobCategory.foundationWaterproofing : return totalFoundationWaterProofingArea;
      case JobCategory.curtainWaterproofing : return totalCurtainWaterProofingArea;
      case JobCategory.curtainProtectionBeforeFilling : return totalCurtainProtectionBeforeFillingArea;
      case JobCategory.wallMaterial : return totalWallMaterialVolume;
      case JobCategory.wallWorkmanShip : return  totalWallWorkmanShipArea;
      case JobCategory.roofing : return totalRoofingArea;
      case JobCategory.facadeScaffolding : return totalFacadeScaffoldingArea;
      case JobCategory.windows : return totalWindowsArea;
      case JobCategory.facadeRails : return totalFacadeRailsLength;
      case JobCategory.facade : return totalFacadeArea;
      case JobCategory.interiorPlastering : return totalInteriorPlasteringArea;
      case JobCategory.interiorPainting : return totalInteriorPaintingArea;
      case JobCategory.interiorWaterproofing : return totalInteriorWaterproofingArea;
    }
  }

  String getQuantityExplanationFromJobCategory(JobCategory jobCategory) {
    switch(jobCategory) {
      case JobCategory.shoring : return totalShoringAreaExplanation;
      case JobCategory.excavation : return totalExcavationVolumeExplanation;
      case JobCategory.breaker : return totalBreakerHourExplanation;
      case JobCategory.foundationStabilization : return totalFoundationStabilizationVolumeExplanation;
      case JobCategory.subFoundationConcrete : return totalSubFoundationConcreteVolumeExplanation;
      case JobCategory.concreteFormWork : return totalConcreteFormWorkAreaExplanation;
      case JobCategory.pouringConcrete : return totalPouringConcreteVolumeExplanation;
      case JobCategory.rebar : return totalRebarWeightExplanation;
      case JobCategory.hollowFloorFilling : return totalHollowFloorFillingVolumeExplanation;
      case JobCategory.foundationWaterproofing : return totalFoundationWaterProofingAreaExplanation;
      case JobCategory.curtainWaterproofing : return totalCurtainWaterProofingAreaExplanation;
      case JobCategory.curtainProtectionBeforeFilling : return totalCurtainProtectionBeforeFillingAreaExplanation;
      case JobCategory.wallMaterial : return totalWallMaterialVolumeExplanation;
      case JobCategory.wallWorkmanShip : return  totalWallWorkmanShipAreaExplanation;
      case JobCategory.roofing : return totalRoofingAreaExplanation;
      case JobCategory.facadeScaffolding : return totalFacadeScaffoldingAreaExplanation;
      case JobCategory.windows : return totalWindowAreaExplanation;
      case JobCategory.facadeRails : return totalFacadeRailsLengthExplanation;
      case JobCategory.facade : return totalFacadeAreaExplanation;
      case JobCategory.interiorPlastering : return totalInteriorPlasteringAreaExplanation;
      case JobCategory.interiorPainting : return totalInteriorPaintingAreaExplanation;
      case JobCategory.interiorWaterproofing : return totalInteriorWaterproofingAreaExplanation;
    }
  }
}

class InitialQuantityCalculator extends QuantityCalculator {

  @override
  double get totalShoringArea => 0;
  @override
  String get totalShoringAreaExplanation => "";

  @override
  double get totalExcavationVolume => 0;
  @override
  String get totalExcavationVolumeExplanation => "";

  @override
  double get totalBreakerHour => 0;
  @override
  String get totalBreakerHourExplanation => "";

  @override
  double get totalFoundationStabilizationVolume => 0;
  @override
  String get totalFoundationStabilizationVolumeExplanation => "";

  @override
  double get totalSubFoundationConcreteVolume => 0;
  @override
  String get totalSubFoundationConcreteVolumeExplanation => "";

  @override
  double get totalConcreteFormWorkArea => 0;
  @override
  String get totalConcreteFormWorkAreaExplanation => "";

  @override
  double get totalPouringConcreteVolume => 0;
  @override
  String get totalPouringConcreteVolumeExplanation => "";

  @override
  double get totalRebarWeight => 0;
  @override
  String get totalRebarWeightExplanation => "";

  @override
  double get totalHollowFloorFillingVolume => 0;
  @override
  String get totalHollowFloorFillingVolumeExplanation => "";

  @override
  double get totalFoundationWaterProofingArea => 0;
  @override
  String get totalFoundationWaterProofingAreaExplanation => "";

  @override
  double get totalCurtainWaterProofingArea => 0;
  @override
  String get totalCurtainWaterProofingAreaExplanation => "";

  @override
  double get totalCurtainProtectionBeforeFillingArea => 0;
  @override
  String get totalCurtainProtectionBeforeFillingAreaExplanation => "";

  @override
  double get totalWallMaterialVolume => 0;
  @override
  String get totalWallMaterialVolumeExplanation => "";

  @override
  double get totalWallWorkmanShipArea => 0;
  @override
  String get totalWallWorkmanShipAreaExplanation => "";

  @override
  double get totalRoofingArea => 0;
  @override
  String get totalRoofingAreaExplanation => "";

  @override
  double get totalFacadeScaffoldingArea => 0;
  @override
  String get totalFacadeScaffoldingAreaExplanation => "";

  @override
  double get totalWindowsArea => 0;
  @override
  String get totalWindowAreaExplanation => "";

  @override
  double get totalFacadeRailsLength => 0;
  @override
  String get totalFacadeRailsLengthExplanation => "";

  @override
  double get totalFacadeArea => 0;
  @override
  String get totalFacadeAreaExplanation => "";

  @override
  double get totalInteriorPlasteringArea => 0;
  @override
  String get totalInteriorPlasteringAreaExplanation => "";

  @override
  double get totalInteriorPaintingArea => 0;

  @override
  String get totalInteriorPaintingAreaExplanation => "";

  @override
  double get totalInteriorWaterproofingArea => 0;

  @override
  String get totalInteriorWaterproofingAreaExplanation => "";
}