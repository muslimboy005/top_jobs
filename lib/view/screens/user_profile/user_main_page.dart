import 'package:flutter/material.dart';
import 'package:top_jobs/view/screens/user_profile/history.dart';
import 'package:top_jobs/view/screens/user_profile/profile.dart';
import 'package:top_jobs/view/screens/user_profile/search_screen.dart';
import 'package:top_jobs/view/screens/user_profile/setting_screen.dart';

class UserMainPage extends StatefulWidget {
  const UserMainPage({super.key});

  @override
  State<UserMainPage> createState() => _UserMainPageState();
}

class _UserMainPageState extends State<UserMainPage> {
  int _currentindex = 0;

  final List<Widget> _pages = [
    SearchScreen(),
    HistoryPage(),
    ProfilePage(),
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
            icon: Icon(Icons.history, color: Colors.black),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outlined,
              color: Colors.black,
            ),
            label: 'Profile',
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
