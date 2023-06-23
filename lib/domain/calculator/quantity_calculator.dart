import '../model/category.dart';

abstract class QuantityCalculator {
  double get totalExcavationSurfaceArea;
  double get totalExcavationVolume;
  double get totalBreakerHour;
  double get totalStabilizationVolume;
  double get totalFillingConcreteVolume;
  double get totalStructuralConcreteVolume;
  double get totalStructuralSteelWeight;
  double get totalFormWorkArea;
  double get totalHollowVolume;
  double get totalFoundationWetArea;
  double get totalBasementsWetSurfaceArea;
  double get totalBasementsCurtainArea;
  double get totalWallVolume;
  double get totalWallArea;

  double getQuantityFromUnitPriceCategory(UnitPriceCategory unitPriceCategory) {
    switch(unitPriceCategory) {
      case UnitPriceCategory.shutCrete : return totalExcavationSurfaceArea;
      case UnitPriceCategory.excavation : return totalExcavationVolume;
      case UnitPriceCategory.breaker : return totalBreakerHour;
      case UnitPriceCategory.foundationStabilizationGravel : return totalStabilizationVolume;
      case UnitPriceCategory.c16Concrete : return totalFillingConcreteVolume;
      case UnitPriceCategory.c30Concrete : return totalStructuralConcreteVolume;
      case UnitPriceCategory.c35Concrete : return totalStructuralConcreteVolume;
      case UnitPriceCategory.s420Steel : return totalStructuralSteelWeight;
      case UnitPriceCategory.plywood : return totalFormWorkArea;
      case UnitPriceCategory.eps : return totalHollowVolume;
      case UnitPriceCategory.doubleLayerBitumenMembrane : return totalFoundationWetArea;
      case UnitPriceCategory.bitumenSliding : return totalBasementsWetSurfaceArea;
      case UnitPriceCategory.drainPlate : return totalBasementsCurtainArea;
      case UnitPriceCategory.aeratedConcreteMaterial : return totalWallVolume;
      case UnitPriceCategory.aeratedConcreteWorkmanShip : return totalWallArea;
    }
  }
}

class InitialQuantityCalculator extends QuantityCalculator {
  @override
  double get totalBasementsCurtainArea => 0;
  @override
  double get totalBasementsWetSurfaceArea => 0;
  @override
  double get totalBreakerHour => 0;
  @override
  double get totalExcavationSurfaceArea => 0;
  @override
  double get totalExcavationVolume => 0;
  @override
  double get totalFillingConcreteVolume => 0;
  @override
  double get totalFormWorkArea => 0;
  @override
  double get totalFoundationWetArea => 0;
  @override
  double get totalHollowVolume => 0;
  @override
  double get totalStabilizationVolume => 0;
  @override
  double get totalStructuralConcreteVolume => 0;
  @override
  double get totalStructuralSteelWeight => 0;
  @override
  double get totalWallArea => 0;
  @override
  double get totalWallVolume => 0;
}