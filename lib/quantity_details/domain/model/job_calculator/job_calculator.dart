import 'package:collection/collection.dart';
import 'package:kost/quantity_details/domain/model/project_constants.dart';
import 'package:kost/quantity_details/domain/model/room.dart';
import '../../../../cost_table/domain/model/unit_price/unit_price.dart';
import '../job.dart';
import '../floor.dart';

abstract class JobCalculator {
  final String name;
  final ProjectConstants projectConstants;
  final double landArea;
  final double landPerimeter;
  final double excavationArea;
  final double excavationPerimeter;
  final double coreCurtainLength;
  final double curtainsExceeding1MeterLength;
  final double basementCurtainLength;
  final double columnsLess1MeterPerimeter;
  final double elevationTowerArea;
  final double elevationTowerHeightWithoutSlab;
  List<Floor> floors;

  JobCalculator(
      {required this.name,
      required this.projectConstants,
      required this.landArea,
      required this.landPerimeter,
      required this.excavationArea,
      required this.excavationPerimeter,
      required this.coreCurtainLength,
      required this.curtainsExceeding1MeterLength,
      required this.basementCurtainLength,
      required this.columnsLess1MeterPerimeter,
      required this.elevationTowerArea,
      required this.elevationTowerHeightWithoutSlab,
      required this.floors}) {
    sortFloors();
  }

  void sortFloors() {
    floors = floors.sorted((a, b) => a.no.compareTo(b.no)).reversed.toList();
  }

  JobCalculator get newInstance;

  List<Job> createJobs();
}