import 'package:top_jobs/datasource/remoute_datasource/admin_datasource/admin_job_datacource.dart';
import 'package:top_jobs/model/admins/job_model.dart';

class AdminJobController {
  final AdminJobDatacource _datasource;

  AdminJobController({required String contact})
      : _datasource = AdminJobDatacource(contact: contact);

  /// Barcha ish o'rinlarini olish
  Future<List<JobModel>> getJobs() async {
    return await _datasource.getData();
  }

  /// Yangi ish o'rnini qo'shish
  Future<void> addJob({required JobModel jobModel}) async {
    await _datasource.setData(jobModel: jobModel);
  }

  /// Ish o'rnini tahrirlash
  Future<void> editJob({
    required String id,
    required JobModel jobModel,
  }) async {
    await _datasource.editData(id: id, jobModel: jobModel);
  }

  /// Ish o'rnini o'chirish
  Future<void> deleteJob({required String id}) async {
    await _datasource.delete(id: id);
  }

  // /// Faqat aktiv ish o'rinlarini olish
  // Future<List<JobModel>> getActiveJobs() async {
  //   List<JobModel> allJobs = await getJobs();
  //   return allJobs.where((job) => job.isActive == true).toList();
  // }
}
