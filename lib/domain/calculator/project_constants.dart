class ProjectConstants {
  final double breakerHourForOneCubicMeterExcavation;
  final double concreteCubicMeterForOneSquareMeterFormWork;
  final double rebarTonForOneCubicMeterConcrete;
  final double hollowAreaForOneSquareMeterConstructionArea;

  ProjectConstants(
    {
      this.breakerHourForOneCubicMeterExcavation = 0.0436,
      this.concreteCubicMeterForOneSquareMeterFormWork = 0.35,
      this.rebarTonForOneCubicMeterConcrete = 0.16,
      this.hollowAreaForOneSquareMeterConstructionArea = 0.40,
    }
  );
}