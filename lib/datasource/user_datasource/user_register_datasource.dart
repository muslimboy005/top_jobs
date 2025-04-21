import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:top_jobs/model/sign_model.dart';
import 'package:top_jobs/model/users/users_model.dart';

class UserRegisterDatasource {
  Future<List<SignModel>> getData() async {
    List<SignModel> usersSign = [];
    final uri = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users.json",
    );

    final data = await http.get(uri);
    final decodedData = jsonDecode(data.body) as Map;
    final keys = decodedData.keys.toList();
    for (var i in keys) {
      decodedData[i]["sign"]["id"] = i;
      usersSign.add(
        SignModel.fromJson(decodedData[i]["sign"]),
      );
    }
    return usersSign;
  }

  Future<void> setData({
    required String contact,
    required String password,
  }) async {
    final uri = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users.json",
    );

    UsersModel usersModel = UsersModel(
      contact: contact,
      password: password,
    );

    await http.post(
      uri,
      body: jsonEncode(usersModel.models()),
    );
  }

  Future<void> editPasword({
    required String contact,
    required String password,
  }) async {
    final uri = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/users/$contact/sign.json",
    );
    http.patch(
      uri,
      body: jsonEncode({"password": password}),
    );
  }
}
