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

  double getQuantityFromUnitPriceCategory(UnitPriceCategory unitPriceCategory) {
    switch(unitPriceCategory) {
      case UnitPriceCategory.shutCrete : return totalExcavationSurfaceArea;
      case UnitPriceCategory.excavation : return totalExcavationVolume;
      case UnitPriceCategory.breaker : return totalBreakerHour;
      case UnitPriceCategory.foundationStabilizationGravel : return totalStabilizationVolume;
      case UnitPriceCategory.c16Concrete : return totalFillingConcreteVolume;
      case UnitPriceCategory.plywood : return totalFormWorkArea;
      case UnitPriceCategory.c30Concrete : return totalStructuralConcreteVolume;
      case UnitPriceCategory.c35Concrete : return totalStructuralConcreteVolume;
      case UnitPriceCategory.s420Steel : return totalStructuralSteelWeight;
      case UnitPriceCategory.eps : return totalHollowVolume;
      case UnitPriceCategory.doubleLayerBitumenMembrane : return totalFoundationWetArea;
      case UnitPriceCategory.bitumenSliding : return totalBasementsWetSurfaceArea;
      case UnitPriceCategory.drainPlate : return totalBasementsWetCurtainArea;
      case UnitPriceCategory.aeratedConcreteMaterial : return totalWallVolume;
      case UnitPriceCategory.aeratedConcreteWorkmanShip : return totalWallArea;
      case UnitPriceCategory.steelConstructionBraasRoof : return totalRoofArea;
      case UnitPriceCategory.steelScaffolding : return totalFacadeArea;
      case UnitPriceCategory.windowJoineryRehau : return totalWindowArea;
    }
  }

  String getQuantityExplanationFromUnitPriceCategory(UnitPriceCategory unitPriceCategory) {
    switch(unitPriceCategory) {
      case UnitPriceCategory.shutCrete : return totalExcavationSurfaceAreaExplanation;
      case UnitPriceCategory.excavation : return totalExcavationVolumeExplanation;
      case UnitPriceCategory.breaker : return totalBreakerHourExplanation;
      case UnitPriceCategory.foundationStabilizationGravel : return totalStabilizationVolumeExplanation;
      case UnitPriceCategory.c16Concrete : return totalFillingConcreteVolumeExplanation;
      case UnitPriceCategory.plywood : return totalFormWorkAreaExplanation;
      case UnitPriceCategory.c30Concrete : return totalStructuralConcreteVolumeExplanation;
      case UnitPriceCategory.c35Concrete : return totalStructuralConcreteVolumeExplanation;
      case UnitPriceCategory.s420Steel : return totalStructuralSteelWeightExplanation;
      case UnitPriceCategory.eps : return totalHollowVolumeExplanation;
      case UnitPriceCategory.doubleLayerBitumenMembrane : return totalFoundationWetAreaExplanation;
      case UnitPriceCategory.bitumenSliding : return totalBasementsWetSurfaceAreaExplanation;
      case UnitPriceCategory.drainPlate : return totalBasementsWetCurtainAreaExplanation;
      case UnitPriceCategory.aeratedConcreteMaterial : return totalWallVolumeExplanation;
      case UnitPriceCategory.aeratedConcreteWorkmanShip : return totalWallAreaExplanation;
      case UnitPriceCategory.steelConstructionBraasRoof : return totalRoofAreaExplanation;
      case UnitPriceCategory.steelScaffolding : return totalFacadeAreaExplanation;
      case UnitPriceCategory.windowJoineryRehau : return totalWindowAreaExplanation;
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
}