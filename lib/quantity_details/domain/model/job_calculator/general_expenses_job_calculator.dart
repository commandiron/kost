import '../floor.dart';
import 'job.dart';
import 'job_calculator.dart';

class GeneralExpensesJobCalculator extends JobCalculator {
  GeneralExpensesJobCalculator(
      {super.name = "Genel Giderler",
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
    return GeneralExpensesJobCalculator(
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
      EnclosingTheLand(
          quantity: enclosingTheLandLength,
          quantityExplanation: enclosingTheLandLengthExplanation),
      MobilizationDemobilization(
          quantity: mobilizationDemobilizationNumber,
          quantityExplanation: mobilizationDemobilizationNumberExplanation),
      Crane(quantity: craneHour, quantityExplanation: craneHourExplanation),
      SiteSafety(
          quantity: siteSafetyMonth,
          quantityExplanation: siteSafetyMonthExplanation),
      SiteExpenses(
          quantity: siteExpensesMonth,
          quantityExplanation: siteExpensesMonthExplanation),
      Sergeant(
          quantity: sergeantMonth,
          quantityExplanation: sergeantMonthExplanation),
      SiteChief(
          quantity: siteChiefMonth,
          quantityExplanation: siteChiefMonthExplanation),
      ProjectsFeesPayments(
          quantity: projectsFeesPaymentsNumber,
          quantityExplanation: projectsFeesPaymentsNumberExplanation),
    ];
  }

  Floor get _topFloor {
    final topFloor = floors.reduce((current, next) {
      return current.no > next.no ? current : next;
    });
    return topFloor;
  }

  double get _roughConstructionArea {
    double roughConstructionArea = 0;
    for (var floor in floors) {
      if (floor.no == 0) {
        roughConstructionArea +=
            floors.firstWhere((floor) => floor.no == -1).area;
      } else {
        roughConstructionArea += floor.area;
      }
    }
    roughConstructionArea += _topFloor.area;
    roughConstructionArea += elevationTowerArea;
    return roughConstructionArea;
  }

  //Calculations
  double get enclosingTheLandLength {
    return landPerimeter;
  }

  String get enclosingTheLandLengthExplanation {
    return "Arsa çevresi: $landPerimeter";
  }

  //BURAYA BAK!!!!!!!!!!!!!!!!!!
  double get mobilizationDemobilizationNumber {
    return 1;
  }

  String get mobilizationDemobilizationNumberExplanation {
    return "Götürü bedel";
  }

  double get craneHour {
    return _roughConstructionArea *
        projectConstants.craneHourForOneSquareMeterRoughConstructionArea;
  }

  String get craneHourExplanation {
    return "Kaba inşaat alanı: $_roughConstructionArea x 1 metre kare kaba inşaat alanı için vinç çalışma saati: ${projectConstants.craneHourForOneSquareMeterRoughConstructionArea}";
  }

  double get siteSafetyMonth {
    return projectConstants.projectDurationMonth;
  }

  String get siteSafetyMonthExplanation {
    return "Proje süresi: ${projectConstants.projectDurationMonth}";
  }

  double get siteExpensesMonth {
    return projectConstants.projectDurationMonth;
  }

  String get siteExpensesMonthExplanation {
    return "Proje süresi: ${projectConstants.projectDurationMonth}";
  }

  double get sergeantMonth {
    return projectConstants.projectDurationMonth;
  }

  String get sergeantMonthExplanation {
    return "Proje süresi: ${projectConstants.projectDurationMonth}";
  }

  double get siteChiefMonth {
    return projectConstants.projectDurationMonth;
  }

  String get siteChiefMonthExplanation {
    return "Proje süresi: ${projectConstants.projectDurationMonth}";
  }

  //BURAYA BAK!!!!!!!!!!!!!!!!!!
  double get projectsFeesPaymentsNumber {
    return 1;
  }

  String get projectsFeesPaymentsNumberExplanation {
    return "Götürü bedel";
  }
}
