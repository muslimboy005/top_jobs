import 'package:top_jobs/datasource/remoute_datasource/user_datasource/user_education_datasource.dart';
import 'package:top_jobs/datasource/remoute_datasource/user_datasource/user_experiance_datasource.dart';
import 'package:top_jobs/datasource/remoute_datasource/user_datasource/user_language_datasource.dart';
import 'package:top_jobs/datasource/remoute_datasource/user_datasource/user_personal_datasource.dart';
import 'package:top_jobs/datasource/remoute_datasource/user_datasource/user_skill_datasource.dart';

import 'package:top_jobs/model/users/education_model.dart';
import 'package:top_jobs/model/users/experience_model.dart';
import 'package:top_jobs/model/users/language_model.dart';
import 'package:top_jobs/model/users/personal_model.dart';
import 'package:top_jobs/model/users/skills_model.dart';
import 'package:top_jobs/model/users/user_profile_model.dart';

class UserProfileController {
  final UserEducationDatasource _educationDatasource;
  final UserExperianceDatasource _experianceDatasource;
  final UserLanguageDatasource _languageDatasource;
  final UserPersonalDatasource _personalDatasource;
  final UserSkillDatasource _skillDatasource;

  UserProfileController({required String contact})
    : _educationDatasource = UserEducationDatasource(
        contact: contact,
      ),
      _experianceDatasource = UserExperianceDatasource(
        contact: contact,
      ),
      _languageDatasource = UserLanguageDatasource(
        contact: contact,
      ),
      _personalDatasource = UserPersonalDatasource(
        contact: contact,
      ),
      _skillDatasource = UserSkillDatasource(
        contact: contact,
      );

  Future<UserProfileModel> getdata() async {
    final edu = await _getEducationData();
    final exp = await _getExperienceData();
    final skil = await _getSkillData();
    final lan = await _getLanguageData();
    final personal = await _getPersonalData();
    return UserProfileModel(
      educationModel: edu,
      skillsModel: skil,
      experienceModel: exp,
      personalModel: personal,
      languageModel: lan,
    );
  }

  Future<List<EducationModel>> _getEducationData() async {
    final data = await _educationDatasource.getData();
    return data;
  }

  Future<List<ExperienceModel>> _getExperienceData() async {
    final data = await _experianceDatasource.getData();
    return data;
  }

  Future<List<LanguageModel>> _getLanguageData() async {
    final data = await _languageDatasource.getData();
    return data;
  }

  Future<PersonalModel> _getPersonalData() async {
    final data = await _personalDatasource.getData();
    return data;
  }

  Future<SkillsModel> _getSkillData() async {
    final data = await _skillDatasource.getData();
    return data;
  }
}
