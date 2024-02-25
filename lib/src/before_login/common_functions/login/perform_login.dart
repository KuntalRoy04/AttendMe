import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../students/common_functions/store_user_locally.dart';
import '../../../students/common_functions/user_model.dart';
Future<bool> performLogin(String ennum, String password) async {
  try {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users').doc(ennum);
    DocumentSnapshot documentSnapshot = await documentReference.get();

    if (documentSnapshot.exists) {
      if (documentSnapshot.get('password') == password) {
        // Password matches, user authenticated
        if (kDebugMode) {
          print('User authenticated!');
        }
        User user = User(
          enNum: documentSnapshot.get('ennum'),
          firstName: documentSnapshot.get('first_name'),
          lastName: documentSnapshot.get('last_name'),
          phone: documentSnapshot.get('phone'),
          email: documentSnapshot.get('email'),
          password: documentSnapshot.get('password'),
          fullName: documentSnapshot.get('full_name'),
          roll: documentSnapshot.get('roll'),
          stream: documentSnapshot.get('stream'),
          section: documentSnapshot.get('section'),
        );
        await storeUserLocally(user);
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

// Future<bool> performLogin(String ennum, String password) async {
//   try {
//     // Query Firestore to retrieve user document
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection('users')
//         .where('ennum', isEqualTo: ennum)
//         .get();
//
//     if (querySnapshot.docs.isNotEmpty) {
//       DocumentSnapshot userDoc = querySnapshot.docs.first;
//       String storedPassword = userDoc.get('password');
//
//       // Verify password (ensure proper hashing and salting)
//       if (password == storedPassword){
//         // Login successful
//         User user = User(
//           enNum: userDoc.get('ennum'),
//           firstName: userDoc.get('first_name'),
//           lastName: userDoc.get('last_name'),
//           phone: userDoc.get(['phone']),
//           email: userDoc.get(['email']),
//           password: userDoc.get('password')
//         );
//         await storeUserLocally(user);
//         return true;
//       } else {
//         // Invalid password
//         return false;
//       }
//     } else {
//       // User not found
//       return false;
//     }
//   } catch (error) {
//     // Handle login errors
//     return false;
//   }
// }
