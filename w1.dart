import 'package:top_jobs/datasource/remoute_datasource/admin_datasource/applied_datasouce.dart';
import 'package:top_jobs/datasource/remoute_datasource/user_datasource/user_history_datasource.dart';

void main(List<String> args) {
  UserHistoryDatasource(contact: "user1").getData().then((
    value,
  ) {
    print(value);
  });
}
