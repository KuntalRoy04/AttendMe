import 'package:Attendme/src/general/show_toast.dart';
import 'package:Attendme/src/students/common_functions/get_user_locally.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vibration/vibration.dart';

import '../../../common_functions/submit_attendance.dart';

class QRCodeScreen extends StatefulWidget {
  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  late QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    double boxSize = 200.0;
    return Scaffold(
      appBar: null,
      body: Stack(
        alignment: Alignment.center,
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: Text(
                    "Scan AttendMe QR",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: const Color(0xFF1C5D99),
                      width: 3.0,
                    ),
                  ),
                  width: boxSize,
                  height: boxSize,
                ),
                Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel")),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    try {
      controller.scannedDataStream.listen((Barcode scanData) async {
        // controller.stopCamera();
        if (kDebugMode) {
          print('Scanned data: ${scanData.code}');
        }
        Vibration.vibrate();
        controller.pauseCamera();
        String? enNum = await getEnNum();
        final bool developerMode = await FlutterJailbreakDetection.developerMode;
        // final bool developerMode = await Future.value(false);
        if (context.mounted) {
          await submitAttendance(
              context, enNum!, scanData.code!, developerMode);
          context.mounted ? Navigator.pop(context) : '';
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
      dangerToast(context, "QR not supported");
      context.mounted ? Navigator.pop(context) : '';
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
