import 'package:shared_preferences/shared_preferences.dart';

class AppPasswordLocalDatasource {
  final passwordKey = "password";
  final enableKey = "password_enabled";
  Future<void> savePassword(String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString(passwordKey, password);
  }

  Future<String?> getPassword() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getString(passwordKey);
  }

  Future<void> setPasswordEnabled(bool value) async {
    final pref = await SharedPreferences.getInstance();

    await pref.setBool(enableKey, value);
  }

  Future<bool> isPasswordEnabled() async {
    final pref = await SharedPreferences.getInstance();

    return pref.getBool(enableKey) ?? false;
  }
}
