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
        quantityBuilder: () {
          return _topFloor.area;
        },
        quantityExplanationBuilder: () {
          return "En üst kat alanı: ${_topFloor.area}";
        },
      )
    ];
  }

  Floor get _topFloor {
    final topFloor = floors.reduce((current, next) {
      return current.no > next.no ? current : next;
    });
    return topFloor;
  }
}
