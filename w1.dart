import 'package:top_jobs/datasource/remoute_datasource/admin_datasource/comment_datasource.dart';
import 'package:top_jobs/datasource/remoute_datasource/user_datasource/user_register_datasource.dart';

void main(List<String> args) {
  UserRegisterDatasource()
      .setData(
        contact: "vali@gmail.com",
        password: "123456",
      )
      .then((value) {
        print(value);
      });
}
