import 'package:flutter/material.dart';
import 'package:top_jobs/datasource/local_datasource/userLocal.dart';
import 'package:top_jobs/view/screens/adminScreen/admin_profile_screen.dart';
import 'package:top_jobs/view/screens/register_screens/screens/login_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List profile = [AdminProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Userlocal().deleteData();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) => LoginScreen(),
                ),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: profile[0],
    );
  }
}
