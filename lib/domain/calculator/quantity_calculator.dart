import '../model/category/category.dart';

abstract class QuantityCalculator {
  double get totalExcavationSurfaceArea;
  String get totalExcavationSurfaceAreaExplanation;

  double get totalExcavationVolume;
  String get totalExcavationVolumeExplanation;

  double get totalBreakerHour;
  String get totalBreakerHourExplanation;

  double get totalStabilizationVolume;
  String get totalStabilizationVolumeExplanation;

  double get totalFillingConcreteVolume;
  String get totalFillingConcreteVolumeExplanation;

  double get totalFormWorkArea;
  String get totalFormWorkAreaExplanation;

  double get totalStructuralConcreteVolume;
  String get totalStructuralConcreteVolumeExplanation;

  double get totalStructuralSteelWeight;
  String get totalStructuralSteelWeightExplanation;

  double get totalHollowVolume;
  String get totalHollowVolumeExplanation;

  double get totalFoundationWetArea;
  String get totalFoundationWetAreaExplanation;

  double get totalBasementsWetSurfaceArea;
  String get totalBasementsWetSurfaceAreaExplanation;

  double get totalBasementsWetCurtainArea;
  String get totalBasementsWetCurtainAreaExplanation;

  double get totalWallVolume;
  String get totalWallVolumeExplanation;

  double get totalWallArea;
  String get totalWallAreaExplanation;

  double get totalRoofArea;
  String get totalRoofAreaExplanation;

  double get totalFacadeArea;
  String get totalFacadeAreaExplanation;

  double get totalWindowArea;
  String get totalWindowAreaExplanation;

  double get totalRailingLength;
  String get totalRailingLengthExplanation;

  double get totalFacadeAreaWithoutWindows;
  String get totalFacadeAreaWithoutWindowsExplanation;

  double get totalPlasteringArea;
  String get totalPlasteringAreaExplanation;

  double get totalPaintingArea;
  String get totalPaintingAreaExplanation;

  double getQuantityFromJobCategory(JobCategory jobCategory) {
    switch(jobCategory) {
      case JobCategory.shoring : return totalExcavationSurfaceArea;
      case JobCategory.excavation : return totalExcavationVolume;
      case JobCategory.breaker : return totalBreakerHour;
      case JobCategory.foundationStabilization : return totalStabilizationVolume;
      case JobCategory.subFoundationConcrete : return totalFillingConcreteVolume;
      case JobCategory.concreteFormWork : return totalFormWorkArea;
      case JobCategory.pouringConcrete : return totalStructuralConcreteVolume;
      case JobCategory.rebarWork : return totalStructuralSteelWeight;
      case JobCategory.hollowFloorFilling : return totalHollowVolume;
      case JobCategory.foundationWaterproofing : return totalFoundationWetArea;
      case JobCategory.curtainWaterproofing : return totalBasementsWetSurfaceArea;
      case JobCategory.curtainProtectionBeforeFilling : return totalBasementsWetCurtainArea;
      case JobCategory.wallMaterial : return totalWallVolume;
      case JobCategory.wallWorkmanShip : return  totalWallArea;
      case JobCategory.roofing : return totalRoofArea;
      case JobCategory.facadeScaffolding : return totalFacadeArea;
      case JobCategory.windows : return totalWindowArea;
      case JobCategory.facadeRails : return totalRailingLength;
      case JobCategory.facade : return totalFacadeAreaWithoutWindows;
      case JobCategory.interiorPlastering : return totalPlasteringArea;
      case JobCategory.interiorPainting : return totalPaintingArea;
    }
  }

