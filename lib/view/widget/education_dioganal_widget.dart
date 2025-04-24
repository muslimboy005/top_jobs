import 'package:flutter/material.dart';
import 'package:top_jobs/controller/user_controllers/user_edu_controller.dart';
import 'package:top_jobs/model/users/education_model.dart';

class EducationDioganalWidget extends StatefulWidget {
  const EducationDioganalWidget({
    super.key,
    this.educationModel,
    this.isAdd = false,
    this.isFirst = false,
    this.eduId = "13",
    required this.id,
  });
  final EducationModel? educationModel;
  final String id;
  final bool isFirst;
  final bool isAdd;
  final String eduId;

  @override
  State<EducationDioganalWidget> createState() =>
      _EducationDioganalWidget();
}

class _EducationDioganalWidget
    extends State<EducationDioganalWidget> {
  final forumKey = GlobalKey<FormState>();
  final _degreeController = TextEditingController();
  final TextEditingController eduName =
      TextEditingController();
  final TextEditingController startyearcont =
      TextEditingController();
  final TextEditingController endyearcont =
      TextEditingController();
  @override
  void initState() {
    super.initState();
    eduName.text =
        widget.educationModel?.educationName ?? "";
    _degreeController.text =
        widget.educationModel?.degree ?? "";
    List<String> date =
        widget.educationModel?.duration
            .split("-")
            .toList() ??
        ["", ""];
    startyearcont.text = date[0];
    endyearcont.text = date[1];
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: forumKey,
      child: AlertDialog(
        title: Text("Education"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: eduName,
              decoration: InputDecoration(
                labelText: "O'qish joyi nomi",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "O'qish joyi nomi kiritilmagan!";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              readOnly: true,
              onTap: () {},
              controller: _degreeController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Degree",
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: PopupMenuButton<String>(
                  onSelected: (value) {
                    _degreeController.text = value;
                    setState(() {});
                  },
                  icon: Icon(Icons.keyboard_arrow_down),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        value: "bakalavr",
                        child: Text("Bakalavr"),
                      ),
                      PopupMenuItem(
                        value: "magistr",
                        child: Text("Magistr"),
                      ),
                      PopupMenuItem(
                        value: "doktorantura",
                        child: Text("Doktorantura"),
                      ),
                      PopupMenuItem(
                        value: "o'rta maxsus",
                        child: Text("O'rta maxsus"),
                      ),
                    ];
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Companiya tasnifi kiritilmagan!";
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
                    maxLength: 4,
                    keyboardType: TextInputType.number,
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
                        return "O'qishni boshlangan yili kiritilmagan!";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: endyearcont,
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
                        return "O'qishni tugatilgan yili kiritilmagan!";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed:widget.isFirst?null: () {
                    Navigator.pop(context);
                  },
                  child: Text("Bekor qilish"),
                ),
                TextButton(
                  onPressed: () {
                    if (forumKey.currentState!.validate()) {
                      final a = EducationModel(
                        id: widget.eduId,
                        degree: _degreeController.text,
                        
                        duration:
                            "${startyearcont.text}-${endyearcont.text}",
                        educationName: eduName.text,
                      );
                      if (widget.isAdd || widget.isFirst) {
                        UserEducationController(
                          contact: widget.id,
                        ).saveEducationData(
                          educationModel: a,
                        );
                      } else {
                        UserEducationController(
                          contact: widget.id,
                        ).editEducationData(
                          id: widget.eduId,
                          educationModel: a,
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
