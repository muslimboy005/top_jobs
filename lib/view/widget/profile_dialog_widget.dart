import 'package:flutter/material.dart';
import 'package:top_jobs/controller/user_controllers/user_personal_controller.dart';
import 'package:top_jobs/model/users/personal_model.dart';

class ProfileDialogWidget extends StatefulWidget {
  final PersonalModel? personalModel;
  final bool isFirst;
  final String id;
  const ProfileDialogWidget({
    super.key,
    this.personalModel,
    this.isFirst = false,
    required this.id,
  });

  @override
  State<ProfileDialogWidget> createState() =>
      _ProfileDialogWidget();
}

class _ProfileDialogWidget
    extends State<ProfileDialogWidget> {
  final String firstName = "First Name";
  final String secondName = "Second Name";
  final String email = "Email";
  final String phoneNumber = "Phone Number";
  final String birthDay = "Birth day";
  final String image = "Image";
  final TextEditingController _genderController =
      TextEditingController();
  final TextEditingController firstNameCont =
      TextEditingController();
  final TextEditingController secondNameCont =
      TextEditingController();
  final TextEditingController emailCont =
      TextEditingController();
  final TextEditingController birthDayCont =
      TextEditingController();
  final TextEditingController imageCont =
      TextEditingController();
  final TextEditingController phoneNumCont =
      TextEditingController();

  final forumKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

    imageCont.text = widget.personalModel?.image ?? "";
    birthDayCont.text =
        (widget.personalModel != null
            ? day(widget.personalModel!.birthday)
            : "");
    emailCont.text = widget.personalModel?.email ?? "";
    secondNameCont.text =
        widget.personalModel?.secondName ?? "";
    firstNameCont.text =
        widget.personalModel?.firstName ?? "";
    _genderController.text =
        widget.personalModel?.gender ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: forumKey,
      child: AlertDialog(
        title: Text("Profile"),
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
                    return "Isim kiritilmagan";
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
                    return "Familiya kiritilmagan";
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
                    return "Email kiritilmagan";
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
                    return "Telefon raqami kiritilmagan";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: birthDayCont,
                onTap: () async {
                  final DateTime?
                  pickedDate = await showDatePicker(
                    context: context,
                    initialDate:
                        DateTime.now(), // Boshlang‘ich ko‘rsatiladigan sana
                    firstDate: DateTime(
                      2000,
                    ), // Eng eski tanlanadigan sana
                    lastDate: DateTime(
                      2100,
                    ), // Eng oxirgi tanlanadigan sana
                  );
                  if (pickedDate != null) {
                    birthDayCont.text = day(pickedDate);
                    setState(() {});
                  }
                },
                readOnly: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: birthDay,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Tugilgan kun kiritilmagan";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: imageCont,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: image,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Rasim kiritilmagan";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _genderController,
                readOnly: true,
                onTap: () {},
                decoration: InputDecoration(
                  labelText: "Gender",

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: PopupMenuButton(
                    onSelected: (value) {
                      _genderController.text = value;
                      setState(() {});
                    },
                    icon: Icon(Icons.keyboard_arrow_down),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          value: "male",
                          child: Text("Male"),
                        ),
                        PopupMenuItem(
                          value: "female",
                          child: Text("Female"),
                        ),
                      ];
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Jins tanlanmagan";
                  }
                  return null;
                },
              ),
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      if (forumKey.currentState!
                          .validate()) {
                        final a = PersonalModel(
                          birthday: DateTime.parse(
                            birthDayCont.text,
                          ),
                          email: emailCont.text,
                          firstName: firstNameCont.text,
                          image: imageCont.text,
                          phoneNum: phoneNumCont.text,
                          secondName: secondNameCont.text,
                          gender: _genderController.text,
                        );
                        widget.isFirst
                            ? UserPersonalController(
                              contact: widget.id,
                            ).savePersonalData(
                              personalModel: a,
                            )
                            : UserPersonalController(
                              contact: widget.id,
                            ).editPersonalData(
                              personalModel: a,
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
