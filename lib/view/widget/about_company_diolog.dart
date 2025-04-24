import 'package:flutter/material.dart';
import 'package:top_jobs/controller/admin_controller/about_company_controller.dart';
import 'package:top_jobs/model/admins/about_company_model.dart';

class AboutCompanyDiolog extends StatefulWidget {
  final AboutCompanyModel? personalModel;
  final bool isFirst;
  final String id;
  const AboutCompanyDiolog({
    super.key,
    this.personalModel,
    this.isFirst = false,
    required this.id,
  });

  @override
  State<AboutCompanyDiolog> createState() =>
      _AboutCompanyDiolog();
}

class _AboutCompanyDiolog
    extends State<AboutCompanyDiolog> {
  final String firstName = "Conpany Name";
  final String secondName = "company Location";
  final String email = "Company image";
  final String phoneNumber = "Company employees";
  final String birthDay = "Company Bio";
  final TextEditingController firstNameCont =
      TextEditingController();
  final TextEditingController secondNameCont =
      TextEditingController();
  final TextEditingController emailCont =
      TextEditingController();
  final TextEditingController birthDayCont =
      TextEditingController();
  final TextEditingController phoneNumCont =
      TextEditingController();

  final forumKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

    birthDayCont.text =
        (widget.personalModel != null
            ? widget.personalModel!.companyBio
            : "");
    emailCont.text =
        widget.personalModel?.companyImage ?? "";
    secondNameCont.text =
        widget.personalModel?.location ?? "";
    firstNameCont.text = widget.personalModel?.name ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: forumKey,
      child: AlertDialog(
        title: Text("About Company"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                controller: firstNameCont,
                decoration: InputDecoration(
                  hintText: firstName,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Company Name kiritilmagan";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: secondNameCont,
                decoration: InputDecoration(
                  hintText: secondName,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "location";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: emailCont,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: email,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "lokatsiya kiritilmagan";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: phoneNumCont,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: phoneNumber,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "bu qisim bosh";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: birthDayCont,

                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: birthDay,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "malumot yoq bunda";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        actions: [
          Row(
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed:
                        widget.isFirst
                            ? null
                            : () {
                              Navigator.pop(context);
                            },
                    child: Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      if (forumKey.currentState!
                          .validate()) {
                        final a = AboutCompanyModel(
                          companyBio: birthDayCont.text,
                          companyImage: emailCont.text,
                          employees: phoneNumCont.text,
                          location: secondNameCont.text,
                          name: firstNameCont.text,
                        );
                        widget.isFirst
                            ? AdminAboutCompanyController(
                              contact: widget.id,
                            ).saveAboutcampanyData(
                              aboutCompanyModel: a,
                            )
                            : AdminAboutCompanyController(
                              contact: widget.id,
                            ).editAboutcompanyData(
                              aboutCompanyModel: a,
                            );
                        Navigator.pop(context);
                      }
                    },
                    child: Text("Ok"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String day(DateTime birthday) {
  return "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}";
}
