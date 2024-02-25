import 'package:Attendme/src/general/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common_functions/get_user_locally.dart';
import '../common_functions/submit_attendance.dart';

class AttendanceInput extends StatefulWidget {
  const AttendanceInput({super.key});

  @override
  State<AttendanceInput> createState() => _AttendanceInputState();
}

class _AttendanceInputState extends State<AttendanceInput> {
  TextEditingController attendanceEnController = TextEditingController();
  TextEditingController attendanceCodeController = TextEditingController();
  bool isLoading = false;
  String? scannedCode;

  Future<void> scanQr() async{
    final qrCode = await FlutterBarcodeScanner.scanBarcode('#1C5D99', 'Cancel', false, ScanMode.QR);
    scannedCode = qrCode.toString();
    String? roll = await getRoll();
    // final bool developerMode = await FlutterJailbreakDetection.developerMode;
    final bool developerMode = await Future.value(false);
    context.mounted?await submitAttendance(
        context, roll!, scannedCode!, developerMode):'';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 200),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
              child: Column(
                children: [
                  Container(
                    height: 4,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  TextField(
                    controller: attendanceEnController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(14),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                        label: Text(
                      "Enrolment Number",
                      style: TextStyle(fontSize: 18),
                    )),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: attendanceCodeController,
                    decoration: const InputDecoration(
                        label: Text(
                      "Secret Code",
                      style: TextStyle(fontSize: 18),
                    )),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () async {
                        warningToast(context,
                            "This feature has been deprecated. Scan QR instead");
                        // Future<bool> developerMode = Future.value(false);
                        // setState(() {
                        //   isLoading = true;
                        // });
                        // submitAttendance(context, attendanceEnController.text, attendanceCodeController.text, await developerMode);
                        // setState(() {
                        //   isLoading = false;
                        // });
                      },
                      child: isLoading
                          ? const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.blue), // Set the color
                                strokeWidth: 4,
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('Submit'),
                            )),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "or",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Colors.black),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  GestureDetector(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      int loginTimestamp = prefs.getInt('loginTime') ?? 0;

                      DateTime loginTime =
                          DateTime.fromMillisecondsSinceEpoch(loginTimestamp);
                      DateTime currentTime = DateTime.now();
                      if (currentTime.difference(loginTime).inHours <= 1) {
                        scanQr();
                      }
                      else {
                        final bool developerMode =
                            await FlutterJailbreakDetection.developerMode;
                        developerMode
                            ? context.mounted
                                ? dangerToast(context,
                                    "You logged in so early, please wait ${60 - currentTime.difference(loginTime).inMinutes} more minutes and also turn off developer mode.")
                                : ''
                            : context.mounted
                                ? dangerToast(context,
                                    "You logged in so early, please wait ${60 - currentTime.difference(loginTime).inMinutes} more minutes.")
                                : '';
                      }
                    },
                    child: const Icon(Icons.qr_code_2_rounded, size: 150),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
