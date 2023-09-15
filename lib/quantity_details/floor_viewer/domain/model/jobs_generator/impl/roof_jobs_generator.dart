import 'package:collection/collection.dart';

import '../../floor/floor.dart';
import '../../../../../../common/model/job.dart';
import '../jobs_generator.dart';

class RoofJobsGenerator extends JobsGenerator { //✓
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
          return _floorToCeilingAreaMap[_topFloor] ?? 0;
        },
      )
    ];
  }

  Map<Floor, double> get _floorToCeilingAreaMap { //✓
    Map<Floor, double> result = {};
    for(var floor in floors) {
      result.putIfAbsent(floor, () {
        final ceilingArea = floors.firstWhereOrNull((e) => e.no == floor.no + 1)?.area ?? 0;
        if(floor.area > ceilingArea) {
          return floor.area;
        }
        return ceilingArea;
      });
    }
    return result;
  }

  Floor get _topFloor { //✓
    final result = floors.reduce((current, next) {
      return current.no > next.no ? current : next;
    });
    return result;
  }
}
