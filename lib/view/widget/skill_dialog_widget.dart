import 'package:flutter/material.dart';
import 'package:top_jobs/controller/user_controllers/user_skill_controller.dart';
import 'package:top_jobs/model/users/skills_model.dart';

class SkillDialogWidget extends StatefulWidget {
  const SkillDialogWidget({
    super.key,
    this.skillsModel,
    this.isFirst = false,
    required this.id,
  });
  final SkillsModel? skillsModel;
  final bool isFirst;
  final String id;
  @override
  State<SkillDialogWidget> createState() =>
      _SkillDialogWidgetState();
}

class _SkillDialogWidgetState
    extends State<SkillDialogWidget> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController soft =
      TextEditingController();
  final TextEditingController hard =
      TextEditingController();
  @override
  void initState() {
    super.initState();
    soft.text = widget.skillsModel?.softSkill ?? "";
    hard.text = widget.skillsModel?.hardSkill ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: AlertDialog(
        title: Text("Your Skills"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: hard,
              minLines: 3,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Hard skils",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Tehnik bilimlar kiritilmagan";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: soft,
              minLines: 3,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Soft Skill",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Muomila qobilyati kiritilmagan";
                }
                return null;
              },
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),

                TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final a = SkillsModel(hardSkill: hard.text, softSkill: soft.text);
                      if(widget.isFirst){
                        UserSkillController(contact: widget.id).saveSkillData(skillsModel: a);
                      }
                      else{
                        UserSkillController(contact: widget.id).editSkillData(skillsModel: a);
                        
                      }
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Ok"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
