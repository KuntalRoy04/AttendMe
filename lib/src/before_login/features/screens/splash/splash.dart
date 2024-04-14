import 'package:Attendme/src/faculties/features/navigation/navigation_faculty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../students/features/navigation/navigation_student.dart';
import '../../../common_functions/faculty_login/check_faculty_login_status.dart';
import '../../../common_functions/login/check_login_status.dart';
import '../../../constants/image_strings/image_strings.dart';
import '../login_dashboard/login_dashboard.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async {
      if(await checkLoginStatus()){
        if (!context.mounted) return;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NavigationStudent()));
      }
      else if (await checkFacultyLoginStatus()){
        if (!context.mounted) return;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NavigationFaculty()));
      }
      else{
        if (!context.mounted) return;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginDashboardScreen()));
      }

    });

    return Scaffold(
        body: Stack(
          children: [
            Center(child: SvgPicture.asset(attendMeLogo)),
            const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 100.0),
                      child: Text("Developed by Group 34", style: TextStyle(color: Colors.black),),
                    ),
                  ],
                ),
              ],
            )
          ],
        )
    );
  }

}