import 'package:attendme/src/before_login/common_widgets/student_sign_up_page.dart';
import 'package:flutter/material.dart';

class StudentSignUpScreen extends StatelessWidget {
  const StudentSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
        body: StudentSignUpPage()
    );
  }
}