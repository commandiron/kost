import 'package:kost/common/model/job.dart';
import 'package:kost/quantity_details/domain/model/jobs_generator/impl/roof_jobs_generator.dart';
import 'package:kost/quantity_details/domain/model/jobs_generator/jobs_generator.dart';

import '../../floor/floor.dart';
import '../../job_calculator/impl/rough_construction_jobs_generatordart';
import '../../project_constants.dart';
import '../../project_variables.dart';
import 'facade_jobs_generator.dart';
import 'general_expenses_jobs_generator.dart';
import 'interior_jobs_generator.dart';
import 'landscape_jobs_generator.dart';

class ApartmentJobsGenerator extends JobsGenerator {

  ApartmentJobsGenerator({
    required this.projectConstants,
    required this.projectVariables,
    required this.floors,
  });

  final ProjectConstants projectConstants;
  final ProjectVariables projectVariables;
  final List<Floor> floors;


  @override
  List<Job> createJobs() {
    final roughConstructionJobsGenerator = RoughConstructionJobsGenerator(
      projectConstants: projectConstants,
      projectVariables: projectVariables,
      floors: floors,
    );

    final roofJobsGenerator = RoofJobsGenerator(
      floors: floors,
    );

    final facadeJobsGenerator = FacadeJobsGenerator(
      floors: floors,
    );

    final interiorJobsGenerator = InteriorJobsGenerator(
      projectConstants: projectConstants,
      floors: floors,
    );

    final landscapeJobsGenerator = LandscapeJobsGenerator(
      projectConstants: projectConstants,
      projectVariables: projectVariables,
      floors: floors,
    );

    final generalExpensesJobsGenerator = GeneralExpensesJobsGenerator(
      projectConstants: projectConstants,
      projectVariables: projectVariables,
      floors: floors,
    );

    return [
      ...roughConstructionJobsGenerator.createJobs(),
      ...roofJobsGenerator.createJobs(),
      ...facadeJobsGenerator.createJobs(),
      ...interiorJobsGenerator.createJobs(),
      ...landscapeJobsGenerator.createJobs(),
      ...generalExpensesJobsGenerator.createJobs()
    ];
  }

}