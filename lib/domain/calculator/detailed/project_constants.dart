class ProjectConstants {
  final double breakerHourForOneCubicMeterMediumRockExcavation;
  final double concreteCubicMeterForOneSquareMeterFormWork;
  final double rebarTonForOneCubicMeterConcrete;
  final double hollowAreaForOneSquareMeterConstructionArea;
  final double thickWallThickness;
  final double thinWallThickness;

  ProjectConstants(
    {
      this.breakerHourForOneCubicMeterMediumRockExcavation = 0.0436,
      this.concreteCubicMeterForOneSquareMeterFormWork = 0.35,
      this.rebarTonForOneCubicMeterConcrete = 0.16,
      this.hollowAreaForOneSquareMeterConstructionArea = 0.40,
      this.thickWallThickness = 0.135,
      this.thinWallThickness = 0.085
    }
  );
}