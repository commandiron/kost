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
      final windowAreas = floor.windows
          .map((window) => window.width * window.height * window.count);
      result += windowAreas.fold(0.0, (p, c) => p + c);
    }
    return result;
  }

  double get _totalFacadeRailingLength { //✓
    double result = 0;
    for (var floor in floors) {
      final facadeRailingLengths = floor.windows
          .map((window) => window.hasRailing ? window.width * window.count : 0);
      result +=
          facadeRailingLengths.fold(0.0, (p, c) => p + c);
    }
    return result;
  }
}
