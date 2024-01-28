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
  Widget build(BuildContext context){
    return Scaffold(
      appBar: null,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    try{
      controller.scannedDataStream.listen((Barcode scanData) async {
      // controller.stopCamera();
      if (kDebugMode) {
        print('Scanned data: ${scanData.code}');
      }
      Vibration.vibrate();
      controller.pauseCamera();
      String? enNum = await getEnNum();
      final bool developerMode = await FlutterJailbreakDetection.developerMode;
      if(context.mounted){
        await submitAttendance(context, enNum!, scanData.code!, developerMode);
        context.mounted? Navigator.pop(context):'';
      }
    });
    }
    catch(e){
      if (kDebugMode) {
        print("Error: $e");
      }
      dangerToast(context, "QR not supported");
      context.mounted? Navigator.pop(context):'';
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
