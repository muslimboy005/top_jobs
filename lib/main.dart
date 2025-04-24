import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:top_jobs/controller/app_password_controller.dart';
import 'package:top_jobs/view/screens/on_boarding_screens/screens/logo_screen.dart';
import 'package:top_jobs/view/screens/password_check_screen.dart';

void main() async {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});
  final appPasswordController = AppPasswordController();

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isEnabled = false;

  @override
  void initState() {
    super.initState();
    widget.appPasswordController.isPasswordEnabled().then((
      value,
    ) {
      isEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.light,
      light: ThemeData(brightness: Brightness.light),
      dark: ThemeData(brightness: Brightness.dark),
      builder: (light, dark) {
        return MaterialApp(
          theme: light,
          darkTheme: dark,
          home:
              isEnabled
                  ? PasswordCheckScreen()
                  : LogoScreen(),
        );
      },
    );
  }
}
