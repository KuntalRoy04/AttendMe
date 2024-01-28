import 'package:Attendme/src/faculties/features/screens/attendance_data/f_attendance_data.dart';
import 'package:Attendme/src/faculties/features/screens/settings/f_settings.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../screens/profile/f_profile.dart';

class NavigationFaculty extends StatefulWidget{
  const NavigationFaculty({Key? key}) : super(key: key);

  @override
  State<NavigationFaculty> createState() => _NavigationFacultyState();

}

class _NavigationFacultyState extends State<NavigationFaculty>{
  final _navPages = [const FAttendanceDataScreen(), const FSettingsScreen(), const FProfileScreen()];
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
                  text: 'Attendance Data',
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