import '../floor.dart';
import 'job.dart';
import 'job_calculator.dart';

class FacadeJobCalculator extends JobCalculator {
  FacadeJobCalculator(
      {super.name = "Cephe Maliyeti",
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
    return FacadeJobCalculator(
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
      FacadeScaffolding(
          quantity: facadeScaffoldingArea,
          quantityExplanation: facadeScaffoldingAreaExplanation),
      Windows(
          quantity: windowsArea, quantityExplanation: windowAreaExplanation),
      FacadeRails(
          quantity: facadeRailsLength,
          quantityExplanation: facadeRailsLengthExplanation),
      FacadeSystem(
          quantity: facadeSystemArea,
          quantityExplanation: facadeSystemAreaExplanation)
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

  //Calculations
  double get facadeScaffoldingArea {
    return _totalFacadeArea;
  }

  String get facadeScaffoldingAreaExplanation {
    return "Toplam cephe alanı: $_totalFacadeArea";
  }

  double get windowsArea {
    return _totalWindowArea;
  }

  String get windowAreaExplanation {
    return "Toplam pencere alanı: $_totalWindowArea";
  }

  double get facadeRailsLength {
    return _totalFacadeRailingLength;
  }

  String get facadeRailsLengthExplanation {
    return "Toplam cephe korkuluğu uzunluğu: $_totalFacadeRailingLength";
  }

  double get facadeSystemArea {
    return _totalFacadeArea;
  }

  String get facadeSystemAreaExplanation {
    return "Toplam cephe alanı: $_totalFacadeArea";
  }
}
