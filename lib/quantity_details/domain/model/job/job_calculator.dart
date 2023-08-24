import 'package:kost/quantity_details/domain/model/project_constants.dart';
import '../../bloc/quantity_details_state.dart';
import 'job.dart';
import '../floor.dart';

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
