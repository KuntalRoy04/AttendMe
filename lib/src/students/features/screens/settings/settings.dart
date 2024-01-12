import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../before_login/common_functions/login/check_login_status.dart';
import '../../../../before_login/features/screens/login_dashboard/login_dashboard.dart';

class SettingsScreen extends StatelessWidget{
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Container containing settings banner
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 50,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF1C5D99)
              ),
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Settings", style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white)),
                    const SizedBox(height: 5),
                    Text("Change password, check faculty details, class routine and many more", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),),
                  ],
                )
              ),
            ),
          ),
          //Containing settings' options | It contains he logout button
          SingleChildScrollView(
            child: Column(
              children: [
                //The upper blank space containing Logout button
                const SizedBox(
                  height: 155,
                ),
                //Scrollable Container containing options
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        //Scrollable indication bar
                        Container(
                          height: 4,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: Colors.grey
                          ),
                        ),
                        //settings options' core place
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //The elements
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, 'changePassword');
                                },
                                child: buildOption('Password', 'Change your Password', true),
                              ),
                              InkWell(
                                onTap: () {
                                  //Show routine
                                },
                                child: buildOption('Class Routine', 'Check class timing daily', true),
                              ),
                              InkWell(
                                onTap: () {
                                  //Show routine
                                },
                                child: buildOption('Faculty Details', 'Information of all the faculties', true),
                              ),
                              InkWell(
                                onTap: () async {
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  await prefs.setBool('isLoggedIn', false);
                                  if (await checkLoginStatus() == false) {
                                    context.mounted
                                        ? Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const LoginDashboardScreen()))
                                        : '';
                                  }
                                },
                                child: buildOption('Logout', '', false),
                              ),
                              const Icon(
                                Icons.logout,
                                color: Colors.white,
                                size: 30.0,
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  //Build-option for the option rows with arrow sign
  Widget buildOption(String title, String subtitle, bool arrow) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: arrow ? const Icon(Icons.arrow_forward_ios) : const Icon(Icons.logout),
    );
  }
}