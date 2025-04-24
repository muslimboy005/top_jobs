import 'package:top_jobs/datasource/remoute_datasource/admin_datasource/applied_datasouce.dart';

class ApliedConteroller {
  final String companyId;
  final String jobId;

  ApliedConteroller({
    required this.companyId,
    required this.jobId,
  });
  Future<List> getData()async{
  final data =await AppliedDatasouce(companyId: companyId, jobId: jobId).getData();
  return data;
  }
  Future<void> setData({required String userId, required String userJobId})async{
   await AppliedDatasouce(companyId: companyId, jobId: jobId).setData(userId: userId,userJobId: userJobId);
  }
}
