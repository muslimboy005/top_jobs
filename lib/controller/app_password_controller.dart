import 'package:top_jobs/datasource/local_datasource/app_password_local_datasource.dart';

class AppPasswordController {
  final appPassword = AppPasswordLocalDatasource();
  String password = "";

  //Parolni olish
  Future<String> getPassword() async {
    final result = await appPassword.getPassword();
    if (result != null) {
      password = result;
    }
    return password;
  }

  //Parol borligini tekshirish
  bool hasPassword() {
    return password.isNotEmpty;
  }

  //Parolni saqlash
  Future<void> savePassword(String newPassword) async {
    await appPassword.savePassword(newPassword);
    password = newPassword;
  }

  //Parolni tekshirish
  bool checkPassword(String input) {
    return input == password;
  }

  Future<void> setPasswordEnabled(bool value) async {
    await appPassword.setPasswordEnabled(value);
  }

  Future<bool> isPasswordEnabled() async {
    return await appPassword.isPasswordEnabled();
  }
}
