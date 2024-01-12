import 'package:attendme/src/faculties/common_functions/faculty_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../faculties/common_functions/store_faculty_locally.dart';
Future<bool> performFacultyLogin(String email, String password) async {
  try {
    CollectionReference faculties = FirebaseFirestore.instance.collection('faculties');
    QuerySnapshot querySnapshot = await faculties.where('email', isEqualTo: email).get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      if (documentSnapshot['password'] == password) {
        // Password matches, user authenticated
        if (kDebugMode) {
          print('User authenticated!');
        }
        Faculty faculty = Faculty(
            firstName: documentSnapshot['first_name'],
            lastName: documentSnapshot['last_name'],
            phone: documentSnapshot['phone'],
            email: documentSnapshot['email'],
            password: documentSnapshot['password'],
            fullName: documentSnapshot['full_name'],
            facultyId: documentSnapshot['faculty_id'],
        );
        await storeFacultyLocally(faculty);
        return true;
      } else {
        // Invalid password
        if (kDebugMode) {
          print('Invalid password.');
          return false;
        }
      }
    }
    else {
      // User with the provided userId not found
      if (kDebugMode) {
        print('User not found.');
      }
      return false;
    }
  } catch (e) {
    // Handle any errors during the login process
    if (kDebugMode) {
      print('Error during login: $e');
    }
    return false;
  }
  return false;
}
