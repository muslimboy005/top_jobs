import 'package:top_jobs/datasource/remoute_datasource/admin_datasource/applied_datasouce.dart';

void main(List<String> args) {
  AppliedDatasouce(
    companyId: "admin1",
    jobId: "job1",
  ).getData().then((_) {});
}
