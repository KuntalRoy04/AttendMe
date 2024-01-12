import 'package:shared_preferences/shared_preferences.dart';

Future<bool> checkLoginStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn')??false;
}