import '../model/category.dart';

abstract class QuantityCalculator {
  double get totalExcavationSurfaceArea;
  double get totalExcavationVolume;
  double get totalBreakerHour;
  double get totalStabilizationVolume;
  double get totalFillingConcrete;
  double get totalStructuralConcrete;
  double get totalStructuralSteel;
  double get totalFormWorkArea;
  double get totalHollowVolume;
  double get foundationWetArea;
  double get totalBasementsWetSurfaceArea;
  double get basementCurtainArea;
  double get totalWallVolume;
  double get totalWallArea;

  double getQuantityFromUnitPriceCategory(UnitPriceCategory unitPriceCategory) {
    switch(unitPriceCategory) {
      case UnitPriceCategory.shutCrete : return totalExcavationSurfaceArea;
      case UnitPriceCategory.excavation : return totalExcavationVolume;
      case UnitPriceCategory.breaker : return totalBreakerHour;
      case UnitPriceCategory.foundationStabilizationGravel : return totalStabilizationVolume;
      case UnitPriceCategory.c16Concrete : return totalFillingConcrete;
      case UnitPriceCategory.c30Concrete : return totalStructuralConcrete;
      case UnitPriceCategory.c35Concrete : return totalStructuralConcrete;
      case UnitPriceCategory.s420Steel : return totalStructuralSteel;
      case UnitPriceCategory.plywood : return totalFormWorkArea;
      case UnitPriceCategory.eps : return totalHollowVolume;
      case UnitPriceCategory.doubleLayerBitumenMembrane : return foundationWetArea;
      case UnitPriceCategory.bitumenSliding : return totalBasementsWetSurfaceArea;
      case UnitPriceCategory.drainPlate : return basementCurtainArea;
      case UnitPriceCategory.aeratedConcreteMaterial : return totalWallVolume;
      case UnitPriceCategory.aeratedConcreteWorkmanShip : return totalWallArea;
    }
  }
}