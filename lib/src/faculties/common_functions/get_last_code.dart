import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getLastCode() async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    final prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('facultyId');

    // Query the collection to get the documents ordered by creation time
    QuerySnapshot querySnapshot = await firestore
        .collection('faculties')
        .doc(id)
        .collection('secret_codes')
        .orderBy('createdAt', descending: true)
        .limit(1)
        .get();

    // Check if there is any document
    if (querySnapshot.docs.isNotEmpty) {
      // Get the ID of the last created document
      String lastDocId = querySnapshot.docs.first.id;
      return lastDocId;
    } else {
      return 'No document found';
    }
  } catch (e) {
    print('Error fetching last created document ID: $e');
    return 'Error';
  }
}
