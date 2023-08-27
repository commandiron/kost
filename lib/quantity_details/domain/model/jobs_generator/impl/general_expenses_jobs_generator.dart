import '../../floor/floor.dart';
import '../../../../../common/model/job.dart';
import '../../project_constants.dart';
import '../../project_variables.dart';
import '../jobs_generator.dart';

class GeneralExpensesJobsGenerator extends JobsGenerator {
  GeneralExpensesJobsGenerator({
    super.name = "Gener Giderler",
    required this.projectConstants,
    required this.projectVariables,
    required this.floors,
  });

  final ProjectConstants projectConstants;
  final ProjectVariables projectVariables;
  final List<Floor> floors;

  @override
  List<Job> createJobs() {
    return [
      EnclosingTheLand(
        quantity: enclosingTheLandLength,
        quantityExplanation: enclosingTheLandLengthExplanation,
      ),
      MobilizationDemobilization(
        quantity: mobilizationDemobilizationNumber,
        quantityExplanation: mobilizationDemobilizationNumberExplanation,
      ),
      Crane(
        quantity: craneHour,
        quantityExplanation: craneHourExplanation,
      ),
      SiteSafety(
        quantity: siteSafetyMonth,
        quantityExplanation: siteSafetyMonthExplanation,
      ),
      SiteExpenses(
        quantity: siteExpensesMonth,
        quantityExplanation: siteExpensesMonthExplanation,
      ),
      Sergeant(
        quantity: sergeantMonth,
        quantityExplanation: sergeantMonthExplanation,
      ),
      SiteChief(
        quantity: siteChiefMonth,
        quantityExplanation: siteChiefMonthExplanation,
      ),
      ProjectsFeesPayments(
        quantity: projectsFeesPaymentsNumber,
        quantityExplanation: projectsFeesPaymentsNumberExplanation,
      ),
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
    roughConstructionArea += projectVariables.elevationTowerArea;
    return roughConstructionArea;
  }

  //Calculations
  double get enclosingTheLandLength {
    return projectVariables.landPerimeter;
  }

  String get enclosingTheLandLengthExplanation {
    return "Arsa çevresi: ${projectVariables.landPerimeter}";
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
