import '../../floor/floor.dart';
import '../../../../../common/model/job.dart';
import '../../project_constants.dart';
import '../../project_variables.dart';
import '../jobs_generator.dart';

class LandscapeJobsGenerator extends JobsGenerator { //✓
  LandscapeJobsGenerator({
    super.name = "Peysaj",
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
      LandScapeGarden( //✓
        quantityBuilder: () {
          return (projectVariables.landArea - _groundFloor.area) *
              projectConstants.gardenOutdoorParkingAreaRate;
        },
      ),
      OutdoorParkingTile( //✓
        quantityBuilder: () {
          return (projectVariables.landArea - _groundFloor.area) *
              (1 - projectConstants.gardenOutdoorParkingAreaRate);
        },
      ),
      CarLift( //✓
        quantityBuilder: () {
          return _allBasementFloors.length + 1;
        },
      ),
      AutomaticBarrier( //✓
        quantityBuilder: () {
          return projectConstants.automaticBarrierNumber;
        },
      ),
    ];
  }

  Floor get _groundFloor { //✓
    final result = floors.firstWhere(
      (floor) => floor.no == 0,
      orElse: () => throw Exception("No ground floor"),
    );
    return result;
  }

  List<Floor> get _allBasementFloors { //✓
    final result = floors.where((floor) => floor.no < 0).toList();
    if (result.isEmpty) {
      throw Exception("No basement floor");
    }
    return result;
  }
}
