import '../../floor/floor.dart';
import '../../../../../common/model/job.dart';
import '../jobs_generator.dart';

class FacadeJobsGenerator extends JobsGenerator { //✓
  FacadeJobsGenerator({
    super.name = "Cephe",
    required this.floors,
  });

  final List<Floor> floors;

  @override
  List<Job> createJobs() {
    return [
      FacadeScaffolding( //✓
        quantityBuilder: () {
          return _totalFacadeArea;
        },
      ),
      Windows( //✓
        quantityBuilder: () {
          return _totalWindowArea;
        },
      ),
      FacadeRails( //✓
        quantityBuilder: () {
          return _totalFacadeRailingLength;
        },
      ),
      FacadeSystem( //✓
        quantityBuilder: () {
          return _totalFacadeArea - _totalWindowArea;
        },
      )
    ];
  }

  List<Floor> get _aboveBasementFloors { //✓
    return floors.where((floor) => floor.no >= 0).toList();
  }

  double get _maximumPerimeterInAboveBasementFloors { //✓
    final result = _aboveBasementFloors.map((e) => e.perimeter).reduce((current, next) => current > next ? current : next);
    return result;
  }

  double get _totalFacadeArea { //✓
    final result =  _aboveBasementFloors
        .map((floor) => _maximumPerimeterInAboveBasementFloors * floor.heightWithSlab)
        .fold(0.0, (p, c) => p + c);
    return result;
  }

  double get _totalWindowArea { //✓
    double result = 0;
    for (var floor in floors) {
      for(var floorSection in floor.sections) {
        for(var room in floorSection.rooms) {
          for(var window in room.windows) {
            result += (window.width * window.height);
          }
        }
      }
    }
    return result;
  }

  double get _totalFacadeRailingLength { //✓
    double result = 0;
    for (var floor in floors) {
      for(var floorSection in floor.sections) {
        for(var room in floorSection.rooms) {
          for(var window in room.windows) {
            result += window.hasRailing ? window.width : 0;
          }
        }
      }
    }
    return result;
  }
}
