import 'package:top_jobs/datasource/admin_datasource/comment_datasource.dart';

void main(List<String> args) {
  print("main ishladi");
  CommentDatasource(companyId: "admin1",jobId: "job1",contact: "user1").editData(id: "user1", soz: "salom akobir");
  
}