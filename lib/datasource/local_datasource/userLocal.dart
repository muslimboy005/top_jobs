import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_jobs/model/sign_model.dart';

class Userlocal {
  Future<SignModel?> getData() async {
    final prefens = await SharedPreferences.getInstance();
    final data = prefens.getString("user");

    if (data != null) {
      final jsonData = jsonDecode(data);
      return SignModel.fromJson(jsonData);
    }

    return null;
  }

  Future<void> setData({
    required SignModel signModel,
  }) async {
    final prefens = await SharedPreferences.getInstance();
    prefens.setString(
      "user",
      jsonEncode(signModel.toJsonForlocale()),
    );
  }

  Future<void> deleteData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("user");
  }
}
