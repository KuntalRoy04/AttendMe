import 'package:Attendme/src/students/common_functions/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> storeUserLocally(User user) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', true);
  await prefs.setString('enNum', user.enNum);
  await prefs.setString('firstName', user.firstName);
  await prefs.setString('lastName', user.lastName);
  await prefs.setString('phone', user.phone);
  await prefs.setString('email', user.email);
  await prefs.setString('password', user.password);
  await prefs.setString('fullName', user.fullName);
  await prefs.setInt('loginTime', DateTime.now().millisecondsSinceEpoch);
}