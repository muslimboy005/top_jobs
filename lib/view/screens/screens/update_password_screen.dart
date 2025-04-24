import 'package:flutter/material.dart';
import 'package:top_jobs/controller/app_password_controller.dart';

class UpdatePasswordScreen extends StatefulWidget {
  UpdatePasswordScreen({super.key});

  final appPasswordController = AppPasswordController();

  @override
  State<UpdatePasswordScreen> createState() =>
      _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState
    extends State<UpdatePasswordScreen> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  String oldPassword = "";

  bool isShowOldPassword = false;
  bool isShowNewPassword = false;
  bool isShowConfirmPassword = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    widget.appPasswordController.getPassword().then((
      value,
    ) {
      oldPassword = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        autovalidateMode:
            AutovalidateMode.onUserInteraction,
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Parolni yangilang",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },

              controller: _oldPasswordController,
              obscureText: isShowOldPassword,
              decoration: InputDecoration(
                labelText: "Eski parol",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isShowOldPassword =
                          !isShowOldPassword;
                    });
                  },
                  icon:
                      isShowOldPassword
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Iltimos, eski parolingizni kiriting.";
                } else if (value.length < 6) {
                  return "Parol kamida 6 ta belgidan iborat bo'lishi kerak.";
                } else if (oldPassword != value) {
                  return "Eski parol noto'g'ri";
                }
                return null;
              },
            ),
            TextFormField(
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },

              controller: _newPasswordController,
              obscureText: isShowNewPassword,
              decoration: InputDecoration(
                labelText: "Yangi parol",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isShowNewPassword =
                          !isShowNewPassword;
                    });
                  },
                  icon:
                      isShowNewPassword
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Parolingizni kiriting.";
                } else if (value.length < 6) {
                  return "Parol kamida 6 ta belgidan iborat bo'lishi kerak.";
                }
                return null;
              },
            ),
            TextFormField(
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },

              controller: _confirmPasswordController,
              obscureText: isShowConfirmPassword,
              decoration: InputDecoration(
                labelText: "Parolni tasdiqlang",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isShowConfirmPassword =
                          !isShowConfirmPassword;
                    });
                  },
                  icon:
                      isShowConfirmPassword
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Parolingizni kiriting.";
                } else if (value.length < 6) {
                  return "Parol kamida 6 ta belgidan iborat bo'lishi kerak.";
                }
                return null;
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 70,
        width: 300,
        child: TextButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              setState(() {
                isLoading = true;
              });

              await widget.appPasswordController
                  .savePassword(
                    _newPasswordController.text,
                  );

              setState(() {
                isLoading = false;
                Navigator.pop(context);
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Parol o`zgartirildi!"),
                ),
              );
            }
          },
          child: Text("Yangilash"),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.indigo,
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            textStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
