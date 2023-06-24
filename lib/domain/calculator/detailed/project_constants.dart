class ProjectConstants {
  final double breakerHourForOneCubicMeterMediumRockExcavation;
  final double concreteCubicMeterForOneSquareMeterFormWork;
  final double rebarTonForOneCubicMeterConcrete;
  final double hollowAreaForOneSquareMeterConstructionArea;
  final double outerWallThickness;
  final double innerWallThickness;

  ProjectConstants(
    {
      this.breakerHourForOneCubicMeterMediumRockExcavation = 0.0436,
      this.concreteCubicMeterForOneSquareMeterFormWork = 0.35,
      this.rebarTonForOneCubicMeterConcrete = 0.16,
      this.hollowAreaForOneSquareMeterConstructionArea = 0.40,
      this.outerWallThickness = 0.135,
      this.innerWallThickness = 0.085
    }
  );
}