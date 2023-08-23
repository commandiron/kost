import 'package:kost/quantity_details/domain/model/job/calculators/solo/roof_job_calculator.dart';
import 'package:kost/quantity_details/domain/model/job/calculators/solo/rough_construction_job_calculator.dart';

import '../../job.dart';
import '../solo/general_expenses_job_calculator.dart';
import '../solo/interior_job_calculator.dart';
import '../../job_calculator.dart';
import '../solo/landscape_job_calculator.dart';

class ApartmentJobsCalculator extends JobCalculator {
  ApartmentJobsCalculator(
      {super.name = "Apartman Maliyeti",
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
    return ApartmentJobsCalculator(
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
    final roughConstructionJobCalculator = RoughConstructionJobCalculator(
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
    final roofJobCalculator = RoofJobCalculator(
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
    final interiorJobCalculator = InteriorJobCalculator(
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
    final landscapeJobCalculator = LandscapeJobCalculator(
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
    final generalExpensesJobCalculator = GeneralExpensesJobCalculator(
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
    return [
      ...roughConstructionJobCalculator.createJobs(),
      ...roofJobCalculator.createJobs(),
      ...interiorJobCalculator.createJobs(),
      ...landscapeJobCalculator.createJobs(),
      ...generalExpensesJobCalculator.createJobs()
    ];
  }
}
