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

  double get totalCeilingCoveringArea;
  String get totalCeilingCoveringAreaExplanation;

  double get totalCovingPlasterArea;
  String get totalCovingPlasterAreaExplanation;

  double getQuantityFromJobCategory(JobCategory jobCategory) {
    return switch (jobCategory) {
      JobCategory.shoring => totalShoringArea,
      JobCategory.excavation => totalExcavationVolume,
      JobCategory.breaker => totalBreakerHour,
      JobCategory.foundationStabilization => totalFoundationStabilizationVolume,
      JobCategory.subFoundationConcrete => totalSubFoundationConcreteVolume,
      JobCategory.concreteFormWork => totalConcreteFormWorkArea,
      JobCategory.pouringConcrete => totalPouringConcreteVolume,
      JobCategory.rebar => totalRebarWeight,
      JobCategory.hollowFloorFilling => totalHollowFloorFillingVolume,
      JobCategory.foundationWaterproofing => totalFoundationWaterProofingArea,
      JobCategory.curtainWaterproofing => totalCurtainWaterProofingArea,
      JobCategory.curtainProtectionBeforeFilling => totalCurtainProtectionBeforeFillingArea,
      JobCategory.wallMaterial => totalWallMaterialVolume,
      JobCategory.wallWorkmanShip => totalWallWorkmanShipArea,
      JobCategory.roofing => totalRoofingArea,
      JobCategory.facadeScaffolding => totalFacadeScaffoldingArea,
      JobCategory.windows => totalWindowsArea,
      JobCategory.facadeRails => totalFacadeRailsLength,
      JobCategory.facadeSystem => totalFacadeArea,
      JobCategory.interiorPlastering => totalInteriorPlasteringArea,
      JobCategory.interiorPainting => totalInteriorPaintingArea,
      JobCategory.interiorWaterproofing => totalInteriorWaterproofingArea,
      JobCategory.ceilingCovering => totalCeilingCoveringArea,
      JobCategory.covingPlaster => totalCovingPlasterArea,
    };
  }

  String getQuantityExplanationFromJobCategory(JobCategory jobCategory) {
    return switch (jobCategory) {
      JobCategory.shoring => totalShoringAreaExplanation,
      JobCategory.excavation => totalExcavationVolumeExplanation,
      JobCategory.breaker => totalBreakerHourExplanation,
      JobCategory.foundationStabilization => totalFoundationStabilizationVolumeExplanation,
      JobCategory.subFoundationConcrete => totalSubFoundationConcreteVolumeExplanation,
      JobCategory.concreteFormWork => totalConcreteFormWorkAreaExplanation,
      JobCategory.pouringConcrete => totalPouringConcreteVolumeExplanation,
      JobCategory.rebar => totalRebarWeightExplanation,
      JobCategory.hollowFloorFilling => totalHollowFloorFillingVolumeExplanation,
      JobCategory.foundationWaterproofing => totalFoundationWaterProofingAreaExplanation,
      JobCategory.curtainWaterproofing => totalCurtainWaterProofingAreaExplanation,
      JobCategory.curtainProtectionBeforeFilling => totalCurtainProtectionBeforeFillingAreaExplanation,
      JobCategory.wallMaterial => totalWallMaterialVolumeExplanation,
      JobCategory.wallWorkmanShip => totalWallWorkmanShipAreaExplanation,
      JobCategory.roofing => totalRoofingAreaExplanation,
      JobCategory.facadeScaffolding => totalFacadeScaffoldingAreaExplanation,
      JobCategory.windows => totalWindowAreaExplanation,
      JobCategory.facadeRails => totalFacadeRailsLengthExplanation,
      JobCategory.facadeSystem => totalFacadeAreaExplanation,
      JobCategory.interiorPlastering => totalInteriorPlasteringAreaExplanation,
      JobCategory.interiorPainting => totalInteriorPaintingAreaExplanation,
      JobCategory.interiorWaterproofing => totalInteriorWaterproofingAreaExplanation,
      JobCategory.ceilingCovering => totalCeilingCoveringAreaExplanation,
      JobCategory.covingPlaster => totalCovingPlasterAreaExplanation,
    };
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
  
  @override
  double get totalCeilingCoveringArea => 0;
  @override
  String get totalCeilingCoveringAreaExplanation => "";

  @override
  double get totalCovingPlasterArea => 0;
  @override
  String get totalCovingPlasterAreaExplanation => "";
}
