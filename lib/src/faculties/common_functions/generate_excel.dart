import 'dart:io';
import 'package:Attendme/src/general/show_toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';


Future<Map<String, dynamic>?> fetchData(String documentId) async {
  try {
    // Query Firestore based on the date or other parameters
    DocumentReference documentReference = FirebaseFirestore.instance.collection('secretCodes').doc(documentId);

    // Fetch the document
    DocumentSnapshot snapshot = await documentReference.get();

    // Check if there is data
    if (snapshot.exists) {
      // Access all fields
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      return data;
    } else {
      if (kDebugMode) {
        print('Document does not exist.');
      }
      return null; // Return null if the document does not exist
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error fetching data: $e');
    }
    return null; // Return null in case of an error
  }
}


Future<void> writeToExcel(BuildContext context, String documentId, Map<String, dynamic>? data) async {
  // Ensure that documentId is not empty or null
  if (documentId.isNotEmpty) {
    // Check if data is not null before proceeding
    if (data != null) {
      Map<String, dynamic> nonNullableData = data; // No need for ! operator here

      var excel = Excel.createExcel();
      var sheet = excel['Sheet1'];

      // Add headers
      sheet.appendRow(['Roll Number', 'Name']);

      // Add data
      nonNullableData.forEach((key, value) {
        sheet.appendRow([key, value.toString()]);
      });

      // Save to the "/storage/emulated/0/Download" directory
      String? result = await FilePicker.platform.getDirectoryPath();
      Directory? downloadsDirectory = Directory(result!);
      String excelPath = '${downloadsDirectory.path}/$documentId.xlsx';
      if (kDebugMode) {
        print(excelPath);
      }


      // Directory? downloadsDirectory = Directory("/storage/emulated/0/Download/attendme");
      // String excelPath = '${downloadsDirectory.path}/$documentId.xlsx';

      List<int> onValue = excel.encode() ?? []; // Provide an empty list as a default value if onValue is null
      File(excelPath)
        ..createSync(recursive: true)
        ..writeAsBytesSync(onValue);

      // successToast(context, "Excel file saved at: storage/Download/attendme");
      context.mounted?successToast(context, "Saved at $excelPath"):'';
    } else {
      dangerToast(context, "Error: Data is null. Cannot write to Excel!");
    }
  } else {
    dangerToast(context, "Something went wrong");
  }
}

