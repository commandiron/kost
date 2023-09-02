import '../../floor/floor.dart';
import '../../../../../common/model/job.dart';
import '../../project_constants.dart';
import '../../project_variables.dart';
import '../jobs_generator.dart';

class LandscapeJobsGenerator extends JobsGenerator {
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
      LandScapeGarden(
        quantityCalculationBuilder: () {
          return (projectVariables.landArea - _groundFloor.area) *
              projectConstants.gardenOutdoorParkingAreaRate;
        },
        quantityExplanationBuilder: () {
          return "Arsa alanı: ${projectVariables.landArea}- Zemin kat alanı: ${_groundFloor.area} x Bahçe Oranı: ${projectConstants.gardenOutdoorParkingAreaRate}";
        },
      ),
      OutdoorParkingTile(
        quantityCalculationBuilder: () {
          return (projectVariables.landArea - _groundFloor.area) *
              (1 - projectConstants.gardenOutdoorParkingAreaRate);
        },
        quantityExplanationBuilder: () {
          return "Arsa alanı: ${projectVariables.landArea} - Zemin kat alanı: ${_groundFloor.area} x Açık otopark oranı: 1 - Bahçe Oranı: ${projectConstants.gardenOutdoorParkingAreaRate}";
        },
      ),
      CarLift(
        quantityCalculationBuilder: () {
          return _basementFloors.length + 1;
        },
        quantityExplanationBuilder: () {
          return "Bodrum kat adedi: ${_basementFloors.length} + Zemin kat adedi: 1";
        },
      ),
      AutomaticBarrier(
        quantityCalculationBuilder: () {
          return projectConstants.automaticBarrierNumber.toDouble();
        },
        quantityExplanationBuilder: () {
          return "Otomatik bariyer adedi: ${projectConstants.automaticBarrierNumber}";
        },
      ),
    ];
  }

  Floor get _groundFloor {
    final groundFloor = floors.firstWhere(
      (floor) => floor.no == 0,
      orElse: () => throw Exception("No ground floor"),
    );
    return groundFloor;
  }

  List<Floor> get _basementFloors {
    final basementFloors = floors.where((element) => element.no < 0).toList();
    if (basementFloors.isEmpty) {
      throw Exception("No basement floor");
    }
    return basementFloors;
  }
}
