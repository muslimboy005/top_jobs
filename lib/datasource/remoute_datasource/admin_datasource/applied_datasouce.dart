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
    final url = Uri.parse(
      "https://topjobs-6fb40-default-rtdb.asia-southeast1.firebasedatabase.app/admins/$companyId/jobs/$jobId/applied.json",
    );
    final data = await http.get(url);
    return jsonDecode(data.body);
  }
}
