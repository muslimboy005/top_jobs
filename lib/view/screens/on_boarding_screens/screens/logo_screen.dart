import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_jobs/datasource/local_datasource/userLocal.dart';
import 'package:top_jobs/model/sign_model.dart';
import 'package:top_jobs/utils/app_images.dart';
import 'package:top_jobs/view/screens/on_boarding_screens/screens/splash_screen.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  State<LogoScreen> createState() => _LogoState();
}

class _LogoState extends State<LogoScreen> {
  SignModel? signModel;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () async {
      signModel = await Userlocal().getData();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (context) =>
                  SplashScreen(signModel: signModel),
        ),
      );
    });
    return Scaffold(
      backgroundColor: Color(0xff130160),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.logo),
            SizedBox(height: 10),
            Text(
              "TopJops",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
