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
        quantityBuilder: () {
          return projectVariables.landPerimeter;
        },
        quantityExplanationBuilder: () {
          return "Arsa çevresi: ${projectVariables.landPerimeter}";
        },
      ),
      MobilizationDemobilization(
        quantityBuilder: () {
          //BURAYA BAK!!!!!!!!!!!!!!!!!!
          return 1;
        },
        quantityExplanationBuilder: () {
          return "Götürü bedel";
        },
      ),
      Crane(
        quantityBuilder: () {
          return _roughConstructionArea *
              projectConstants.craneHourForOneSquareMeterRoughConstructionArea;
        },
        quantityExplanationBuilder: () {
          return "Kaba inşaat alanı: $_roughConstructionArea x 1 metre kare kaba inşaat alanı için vinç çalışma saati: ${projectConstants.craneHourForOneSquareMeterRoughConstructionArea}";
        },
      ),
      SiteSafety(
        quantityBuilder: () {
          return projectConstants.projectDurationMonth;
        },
        quantityExplanationBuilder: () {
          return "Proje süresi: ${projectConstants.projectDurationMonth}";
        },
      ),
      SiteExpenses(
        quantityBuilder: () {
          return projectConstants.projectDurationMonth;
        },
        quantityExplanationBuilder: () {
          return "Proje süresi: ${projectConstants.projectDurationMonth}";
        },
      ),
      Sergeant(
        quantityBuilder: () {
          return projectConstants.projectDurationMonth;
        },
        quantityExplanationBuilder: () {
          return "Proje süresi: ${projectConstants.projectDurationMonth}";
        },
      ),
      SiteChief(
        quantityBuilder: () {
          return projectConstants.projectDurationMonth;
        },
        quantityExplanationBuilder: () {
          return "Proje süresi: ${projectConstants.projectDurationMonth}";
        },
      ),
      ProjectsFeesPayments(
        quantityBuilder: () {
          return 1;
        },
        quantityExplanationBuilder: () {
          return "Götürü bedel";
        },
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
}
