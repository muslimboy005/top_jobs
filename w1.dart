import 'package:top_jobs/controller/user_controllers/user_skill_controller.dart';
import 'package:top_jobs/datasource/remoute_datasource/user_datasource/user_history_datasource.dart';
import 'package:top_jobs/model/users/skills_model.dart';

void main(List<String> args) {
  UserSkillController(contact: "-OOWxHAp7QKqYuOnp8YA").saveSkillData(skillsModel: SkillsModel(hardSkill: "hello", softSkill: "uzb"));
}
