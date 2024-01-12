import 'package:flutter/material.dart';

import '../../../common_widgets/student_login_page.dart';

class StudentLoginScreen extends StatelessWidget {
  const StudentLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: StudentLoginPage()
    );
  }
}