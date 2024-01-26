import 'package:attendme/src/students/common_functions/get_user_locally.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../general/show_toast.dart';
import 'get_current_location.dart';
import 'is_location_in_area.dart';

Future<void> submitAttendance(
    context,
    String enNum,
    String secretCode ,
    developerMode) async {
  Position? currentLocation = await getCurrentLocation();
  if (enNum.isEmpty ||
      enNum.length != 14 ||
      secretCode.isEmpty ||
      !isLocationInArea(currentLocation!.latitude, currentLocation.longitude) ||
      await developerMode) {
    if (await developerMode) {
      warningToast(
          'Turn off Developer Mode because this allows location spoofing');
    } else if (enNum.isEmpty || enNum.length != 14 || secretCode.isEmpty) {
      dangerToast('Enter correct Enrolment number or secret code!');
    } else if (!isLocationInArea(
        currentLocation!.latitude, currentLocation.longitude)) {
      dangerToast('You are not in college!');
    }
    // setState(() {
    //   isLoading = false;
    // });
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
      await documentRefSecretCode.set({
        enNum: documentRefUsersSnapshot.get('full_name'),
      }, SetOptions(merge: true)).then((enrollmentDocRef) {
        // attendanceEnController.clear();
        // attendanceCodeController.clear();
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     Future.delayed(const Duration(seconds: 3), () {
        //       // Close the dialog after 3 seconds
        //       Navigator.of(context).pop();
        //     });
        //     return const AlertDialog(
        //       content: Column(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           Icon(
        //             Icons.check_circle,
        //             color: Colors.green,
        //             size: 50,
        //           ),
        //           SizedBox(height: 16),
        //           Text(
        //             "Attendance Marked",
        //             textAlign: TextAlign.center,
        //             style: TextStyle(fontSize: 16),
        //           ),
        //         ],
        //       ),
        //     );
        //   },
        // );
        successToast("Attendance Marked");
      }).catchError((error) {
        dangerToast('Could not upload Attendance!');
      });
    } else {
      warningToast('Incorrect Code!');
    }
  }
}
