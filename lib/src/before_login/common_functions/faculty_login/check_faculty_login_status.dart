import 'package:shared_preferences/shared_preferences.dart';

Future<bool> checkFacultyLoginStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isFacultyLoggedIn')??false;
}