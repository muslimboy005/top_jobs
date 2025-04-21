import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:top_jobs/model/users/personal_model.dart';

class AboutCompanyDatasource {
  final String contact;

  AboutCompanyDatasource({required this.contact});
  Future<PersonalModel> getData() async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$contact/aboutCompany.json",
    );
    final data = await http.get(url);
    final decodedData = jsonDecode(data.body);
    return PersonalModel.fromJson(decodedData);
  }

  Future<void> setData({
    required PersonalModel personalModel,
  }) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$contact/aboutCompany.json",
    );
    await http.patch(
      url,
      body: jsonEncode({personalModel.toJson()}),
    );
  }

  Future<void> editData({
    required PersonalModel personalModel,
  }) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$contact/aboutCompany.json",
    );
    await http.put(url, body: personalModel.toJson());
  }
}
