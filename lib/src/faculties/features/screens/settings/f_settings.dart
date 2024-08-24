import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FSettingsScreen extends StatelessWidget{
  const FSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setBool('isFacultyLoggedIn', false);
                      Navigator.pushNamed(context, 'loginDashboard');
                  }, child: const Text("Logout")),
              ],
            ),
          )
        ],
      ),
    );
  }

}