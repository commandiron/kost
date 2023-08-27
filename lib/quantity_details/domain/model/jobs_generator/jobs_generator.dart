import '../../../../common/model/job.dart';

abstract class JobsGenerator {
  JobsGenerator(
    {
      required this.name,
    }
  );
  
  final String name;

  List<Job> createJobs();
}
