import 'package:Attendme/src/students/common_functions/get_user_locally.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

import '../../general/show_toast.dart';
import 'get_current_location.dart';
import 'is_location_in_area.dart';

Future<bool> submitAttendance(
    context, String roll, String secretCode, developerMode) async {
  Position? currentLocation = await getCurrentLocation();
  if (roll.isEmpty ||
      secretCode.isEmpty ||
      !isLocationInArea(currentLocation!.latitude, currentLocation.longitude) ||
      await developerMode) {
    if (await developerMode) {
      warningToast(context,
          'Turn off Developer Mode because this allows location spoofing');
    } else if (roll.isEmpty || secretCode.isEmpty) {
      dangerToast(context, 'Enter correct Enrolment number or secret code!');
    } else if (!isLocationInArea(
        currentLocation!.latitude, currentLocation.longitude)) {
      dangerToast(context, 'You are not in college!');
    }
    return false;
  } else {
    // Get a reference to the document
    DocumentReference documentRefSecretCode =
        FirebaseFirestore.instance.collection('secretCodes').doc(secretCode);
    DocumentReference documentRefUsers =
        FirebaseFirestore.instance.collection('users').doc(await getEnNum());
    // Add a new field to the existing document
    DocumentSnapshot documentRefSecretCodeSnapshot =
        await documentRefSecretCode.get();
    DocumentSnapshot documentRefUsersSnapshot = await documentRefUsers.get();
    if (documentRefSecretCodeSnapshot.exists) {
      var stream = await getStream();
      var section = await getSection();
      var attendanceDataCollectionReference =
          FirebaseFirestore.instance.collection('secretCodes/$secretCode/$stream/$section/students');
      var studentDocumentReference = attendanceDataCollectionReference.doc(await getEnNum());
      await studentDocumentReference.set({
        'name': documentRefUsersSnapshot.get('full_name'),
        'roll': roll
      }, SetOptions(merge: true)).then((enrollmentDocRef) {
        successToast(context, "Attendance Marked");
        // successToast(context, "Attendance Marked");
        return true;
      }).catchError((error) {
        dangerToast(context, "Could not upload Attendance!");
        return false;
      });
      return false;
    } else {
      warningToast(context, 'Incorrect Code!');
      return false;
    }
  }
}
