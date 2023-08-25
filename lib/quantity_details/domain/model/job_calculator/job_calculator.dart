import '../../../../common/model/job.dart';

abstract class JobCalculator {
  final String name;

  JobCalculator(
    {
      required this.name,
    }
  );

  List<Job> createJobs();
}
