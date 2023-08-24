import '../floor.dart';
import 'job.dart';
import 'job_calculator.dart';

class LandscapeJobCalculator extends JobCalculator {
  LandscapeJobCalculator(
      {super.name = "Peysaj Maliyeti",
      required super.projectConstants,
      required super.projectVariables,
      required super.floors});

  @override
  List<Job> createJobs() {
    return [
      LandScapeGarden(
          quantity: landScapeGardenArea,
          quantityExplanation: landScapeGardenAreaExplanation),
      OutdoorParkingTile(
          quantity: outdoorParkingTileArea,
          quantityExplanation: outdoorParkingTileAreaExplanation),
      CarLift(
          quantity: carLiftStop, quantityExplanation: carLiftStopExplanation),
      AutomaticBarrier(
          quantity: automaticBarrierNumber,
          quantityExplanation: automaticBarrierNumberExplanation),
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

  //Calculations
  double get landScapeGardenArea {
    return (projectVariables.landArea - _groundFloor.area) *
        projectConstants.gardenOutdoorParkingAreaRate;
  }

  String get landScapeGardenAreaExplanation {
    return "Arsa alanı: ${projectVariables.landArea}- Zemin kat alanı: ${_groundFloor.area} x Bahçe Oranı: ${projectConstants.gardenOutdoorParkingAreaRate}";
  }

  double get outdoorParkingTileArea {
    return (projectVariables.landArea - _groundFloor.area) *
        (1 - projectConstants.gardenOutdoorParkingAreaRate);
  }

  String get outdoorParkingTileAreaExplanation {
    return "Arsa alanı: ${projectVariables.landArea} - Zemin kat alanı: ${_groundFloor.area} x Açık otopark oranı: 1 - Bahçe Oranı: ${projectConstants.gardenOutdoorParkingAreaRate}";
  }

  double get carLiftStop {
    return _basementFloors.length + 1;
  }

  String get carLiftStopExplanation {
    return "Bodrum kat adedi: ${_basementFloors.length} + Zemin kat adedi: 1";
  }

  double get automaticBarrierNumber {
    return projectConstants.automaticBarrierNumber.toDouble();
  }

  String get automaticBarrierNumberExplanation {
    return "Otomatik bariyer adedi: ${projectConstants.automaticBarrierNumber}";
  }
}
