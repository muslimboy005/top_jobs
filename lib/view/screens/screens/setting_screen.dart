import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:top_jobs/controller/app_password_controller.dart';
import 'package:top_jobs/controller/user_local_controller.dart';
import 'package:top_jobs/view/screens/register_screens/screens/login_screen.dart';
import 'package:top_jobs/view/screens/screens/set_password_screen.dart';
import 'package:top_jobs/view/screens/screens/update_password_screen.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({super.key});
  final appPasswordController = AppPasswordController();
  final userLocalController = UserLocalController();

  @override
  State<SettingScreen> createState() =>
      _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _notificationSwitch = false;
  bool _modeSwitch = false;
  bool _passwordEnabled = false;

  @override
  void initState() {
    super.initState();
    AdaptiveTheme.getThemeMode().then((mode) {
      setState(() {
        _modeSwitch = mode == AdaptiveThemeMode.dark;
      });
    });
    widget.appPasswordController.isPasswordEnabled().then((
      value,
    ) {
      _passwordEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sozlamalar"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Sozlamalar",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Bildirishnoma"),
            trailing: Switch.adaptive(
              value: _notificationSwitch,
              onChanged: (bool value) {
                _notificationSwitch = value;
                setState(() {});
              },
            ),
          ),
          ListTile(
            leading: Icon(
              _modeSwitch
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            title: Text("Qorong'i rejim"),
            trailing: Switch.adaptive(
              value: _modeSwitch,
              onChanged: (bool value) {
                setState(() {
                  _modeSwitch = value;
                });
                if (value) {
                  AdaptiveTheme.of(context).setDark();
                } else {
                  AdaptiveTheme.of(context).setLight();
                }
              },
            ),
          ),
          ListTile(
            onTap: () async {
              await widget.appPasswordController
                  .getPassword();
              final hasPassword =
                  widget.appPasswordController
                      .hasPassword();
              Navigator.push(
                // ignore: use_build_context_synchronously
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return hasPassword
                        ? UpdatePasswordScreen()
                        : SetPasswordScreen();
                  },
                ),
              );
            },
            leading: Icon(Icons.lock),
            title: Text("Parol"),
            trailing: Switch.adaptive(
              value: _passwordEnabled,
              onChanged: (value) async {
                await widget.appPasswordController
                    .setPasswordEnabled(value);
                setState(() {
                  _passwordEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            onTap: () async {
              await widget.userLocalController.deleteUser();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
            tileColor: Colors.red,
            leading: Icon(
              Icons.logout,
              color:
                  _modeSwitch ? Colors.white : Colors.black,
            ),
            title: Text("Chiqish"),
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
