import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<String>> getGeneratedCodes() async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    final prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('facultyId');

    // Reference to the parent document
    DocumentReference parentDocumentRef = firestore.collection('faculties').doc(id);

    // Query the subcollection
    QuerySnapshot querySnapshot = await parentDocumentRef.collection('secret_codes').orderBy('time', descending: true).get();

    // Extract document IDs
    List<String> documentIDs = querySnapshot.docs.map((doc) => doc.id).toList();

    return documentIDs;
  } catch (e) {
    if (kDebugMode) {
      print('Error fetching subcollection documents: $e');
    }
    return [];
  }
}
