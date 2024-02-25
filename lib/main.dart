import 'package:Attendme/src/before_login/features/screens/faculty_login/faculty_login.dart';
import 'package:Attendme/src/before_login/features/screens/faculty_sign_up/faculty_sign_up.dart';
import 'package:Attendme/src/before_login/features/screens/login_dashboard/login_dashboard.dart';
import 'package:Attendme/src/before_login/features/screens/splash/splash.dart';
import 'package:Attendme/src/before_login/features/screens/student_login/student_login.dart';
import 'package:Attendme/src/before_login/features/screens/student_sign_up/student_sign_up.dart';
import 'package:Attendme/src/faculties/features/navigation/navigation_faculty.dart';
import 'package:Attendme/src/faculties/features/screens/attendance_data/add_class_only/add_class_only.dart';
import 'package:Attendme/src/faculties/features/screens/attendance_data/add_class_take_attendance/add_class_take_attendance.dart';
import 'package:Attendme/src/faculties/features/screens/attendance_data/show_qr.dart';
import 'package:Attendme/src/students/features/navigation/navigation_student.dart';
import 'package:Attendme/src/students/features/screens/attendance/attendance.dart';
import 'package:Attendme/src/students/features/screens/profile/profile.dart';
import 'package:Attendme/src/students/features/screens/settings/settings.dart';
import 'package:Attendme/src/students/features/screens/settings_features/change_password.dart';
import 'package:Attendme/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    theme: ThemeClass.lightTheme,
    themeMode: ThemeMode.light,
    initialRoute: 'splash',
    routes: {
      'splash': (context) => const SplashScreen(),
      'studentLogin': (context) => const StudentLoginScreen(),
      'facultyLogin': (context) => const FacultyLoginScreen(),
      'navigationStudent': (context) => const NavigationStudent(),
      'navigationFaculty': (context) => const NavigationFaculty(),
      'attendance': (context) => const AttendanceScreen(),
      'loginDashboard': (context) => const LoginDashboardScreen(),
      'profile': (context) => const ProfileScreen(),
      'settings': (context) => const SettingsScreen(),
      'studentSignUp': (context) => const StudentSignUpScreen(),
      'changePassword' : (context) => const ChangePasswordScreen(),
      'facultySignUp': (context) => const FacultySignUpScreen(),
      'addClassOnly': (context) => const AddClassOnlyScreen(),
      'addClassTakeAttendance': (context) => const AddClassTakeAttendanceScreen(),
      'showQr': (context) => const ShowQR(secretCode: '',),
    },
  ));
}
