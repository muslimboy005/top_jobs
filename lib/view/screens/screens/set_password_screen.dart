import 'package:flutter/material.dart';
import 'package:top_jobs/controller/app_password_controller.dart';

class SetPasswordScreen extends StatefulWidget {
  SetPasswordScreen({super.key});
  final appPasswordController = AppPasswordController();

  @override
  State<SetPasswordScreen> createState() =>
      _SetPasswordScreenState();
}

class _SetPasswordScreenState
    extends State<SetPasswordScreen> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isShowNewPassword = false;
  bool isShowConfirmPassword = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        autovalidateMode:
            AutovalidateMode.onUserInteraction,
        key: formKey,
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Parolni o'rnating",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
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
                  return "Iltimos, parolingizni kiriting.";
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
                  return "Iltimos, parolingizni kiriting.";
                } else if (value.length < 6) {
                  return "Parol kamida 6 ta belgidan iborat bo'lishi kerak.";
                } else if (value !=
                    _newPasswordController.text) {
                  return "Parol mos emas";
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
                SnackBar(content: Text("Parol saqlandi!")),
              );
            }
          },
          child: Text("Saqlash"),
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
