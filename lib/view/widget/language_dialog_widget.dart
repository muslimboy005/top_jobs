import 'package:flutter/material.dart';
import 'package:top_jobs/controller/user_controllers/user_language_controller.dart';
import 'package:top_jobs/model/users/language_model.dart';

class LanguageDialogWidget extends StatefulWidget {
  const LanguageDialogWidget({
    super.key,
    this.languageModel,
    required this.id,
    this.isFirst = false,
    this.isAdd = false,
    this.langId = "12",
  });
  final LanguageModel? languageModel;
  final bool isFirst;
  final bool isAdd;
  final String id;
  final String langId;
  @override
  State<LanguageDialogWidget> createState() =>
      _LanguageDialogWidgetState();
}

class _LanguageDialogWidgetState
    extends State<LanguageDialogWidget> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController languageCont =
      TextEditingController();
  final TextEditingController gradeCont =
      TextEditingController();
  @override
  void initState() {
    languageCont.text = widget.languageModel?.lanName ?? "";
    gradeCont.text = widget.languageModel?.lanGrade ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: AlertDialog(
        title: Text("Language"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: languageCont,
              decoration: InputDecoration(
                labelText: "Language",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Til kiritilmagan";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: gradeCont,
              decoration: InputDecoration(
                labelText: "Grade",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Baho kiritilmagan";
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
                      final a = LanguageModel(
                        lanGrade: gradeCont.text,
                        lanName: languageCont.text,
                      );
                      if (widget.isFirst || widget.isAdd) {
                        UserLanguageController(
                          contact: widget.id,
                        ).saveLanguageData(
                          languageModel: a,
                        );
                      } else {
                        UserLanguageController(
                          contact: widget.id,
                        ).editLanguageData(
                          id: widget.id,
                          languageModel: a,
                        );
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
