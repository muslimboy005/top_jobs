import 'package:top_jobs/controller/user_controllers/user_experience_controller.dart';
import 'package:top_jobs/controller/user_controllers/user_skill_controller.dart';
import 'package:top_jobs/datasource/remoute_datasource/user_datasource/user_history_datasource.dart';
import 'package:top_jobs/model/users/experience_model.dart';
import 'package:top_jobs/model/users/skills_model.dart';

void main(List<String> args) {
  UserExperienceController(contact: "user1").saveExperienceData(experienceModel: ExperienceModel(id: "1", companyName: "google", period: "2025-2026", position: "flutter devoloper", responsibility: "prosta"));
}
