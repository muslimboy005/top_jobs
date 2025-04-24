import 'package:top_jobs/datasource/local_datasource/userLocal.dart';

class UserLocalController {
  final userLocal = Userlocal();

  Future<void> deleteUser() async {
    await userLocal.deleteData();
  }
}
