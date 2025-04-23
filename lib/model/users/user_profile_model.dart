import 'package:top_jobs/model/users/education_model.dart';
import 'package:top_jobs/model/users/experience_model.dart';
import 'package:top_jobs/model/users/language_model.dart';
import 'package:top_jobs/model/users/personal_model.dart';
import 'package:top_jobs/model/users/skills_model.dart';

class UserProfileModel {
  List<EducationModel> educationModel;
  SkillsModel skillsModel;
  List<ExperienceModel> experienceModel;
  PersonalModel personalModel;
  List<LanguageModel> languageModel;

  UserProfileModel({
    required this.educationModel,
    required this.skillsModel,
    required this.experienceModel,
    required this.personalModel,
    required this.languageModel,
  });
  
}
