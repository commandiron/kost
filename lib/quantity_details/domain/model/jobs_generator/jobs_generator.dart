import '../../../../common/model/job.dart';

abstract class JobsGenerator {
  JobsGenerator();

  List<Job> createJobs();
}
