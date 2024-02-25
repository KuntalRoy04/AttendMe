import 'package:Attendme/src/faculties/common_functions/faculty_model.dart';
import 'package:Attendme/src/students/common_functions/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getFacultyId() async {
  final prefs = await SharedPreferences.getInstance();
  String? facultyId = prefs.getString('facultyId');
  return facultyId;
}

// Future<Faculty?>getFacultyLocally() async {
//   final prefs = await SharedPreferences.getInstance();
//   String? facultyId = prefs.getString('facultyId');
//   String? firstName = prefs.getString('firstNameFaculty');
//   String? lastName = prefs.getString('lastNameFaculty');
//   String? phone = prefs.getString('phoneFaculty');
//   String? email = prefs.getString('emailFaculty');
//   String? password = prefs.getString('passwordFaculty');
//   String? fullName = prefs.getString('fullNameFaculty');
//
//   if (facultyId != null && firstName != null && lastName != null && phone != null && email != null && password != null && fullName != null) {
//     return Faculty(
//         firstName: firstName,
//         lastName: lastName,
//         phone: phone,
//         email: email,
//         password: password,
//         fullName: fullName,
//         facultyId: facultyId
//     );
//   } else {
//     return null;
//   }
// }
//
// Future<String?> getFacultyFacultyId() async {
//   Faculty? faculty = await getFacultyLocally();
//   if (faculty != null) {
//     return faculty.facultyId; // Access the firstName field of the User object
//   } else {
//     return null; // No user is logged in
//   }
// }

Future<String?> getFacultyFirstName() async {
  String? facultyId = await getFacultyId();
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection('faculties').doc(facultyId);
  DocumentSnapshot documentSnapshot = await documentReference.get();
  return documentSnapshot.get('first_name');
}

Future<String?> getFacultyLastName() async {
  String? facultyId = await getFacultyId();
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection('faculties').doc(facultyId);
  DocumentSnapshot documentSnapshot = await documentReference.get();
  return documentSnapshot.get('last_name');
}

Future<String?> getFacultyFullName() async {
  String? facultyId = await getFacultyId();
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection('faculties').doc(facultyId);
  DocumentSnapshot documentSnapshot = await documentReference.get();
  return documentSnapshot.get('first_name') +
      ' ' +
      documentSnapshot.get('last_name');
}
