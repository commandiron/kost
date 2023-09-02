import '../../../../common/model/job.dart';

abstract class JobsGenerator {
  JobsGenerator(
    {
      required this.name,
    }
  );
  
  final String name;

  List<Job> createJobs();

  double calculation(double Function() value) {
    return value.call();
  }
  String explanation(String Function() value) {
    return value.call();
  }
}
