import 'package:kost/quantity_details/domain/model/project_constants.dart';
import '../project_variables.dart';
import 'job.dart';
import '../floor/floor.dart';

abstract class JobCalculator {
  final String name;
  final ProjectConstants projectConstants;
  final ProjectVariables projectVariables;
  final List<Floor> floors;

  JobCalculator(
    {
      required this.name,
      required this.projectConstants,
      required this.projectVariables,
      required this.floors
    }
  );

  List<Job> createJobs();
}
