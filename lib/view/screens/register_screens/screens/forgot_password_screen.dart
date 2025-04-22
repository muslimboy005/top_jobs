import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:top_jobs/controller/admin_controller/admin_register_controller.dart';
import 'package:top_jobs/utils/app_images.dart';
import 'package:top_jobs/controller/user_controllers/user_register_controller.dart';
import 'package:top_jobs/model/sign_model.dart';
import 'package:top_jobs/view/screens/register_screens/screens/check_your_email_screen.dart';
import 'package:top_jobs/utils/screen_size_utils.dart';
import 'package:top_jobs/view/screens/register_screens/screens/login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {
  final userRegisterController = UserRegisterController();
  final adminRegisterController = AdminRegisterController();
  bool loginUser = false;
  List<SignModel> allUsers = [];
  List<SignModel> allAdmins = [];
  //GlobalKey:
  final formKey = GlobalKey<FormState>();

  //TextControllers:
  final _registerEmailController = TextEditingController();

  //Variables:
  bool isTrue = false;
  bool isShow = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  void loadUsers() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Future'dan ma'lumotlarni olish
      List<SignModel> users =
          await userRegisterController.getRegisterData();
      List<SignModel> admins =
          await adminRegisterController.getRegisterData();
      setState(() {
        allUsers = users;
        allAdmins = admins;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Ma\'lumotlarni yuklashda xatolik: $e',
            ),
          ),
        );
      }
    }
  }

  // Login funksiyasi - foydalanuvchi ma'lumotlarini tekshirish uchun
  void login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      // Agar ma'lumotlar yuklanmagan bo'lsa, yuklash
      if (allUsers.isEmpty) {
        try {
          allUsers =
              await userRegisterController
                  .getRegisterData();
        } catch (e) {
          setState(() {
            isLoading = false;
          });
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Ma\'lumotlarni yuklashda xatolik: $e',
                ),
              ),
            );
          }
          return; // Xatolik bo'lsa, funksiyadan chiqish
        }
      }

      // Foydalanuvchini topish
      bool foundUser = false;
      for (var user in allUsers) {
        if (user.contact == _registerEmailController.text) {
          foundUser = true;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder:
                  (context) => CheckYourEmailScreen(
                    email: _registerEmailController.text,
                  ),
            ),
          );
          break;
        }
      }
      for (var user in allAdmins) {
        if (user.contact == _registerEmailController.text) {
          foundUser = true;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder:
                  (context) => CheckYourEmailScreen(
                    isAdmin: true,
                    email: _registerEmailController.text,
                  ),
            ),
          );
          break;
        }
      }

      setState(() {
        loginUser = foundUser;
        isLoading = false;
      });

      // Foydalanuvchi topilgan-topilmaganligiga qarab harakat qilish
      if (!loginUser && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Bunday foydalanuvchi topilmadi.',
            ),
          ),
        );
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = ScreenSize.widthFactor(context);
    double h = ScreenSize.heightFactor(context);
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      body: Form(
        key: formKey,
        autovalidateMode:
            AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: w * 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppImages.forgot),
                      SizedBox(height: 15 * h),
                      SvgPicture.asset(AppImages.toReset),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 60 * h),
              SvgPicture.asset(AppImages.group67),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  right: 30,
                  top: 80,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppImages.email),
                    SizedBox(height: 10 * h),
                    TextFormField(
                      controller: _registerEmailController,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty) {
                          return "Please enter your email.";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    // SizedBox(height: 20 * h),
                    SizedBox(height: 30 * h),
                    Column(
                      children: [
                        InkWell(
                          borderRadius:
                              BorderRadius.circular(20),
                          onTap: login,
                          child: Container(
                            width: 320,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(10),
                              color: Color(0xff130160),
                            ),
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppImages.reset,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20 * h),
                        InkWell(
                          borderRadius:
                              BorderRadius.circular(20),
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginScreen();
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: 320,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(10),
                              color: Color(0xffD6CDFE),
                            ),
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppImages.back,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
