import 'package:top_jobs/datasource/remoute_datasource/admin_datasource/admin_register_datasource.dart';
import 'package:top_jobs/model/sign_model.dart';

class AdminRegisterController {
  final adminRegisterDatasource = AdminRegisterDatasource();

  Future<String> saveRegisterData({
    required String email,
    required String password,
  }) async {
    return AdminRegisterDatasource().setData(
      contact: email,
      password: password,
    );
  }

  Future<List<SignModel>> getRegisterData() async {
    final userGetedData =
        await adminRegisterDatasource.getData();
    return userGetedData;
  }

  void editRegisterData({
    required String email,
    required String password,
  }) {
    adminRegisterDatasource.editPasswordByContact(
      contact: email,
      newPassword: password,
    );
  }
}
