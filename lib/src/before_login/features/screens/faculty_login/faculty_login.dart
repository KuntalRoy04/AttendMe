import 'package:Attendme/src/before_login/common_widgets/faculty_login_page.dart';
import 'package:flutter/material.dart';

class FacultyLoginScreen extends StatelessWidget {
  const FacultyLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: FacultyLoginPage()
    );
  }
}