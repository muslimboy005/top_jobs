import 'package:flutter/material.dart';
import 'package:top_jobs/view/screens/admin_profile/admin_profile_screen.dart';
import 'package:top_jobs/view/screens/screens/setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentindex = 0;

  final List<Widget> _pages = [
    AdminProfileScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'home',
            backgroundColor: Colors.blue,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.black),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
