import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../general/show_toast.dart';

// ... other imports and widget code

showAlertDialog(BuildContext context, DocumentReference documentReference, DocumentSnapshot docSnapshot, String subjectValue) {
  // Create AlertDialog with title and content
  Widget okButton = TextButton(
    child: const Text("Confirm"),
    onPressed: () async {
      await documentReference.update({
        subjectValue: docSnapshot.get(subjectValue) + 1
      });
      successToast(context, "Class created successfully");
      (context.mounted)?
      Navigator.of(context).pushNamedAndRemoveUntil(
        'navigationFaculty', // Replace with the name of the desired route
            (route) => false,
      ):'';
      // Navigator.pushReplacementNamed(context, 'navigationFaculty'):'';
      // Perform desired action for "Yes" choice
    },
  );

  Widget cancelButton = TextButton(
    child: const Text("Go back"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Center(child: Text("Confirm your Choice", style: Theme.of(context).textTheme.displaySmall,)),
    content: Text("Please confirm that you are sure to create the class? This can't be undone further.", style: Theme.of(context).textTheme.titleSmall),
    actions: [
      okButton,
      cancelButton,
    ],
  );

  // Show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
