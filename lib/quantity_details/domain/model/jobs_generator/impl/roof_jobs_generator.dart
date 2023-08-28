import '../../floor/floor.dart';
import '../../../../../common/model/job.dart';
import '../jobs_generator.dart';

class RoofJobsGenerator extends JobsGenerator {
  RoofJobsGenerator({
    super.name = "Çatı",
    required this.floors,
  });

  final List<Floor> floors;

  @override
  List<Job> createJobs() {
    return [
      Roofing(
        quantity: roofingArea,
        quantityExplanation: roofingAreaExplanation,
      )
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