import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../screens/attendance/attendance.dart';
import '../screens/profile/profile.dart';
import '../screens/settings/settings.dart';



class NavigationStudent extends StatefulWidget{
  const NavigationStudent({Key? key}) : super(key: key);

  @override
  State<NavigationStudent> createState() => _NavigationStudentState();

}

class _NavigationStudentState extends State<NavigationStudent>{
  final _navPages = [const AttendanceScreen(), const SettingsScreen(), const ProfileScreen()];
  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: _navPages[_selectedItem],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Icons.people,
                  text: 'Attendance',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                ),
                GButton(
                  icon: Icons.face,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedItem,
              onTabChange: (index) {
                setState(() {
                  _selectedItem = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}