  String getQuantityExplanationFromJobCategory(JobCategory jobCategory) {
    switch(jobCategory) {
      case JobCategory.shoring : return totalExcavationSurfaceAreaExplanation;
      case JobCategory.excavation : return totalExcavationVolumeExplanation;
      case JobCategory.breaker : return totalBreakerHourExplanation;
      case JobCategory.foundationStabilization : return totalStabilizationVolumeExplanation;
      case JobCategory.subFoundationConcrete : return totalFillingConcreteVolumeExplanation;
      case JobCategory.concreteFormWork : return totalFormWorkAreaExplanation;
      case JobCategory.pouringConcrete : return totalStructuralConcreteVolumeExplanation;
      case JobCategory.rebarWork : return totalStructuralSteelWeightExplanation;
      case JobCategory.hollowFloorFilling : return totalHollowVolumeExplanation;
      case JobCategory.foundationWaterproofing : return totalFoundationWetAreaExplanation;
      case JobCategory.curtainWaterproofing : return totalBasementsWetSurfaceAreaExplanation;
      case JobCategory.curtainProtectionBeforeFilling : return totalBasementsWetCurtainAreaExplanation;
      case JobCategory.wallMaterial : return totalWallVolumeExplanation;
      case JobCategory.wallWorkmanShip : return  totalWallAreaExplanation;
      case JobCategory.roofing : return totalRoofAreaExplanation;
      case JobCategory.facadeScaffolding : return totalFacadeAreaExplanation;
      case JobCategory.windows : return totalWindowAreaExplanation;
      case JobCategory.facadeRails : return totalRailingLengthExplanation;
      case JobCategory.facade : return totalFacadeAreaWithoutWindowsExplanation;
      case JobCategory.interiorPlastering : return totalPlasteringAreaExplanation;
      case JobCategory.interiorPainting : return totalPaintingAreaExplanation;
    }
  }
}

class InitialQuantityCalculator extends QuantityCalculator {

  @override
  double get totalExcavationSurfaceArea => 0;
  @override
  String get totalExcavationSurfaceAreaExplanation => "";

  @override
  double get totalExcavationVolume => 0;
  @override
  String get totalExcavationVolumeExplanation => "";

  @override
  double get totalBreakerHour => 0;
  @override
  String get totalBreakerHourExplanation => "";

  @override
  double get totalStabilizationVolume => 0;
  @override
  String get totalStabilizationVolumeExplanation => "";

  @override
  double get totalFillingConcreteVolume => 0;
  @override
  String get totalFillingConcreteVolumeExplanation => "";

  @override
  double get totalFormWorkArea => 0;
  @override
  String get totalFormWorkAreaExplanation => "";

  @override
  double get totalStructuralConcreteVolume => 0;
  @override
  String get totalStructuralConcreteVolumeExplanation => "";

  @override
  double get totalStructuralSteelWeight => 0;
  @override
  String get totalStructuralSteelWeightExplanation => "";

  @override
  double get totalHollowVolume => 0;
  @override
  String get totalHollowVolumeExplanation => "";

  @override
  double get totalFoundationWetArea => 0;
  @override
  String get totalFoundationWetAreaExplanation => "";

  @override
  double get totalBasementsWetSurfaceArea => 0;
  @override
  String get totalBasementsWetSurfaceAreaExplanation => "";

  @override
  double get totalBasementsWetCurtainArea => 0;
  @override
  String get totalBasementsWetCurtainAreaExplanation => "";

  @override
  double get totalWallVolume => 0;
  @override
  String get totalWallVolumeExplanation => "";

  @override
  double get totalWallArea => 0;
  @override
  String get totalWallAreaExplanation => "";

  @override
  double get totalRoofArea => 0;
  @override
  String get totalRoofAreaExplanation => "";

  @override
  double get totalFacadeArea => 0;
  @override
  String get totalFacadeAreaExplanation => "";

  @override
  double get totalWindowArea => 0;
  @override
  String get totalWindowAreaExplanation => "";

  @override
  double get totalRailingLength => 0;
  @override
  String get totalRailingLengthExplanation => "";

  @override
  double get totalFacadeAreaWithoutWindows => 0;
  @override
  String get totalFacadeAreaWithoutWindowsExplanation => "";

  @override
  double get totalPlasteringArea => 0;
  @override
  String get totalPlasteringAreaExplanation => "";

  @override
  double get totalPaintingArea => 0;

  @override
  String get totalPaintingAreaExplanation => "";
}