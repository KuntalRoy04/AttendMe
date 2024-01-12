import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../faculties/common_functions/faculty_model.dart';
import '../../../faculties/common_functions/store_faculty_locally.dart';

Future<bool> performFacultySignUp(String password, String firstName,
    String lastName, String phone, String email) async {
  try {
    DateTime now = DateTime.now();
    Random random = Random();
    String id = firstName.substring(0, 3).toUpperCase()+now.toIso8601String().substring(0, 16).replaceAll(RegExp(r"[^\d]"), "")+random.nextInt(10).toString();
    DocumentReference facultyDoc = FirebaseFirestore.instance.collection(
        'faculties').doc(id);
    await facultyDoc.set({
      'faculty_id': id,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'email': email,
      'full_name': '$firstName$lastName'
    });

    DocumentSnapshot docSnapshot = await facultyDoc.get();

    if (docSnapshot.exists) {
      if (docSnapshot.get('password') == password) {
        // Password matches, user authenticated
        if (kDebugMode) {
          print('User authenticated!');
        }
        Faculty faculty = Faculty(
            firstName: docSnapshot.get('first_name'),
            lastName: docSnapshot.get('last_name'),
            phone: docSnapshot.get('phone'),
            email: docSnapshot.get('email'),
            password: docSnapshot.get('password'),
            fullName: docSnapshot.get('full_name'),
            facultyId: docSnapshot.get('faculty_id')
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
  }catch (e) {
    // Handle any errors during the login process
    if (kDebugMode) {
      print('Couldn\'t sign up: $e');
    }
    return false;
  }
  return false;
}
