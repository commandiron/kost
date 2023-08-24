import '../floor.dart';
import 'job.dart';
import 'job_calculator.dart';

class RoofJobCalculator extends JobCalculator {
  RoofJobCalculator(
      {super.name = "Çatı Maliyeti",
      required super.projectConstants,
      required super.projectVariables,
      required super.floors});

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
