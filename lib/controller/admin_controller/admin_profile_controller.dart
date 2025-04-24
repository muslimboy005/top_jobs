import 'package:top_jobs/datasource/remoute_datasource/admin_datasource/about_company_datasource.dart';
import 'package:top_jobs/model/admins/about_company_model.dart';
// import 'package:top_jobs/model/admins/admin_model.dart';

class AdminProfileController {
  final AboutCompanyDatasource _datasource;


  AdminProfileController({required String contact})
      : _datasource = AboutCompanyDatasource(contact: contact);


  Future<AboutCompanyModel> getProfileData() async {
    final data = await _datasource.getData();
    return data;
  }

  Future<void> setData({required AboutCompanyModel model}) async {
    await _datasource.setData(aboutCompanyModel: model);
  }

  Future<void> editProfileData({
    required String imageUrl, 
    required AboutCompanyModel aboutCompanyModel, 
  }) async {
    await _datasource.editData( aboutCompanyModel: aboutCompanyModel);
  }

  Future<void> editProfileName({
    required String name, 
    required AboutCompanyModel aboutCompanyModel, 
  }) async {
    await _datasource.editData( aboutCompanyModel: aboutCompanyModel);
  }
  
}
