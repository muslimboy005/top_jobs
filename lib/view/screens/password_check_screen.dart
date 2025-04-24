import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:top_jobs/controller/app_password_controller.dart';
import 'package:top_jobs/view/screens/on_boarding_screens/screens/logo_screen.dart';
import 'package:top_jobs/view/screens/screens/setting_screen.dart';

class PasswordCheckScreen extends StatefulWidget {
  const PasswordCheckScreen({super.key});

  @override
  State<PasswordCheckScreen> createState() =>
      _PasswordCheckScreenState();
}

class _PasswordCheckScreenState
    extends State<PasswordCheckScreen> {
  final _localAuth = LocalAuthentication();
  final _controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final _passwordController = AppPasswordController();
  String savedPassword = "";

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    savedPassword = await _passwordController.getPassword();
    _tryBiometric();
  }

  Future<void> _tryBiometric() async {
    bool canCheck = await _localAuth.canCheckBiometrics;
    bool isDeviceSupported =
        await _localAuth.isDeviceSupported();

    if (canCheck && isDeviceSupported) {
      bool didAuthenticate = await _localAuth.authenticate(
        localizedReason:
            "Biometric authentication for access to Top Jobs",
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
      if (didAuthenticate) {
        _goToApp();
      }
    }
    if (!isDeviceSupported || !canCheck) {
      return;
    }
  }

  void _goToApp() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LogoScreen()),
    );
  }

  void checkPassword() {
    if (_controller.text == savedPassword) {
      _goToApp();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter your password or use your biometric key.",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _controller,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: checkPassword,
                child: Text("Enter"),
              ),
              SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: _tryBiometric,
                label: Text("Enter for Biometric"),
                icon: Icon(Icons.fingerprint),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
