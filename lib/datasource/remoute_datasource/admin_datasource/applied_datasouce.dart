import 'dart:convert';

import 'package:http/http.dart' as http;

class AppliedDatasouce {
  final String companyId;
  final String jobId;

  AppliedDatasouce({
    required this.companyId,
    required this.jobId,
  });

  Future<List> getData() async {
    List all = [];
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$companyId/jobs/$jobId/applied.json",
    );
    final url2 = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$companyId/jobs/$jobId.json",
    );
    final data = await http.get(url2);
    final decodeData = jsonDecode(data.body) as Map;
    final keylar = decodeData.keys.toList();
    if (keylar.contains("applied")) {
      final data = await http.get(url);
      all = jsonDecode(data.body);
    }

    return all;
  }

  Future<void> setData({
    required String userId,
    required String userJobId,
  }) async {
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$companyId/jobs/$jobId/applied.json",
    );
    final all = await getData();
    all.add(userId);
    all.add(userJobId);
    all.toList();
    await http.put(url, body: jsonEncode(all));
  }
}
