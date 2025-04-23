import 'package:flutter/material.dart';
import 'package:top_jobs/controller/user_controllers/user_profile_controller.dart';
import 'package:top_jobs/datasource/local_datasource/userLocal.dart';
import 'package:top_jobs/model/users/user_profile_model.dart';
import 'package:top_jobs/view/widget/education_dioganal_widget.dart';
import 'package:top_jobs/view/widget/experience_dialog_widget.dart';
import 'package:top_jobs/view/widget/language_dialog_widget.dart';
import 'package:top_jobs/view/widget/profile_dialog_widget.dart';
import 'package:top_jobs/view/widget/skill_dialog_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //presslar bu about me va qolganlarining ustiga bosganda ishlashi uchun
  bool press1 = false;
  bool press2 = false;
  bool press3 = false;
  bool press4 = false;
  bool press5 = false;
  bool press6 = false;
  bool isload = false;

  final controller = UserProfileController(
    contact: "user1",
  );
  late UserProfileModel profileModel;
  late String id;
  Future<void> profileData() async {
    isload = true;
    profileModel = await controller.getdata();
    final userData = await Userlocal().getData();
    userData != null ? id = userData.id : "18";
    isload = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    profileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
          isload
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                child: Column(
                  children: [
                    //bu bosh qism user profili
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        color: Colors.indigo,
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.share),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.settings),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              profileModel
                                  .personalModel
                                  .image,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                profileModel
                                    .personalModel
                                    .firstName,
                              ),
                              SizedBox(width: 10),
                              Text(
                                profileModel
                                    .personalModel
                                    .secondName,
                              ),
                            ],
                          ),
                          Text(
                            profileModel
                                .personalModel
                                .phoneNum,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    //bu about me tugmasi kodi
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        border: Border.all(
                          color: Colors.black12,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                press1 = !press1;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 15,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person_2_outlined,
                                  color: Colors.amber,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "About me",
                                  style: TextStyle(
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) =>
                                                ProfileDialogWidget(
                                                  id: id,
                                                ),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (press1)
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceAround,
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                children: [
                                  Image.network(
                                    profileModel
                                        .personalModel
                                        .image,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,
                                    children: [
                                      Text(
                                        "Full name: ${profileModel.personalModel.firstName} ${profileModel.personalModel.secondName}",
                                      ),
                                      Text(
                                        "Email: ${profileModel.personalModel.email}",
                                      ),
                                      Text(
                                        "Number: ${profileModel.personalModel.phoneNum}",
                                      ),
                                      Text(
                                        "Birthday: ${profileModel.personalModel.birthday.year} - ${profileModel.personalModel.birthday.month} - ${profileModel.personalModel.birthday.day}",
                                      ),
                                      Text(
                                        "Gender: ${profileModel.personalModel.gender}",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    //bu Work experience tugmasi kodi
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        border: Border.all(
                          color: Colors.black12,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                press2 = !press2;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 15,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.work_outline,
                                  color: Colors.amber,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Work experience",
                                  style: TextStyle(
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (press2 &&
                              profileModel
                                  .experienceModel
                                  .isNotEmpty)
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                    children: [
                                      Text(
                                        profileModel
                                            .experienceModel[0]
                                            .position,
                                        style: TextStyle(
                                          fontWeight:
                                              FontWeight
                                                  .bold,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context:
                                                context,
                                            builder: (ctx) {
                                              return ExperienceDialogWidget(
                                                id: id,
                                              );
                                            },
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color:
                                              Colors.amber,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    profileModel
                                        .experienceModel[0]
                                        .companyName,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    profileModel
                                        .experienceModel[0]
                                        .period,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    profileModel
                                        .experienceModel[0]
                                        .responsibility,
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    //bu Education tugmasi kodi
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        border: Border.all(
                          color: Colors.black12,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                press3 = !press3;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 15,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.school,
                                  color: Colors.amber,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Education",
                                  style: TextStyle(
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (press3 &&
                              profileModel
                                  .educationModel
                                  .isNotEmpty)
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                    children: [
                                      Text(
                                        profileModel
                                            .educationModel[0]
                                            .degree,
                                        style: TextStyle(
                                          fontWeight:
                                              FontWeight
                                                  .bold,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context:
                                                context,
                                            builder: (ctx) {
                                              return EducationDioganalWidget(
                                                id: id,
                                              );
                                            },
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color:
                                              Colors.amber,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    profileModel
                                        .educationModel[0]
                                        .educationName,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    profileModel
                                        .educationModel[0]
                                        .duration,
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    //bu Skill tugmasi kodi
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        border: Border.all(
                          color: Colors.black12,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                press4 = !press4;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 15,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.webhook_sharp,
                                  color: Colors.amber,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Skill",
                                  style: TextStyle(
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return SkillDialogWidget(
                                          id: id,
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (press4)
                            Padding(
                              padding: EdgeInsets.only(
                                top: 20,
                                bottom: 20,
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                children: [
                                  Text(
                                    "Hard skill: ${profileModel.skillsModel.hardSkill}",
                                  ),
                                  Text(
                                    "Soft skill: ${profileModel.skillsModel.softSkill}",
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    //bu Language tugmasi kodi
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        border: Border.all(
                          color: Colors.black12,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                press5 = !press5;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 15,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.stars_outlined,
                                  color: Colors.amber,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Language",
                                  style: TextStyle(
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return LanguageDialogWidget(
                                          id: id,
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (press5 &&
                              profileModel
                                  .languageModel
                                  .isNotEmpty)
                            Padding(
                              padding: EdgeInsets.only(
                                top: 20,
                                bottom: 20,
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                children: [
                                  Text(
                                    "Name: ${profileModel.languageModel[0].lanName}",
                                  ),
                                  Text(
                                    "Grade: ${profileModel.languageModel[0].lanGrade}",
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
