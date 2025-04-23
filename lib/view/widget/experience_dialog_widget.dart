import 'package:flutter/material.dart';
import 'package:top_jobs/controller/user_controllers/user_experience_controller.dart';
import 'package:top_jobs/model/users/experience_model.dart';

class ExperienceDialogWidget extends StatefulWidget {
  const ExperienceDialogWidget({
    super.key,
    this.experienceModel,
    this.isAdd = false,
    this.isFirst = false,
    this.expId = "13",
    required this.id,
  });
  final ExperienceModel? experienceModel;
  final String id;
  final bool isFirst;
  final bool isAdd;
  final String expId;
  @override
  State<ExperienceDialogWidget> createState() =>
      _ExperienceDialogWidgetState();
}

class _ExperienceDialogWidgetState
    extends State<ExperienceDialogWidget> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController compNameCont =
      TextEditingController();
  final TextEditingController positionCont =
      TextEditingController();
  final TextEditingController responCont =
      TextEditingController();
  final TextEditingController startyearcont =
      TextEditingController();
  final TextEditingController stopyearcont =
      TextEditingController();
  @override
  void initState() {
    super.initState();
    compNameCont.text =
        widget.experienceModel?.companyName ?? "";
    positionCont.text =
        widget.experienceModel?.position ?? "";
    responCont.text =
        widget.experienceModel?.responsibility ?? "";
    List<String> date =
        widget.experienceModel?.period
            .split("-")
            .toList() ??
        ["", ""];
    startyearcont.text = date[0];
    stopyearcont.text = date[1];
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: AlertDialog(
        title: Text("Experience"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: compNameCont,
              decoration: InputDecoration(
                labelText: "Company Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Kompaniya nomi kiritilmagan";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: positionCont,

              decoration: InputDecoration(
                labelText: "Position",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "ish o'rningiz kiritilmagan";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    controller: startyearcont,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    decoration: InputDecoration(
                      labelText: "Start year",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Boshlanish yili kiritilmagan";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: stopyearcont,
                    maxLength: 4,
                    decoration: InputDecoration(
                      labelText: "End year",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Tugash yili kiritilmagan";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: responCont,
              maxLines: 3,
              minLines: 3,
              decoration: InputDecoration(
                labelText: "Ishdan boshash sababi",

                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Ishdan boshash sababi kiritilmagan";
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
                      final a = ExperienceModel(
                        companyName: compNameCont.text,
                        period:
                            "${startyearcont.text}-${stopyearcont.text}",
                        position: positionCont.text,
                        responsibility: responCont.text,
                      );
                      if (widget.isAdd || widget.isFirst) {
                        UserExperienceController(
                          contact: widget.id,
                        ).saveExperienceData(
                          experienceModel: a,
                        );
                      } else {
                        UserExperienceController(
                          contact: widget.id,
                        ).editExperienceData(
                          id: widget.expId,
                          experienceModel: a,
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
