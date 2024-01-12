import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../students/common_functions/store_user_locally.dart';
import '../../../students/common_functions/user_model.dart';

Future<bool> performSignUp(String ennum, String password, String firstName,
    String lastName, String phone, String email) async {
      try {
        // Query Firestore to find the user with the provided userId
        DocumentReference usersDoc = FirebaseFirestore.instance.collection(
            'users').doc(ennum);
        await usersDoc.set({
          'ennum': ennum,
          'password': password,
          'first_name': firstName,
          'last_name': lastName,
          'phone': phone,
          'email': email,
          'full_name': '$firstName$lastName'
        });

        DocumentSnapshot docSnapshot = await usersDoc.get();

        if (docSnapshot.exists) {
          if (docSnapshot.get('password') == password) {
            // Password matches, user authenticated
            if (kDebugMode) {
              print('User authenticated!');
            }
            User user = User(
                enNum: docSnapshot.get('ennum'),
                firstName: docSnapshot.get('first_name'),
                lastName: docSnapshot.get('last_name'),
                phone: docSnapshot.get('phone'),
                email: docSnapshot.get('email'),
                password: docSnapshot.get('password'),
                fullName: docSnapshot.get('full_name')
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
      }catch (e) {
        // Handle any errors during the login process
        if (kDebugMode) {
          print('Couldn\'t sign up: $e');
        }
        return false;
      }
      return false;
}
