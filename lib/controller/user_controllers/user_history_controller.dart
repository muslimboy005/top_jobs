import 'package:top_jobs/datasource/remoute_datasource/user_datasource/user_history_datasource.dart';
import 'package:top_jobs/model/users/history_model.dart';

class UserHistoryController {
  final UserHistoryDatasource _datasource;

  UserHistoryController({required String contact})
    : _datasource = UserHistoryDatasource(contact: contact);

  Future<List<HistoryModel>> getExperienceData() async {
    final data = await _datasource.getData();
    return data;
  }

  Future<void> savehistoryData({
    required HistoryModel historyModel,
  }) async {
    await _datasource.setData(historyModel: historyModel);
  }

  Future<void> deleteHistoryData({required String id}) async {
    await _datasource.delete(id: id);
  }
}
