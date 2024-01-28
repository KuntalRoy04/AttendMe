import 'package:Attendme/src/faculties/common_functions/faculty_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> storeFacultyLocally(Faculty faculty) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isFacultyLoggedIn', true);
  await prefs.setString('facultyId', faculty.facultyId);
  await prefs.setString('firstNameFaculty', faculty.firstName);
  await prefs.setString('lastNameFaculty', faculty.lastName);
  await prefs.setString('phoneFaculty', faculty.phone);
  await prefs.setString('emailFaculty', faculty.email);
  await prefs.setString('passwordFaculty', faculty.password);
  await prefs.setString('fullNameFaculty', faculty.fullName);
}