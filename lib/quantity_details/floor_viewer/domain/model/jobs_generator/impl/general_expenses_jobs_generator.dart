import 'package:collection/collection.dart';

import '../../floor/floor.dart';
import '../../../../../../common/model/job.dart';
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
      EnclosingTheLand( //✓
        quantityBuilder: () {
          return projectVariables.landPerimeter;
        },
      ),
      MobilizationDemobilization( //✓
        quantityBuilder: () {
          return 1;
        },
      ),
      Crane(
        quantityBuilder: () { //✓
          return _roughConstructionArea *
              projectConstants.craneHourForOneSquareMeterRoughConstructionArea;
        },
      ),
      SiteSafety( //✓
        quantityBuilder: () {
          return projectConstants.projectDurationMonth;
        },
      ),
      SiteExpenses( //✓
        quantityBuilder: () {
          return projectConstants.projectDurationMonth;
        },
      ),
      Sergeant( //✓
        quantityBuilder: () {
          return projectConstants.projectDurationMonth;
        },
      ),
      SiteChief( //✓
        quantityBuilder: () {
          return projectConstants.projectDurationMonth;
        },
      ),
      ProjectsFeesPayments( //✓
        quantityBuilder: () {
          return 1;
        },
      ),
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

  double get _roughConstructionArea { //✓
    double result = 0;
    result += projectVariables.foundationArea;
    result += _floorToCeilingAreaMap.values.fold(0.0, (p, c) => p + c);
    result += projectVariables.elevationTowerArea;
    return result;
  }
}
