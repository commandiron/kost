import '../../floor/floor.dart';
import '../../../../../common/model/job.dart';
import '../jobs_generator.dart';

class FacadeJobsGenerator extends JobsGenerator {
  FacadeJobsGenerator({
    super.name = "Cephe",
    required this.floors,
  });

  final List<Floor> floors;

  @override
  List<Job> createJobs() {
    return [
      FacadeScaffolding(
        quantityBuilder: () {
          return _totalFacadeArea;
        },
        quantityExplanationBuilder: () {
          return "Toplam cephe alanı: $_totalFacadeArea";
        },
      ),
      Windows(
        quantityBuilder: () {
          return _totalWindowArea;
        },
        quantityExplanationBuilder: () {
          return "Toplam pencere alanı: $_totalWindowArea";
        },
      ),
      FacadeRails(
        quantityBuilder: () {
          return _totalFacadeRailingLength;
        },
        quantityExplanationBuilder: () {
          return "Toplam cephe korkuluğu uzunluğu: $_totalFacadeRailingLength";
        },
      ),
      FacadeSystem(
        quantityBuilder: () {
          return _totalFacadeArea;
        },
        quantityExplanationBuilder: () {
          return "Toplam cephe alanı: $_totalFacadeArea";
        },
      )
    ];
  }

  List<Floor> get _aboveBasementFloors {
    return floors.where((floor) => floor.no >= 0).toList();
  }

  double get _totalFacadeArea {
    return _aboveBasementFloors
        .map((floor) => floor.perimeter * floor.heightWithSlab)
        .fold(0.0, (p, c) => p + c);
  }

  double get _totalWindowArea {
    double totalWindowArea = 0;
    for (var floor in floors) {
      final windowAreas = floor.windows
          .map((window) => window.width * window.height * window.count);
      totalWindowArea += windowAreas.fold(0.0, (p, c) => p + c);
    }
    return totalWindowArea;
  }

  double get _totalFacadeRailingLength {
    double totalFacadeRailingLength = 0;
    for (var floor in floors) {
      final facadeRailingLengths = floor.windows
          .map((window) => window.hasRailing ? window.width * window.count : 0);
      totalFacadeRailingLength +=
          facadeRailingLengths.fold(0.0, (p, c) => p + c);
    }
    return totalFacadeRailingLength;
  }
}
