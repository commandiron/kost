import 'package:kost/common/model/job.dart';
import 'package:kost/apartment_details/domain/model/jobs_generator/impl/roof_jobs_generator.dart';
import 'package:kost/apartment_details/domain/model/jobs_generator/impl/rough_construction_jobs_generator.dart';
import 'package:kost/apartment_details/domain/model/jobs_generator/jobs_generator.dart';

import '../../project.dart';
import 'facade_jobs_generator.dart';
import 'general_expenses_jobs_generator.dart';
import 'interior_jobs_generator.dart';
import 'landscape_jobs_generator.dart';

class ApartmentJobsGenerator extends JobsGenerator {
  ApartmentJobsGenerator({
    super.name = "Apartman",
    required this.project,
  });

  final Project project;

  @override
  List<Job> createJobs() {
    final roughConstructionJobsGenerator = RoughConstructionJobsGenerator(
      projectConstants: project.projectConstants,
      projectVariables: project.projectVariables,
      floors: project.floors,
    );

    final roofJobsGenerator = RoofJobsGenerator(
      floors: project.floors,
    );

    final facadeJobsGenerator = FacadeJobsGenerator(
      floors: project.floors,
    );

    final interiorJobsGenerator = InteriorJobsGenerator(
      projectConstants: project.projectConstants,
      floors: project.floors,
    );

    final landscapeJobsGenerator = LandscapeJobsGenerator(
      projectConstants: project.projectConstants,
      projectVariables: project.projectVariables,
      floors: project.floors,
    );

    final generalExpensesJobsGenerator = GeneralExpensesJobsGenerator(
      projectConstants: project.projectConstants,
      projectVariables: project.projectVariables,
      floors: project.floors,
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