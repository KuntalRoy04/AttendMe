import 'package:Attendme/src/students/common_functions/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<User?> getUserLocally() async {
  final prefs = await SharedPreferences.getInstance();
  String? enNum = prefs.getString('enNum');
  String? firstName = prefs.getString('firstName');
  String? lastName = prefs.getString('lastName');
  String? phone = prefs.getString('phone');
  String? email = prefs.getString('email');
  String? password = prefs.getString('password');
  String? fullName = prefs.getString('fullName');
  String? roll = prefs.getString('roll');

  if (enNum != null && firstName != null && lastName != null && phone != null && email != null && roll != null && password != null && fullName != null) {
    return User(
        enNum: enNum,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        email: email,
        password: password,
        fullName: fullName,
        roll: roll
    );
  } else {
    return null;
  }
}

Future<String?> getFirstName() async {
  User? user = await getUserLocally();
  if (user != null) {
    return user.firstName; // Access the firstName field of the User object
  } else {
    return null; // No user is logged in
  }
}

Future<String?> getEnNum() async {
    User? user = await getUserLocally();
    if (user != null) {
      return user.enNum;
    } else {
      return null;
    }
}

Future<String?> getLastName() async {
  User? user = await getUserLocally();
  if (user != null) {
    return user.lastName;
  } else {
    return null;
  }
}

Future<String?> getFullName() async {
  User? user = await getUserLocally();
  if (user != null) {
    return '${user.firstName} ${user.lastName}';
  } else {
    return null;
  }
}

Future<String?> getRoll() async {
  User? user = await getUserLocally();
  if (user != null) {
    return user.roll;
  } else {
    return null;
  }
}

