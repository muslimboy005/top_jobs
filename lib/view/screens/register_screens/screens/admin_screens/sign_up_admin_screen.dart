import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:top_jobs/utils/app_images.dart';
import 'package:top_jobs/utils/screen_size_utils.dart';
import 'package:top_jobs/controller/user_controllers/user_register_controller.dart';
import 'package:top_jobs/view/screens/register_screens/screens/users_screens/forgot_password_user_screen.dart';
import 'package:top_jobs/view/screens/register_screens/screens/login_screen.dart';

class SignUpAdminScreen extends StatefulWidget {
  SignUpAdminScreen({super.key});

  final userRegisterController = UserRegisterController();

  @override
  State<SignUpAdminScreen> createState() => _SignUpAdminScreenState();
}

class _SignUpAdminScreenState extends State<SignUpAdminScreen> {
  //GlobalKey:
  final formKey = GlobalKey<FormState>();

  //TextControllers:
  final _registerFullNameController = TextEditingController();
  final _registerEmailController = TextEditingController();
  final _registerPasswordController = TextEditingController();

  //Variables:
  bool isTrue = false;
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    double w = ScreenSize.widthFactor(context);
    double h = ScreenSize.heightFactor(context);
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: w * 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppImages.create),
                      SizedBox(height: 15 * h),
                      SvgPicture.asset(AppImages.lorem),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppImages.fullName),
                    SizedBox(height: 10 * h),
                    TextFormField(
                      controller: _registerFullNameController,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Place enter your full name";
                        } else if (value.length < 6) {
                          return "Place enter your full name";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your full name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SvgPicture.asset(AppImages.email),
                    SizedBox(height: 10 * h),
                    TextFormField(
                      controller: _registerEmailController,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email.";
                        } else if (!value.contains('@')) {
                          return "Invalid email format.";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SvgPicture.asset(AppImages.password),
                    SizedBox(height: 10 * h),
                    TextFormField(
                      controller: _registerPasswordController,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password.";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters.";
                        }
                        return null;
                      },
                      obscureText: isShow,
                      decoration: InputDecoration(
                        hintText: "Password your email",

                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isShow = !isShow;
                            });
                          },
                          icon:
                              isShow
                                  ? Icon(
                                    Icons.visibility,
                                    color: Color(0xff60778C),
                                  )
                                  : Icon(
                                    Icons.visibility_off,
                                    color: Color(0xff60778C),
                                  ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: isTrue,
                              onChanged: (value) {
                                setState(() {
                                  isTrue = value!;
                                });
                              },
                            ),
                            SizedBox(width: w * 15),
                            SvgPicture.asset(AppImages.rememberMe),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen(),
                              ),
                            );
                          },
                          child: SvgPicture.asset(AppImages.forgotPassword),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30 * h),
              Column(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        widget.userRegisterController.saveRegisterData(
                          email: _registerEmailController.text,
                          password: _registerPasswordController.text,
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (ctx) => LoginScreen()),
                        );
                      }
                    },
                    child: Container(
                      width: 270,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff130160),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [SvgPicture.asset(AppImages.signUp)],
                      ),
                    ),
                  ),
                  SizedBox(height: 20 * h),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {},
                    child: Container(
                      width: 270,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffD6CDFE),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(AppImages.google),
                                SizedBox(width: 10 * h),
                                SvgPicture.asset(AppImages.signInWithGoogle),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20 * h),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: SvgPicture.asset(AppImages.youDontHave),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
