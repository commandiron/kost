import '../floor.dart';
import 'job.dart';
import 'job_calculator.dart';

class RoofJobCalculator extends JobCalculator {
  RoofJobCalculator(
      {super.name = "Çatı Maliyeti",
      required super.projectConstants,
      required super.landArea,
      required super.landPerimeter,
      required super.excavationArea,
      required super.excavationPerimeter,
      required super.coreCurtainLength,
      required super.curtainsExceeding1MeterLength,
      required super.basementCurtainLength,
      required super.columnsLess1MeterPerimeter,
      required super.elevationTowerArea,
      required super.elevationTowerHeightWithoutSlab,
      required super.floors});

  @override
  JobCalculator get newInstance {
    return RoofJobCalculator(
        projectConstants: projectConstants,
        landArea: landArea,
        landPerimeter: landPerimeter,
        excavationArea: excavationArea,
        excavationPerimeter: excavationPerimeter,
        coreCurtainLength: coreCurtainLength,
        curtainsExceeding1MeterLength: curtainsExceeding1MeterLength,
        basementCurtainLength: basementCurtainLength,
        columnsLess1MeterPerimeter: columnsLess1MeterPerimeter,
        elevationTowerArea: elevationTowerArea,
        elevationTowerHeightWithoutSlab: elevationTowerHeightWithoutSlab,
        floors: floors);
  }

  @override
  List<Job> createJobs() {
    return [
      Roofing(
          quantity: roofingArea, quantityExplanation: roofingAreaExplanation)
    ];
  }

  Floor get _topFloor {
    final topFloor = floors.reduce((current, next) {
      return current.no > next.no ? current : next;
    });
    return topFloor;
  }

  double get roofingArea {
    return _topFloor.area;
  }

  String get roofingAreaExplanation {
    return "En üst kat alanı: ${_topFloor.area}";
  }
}
