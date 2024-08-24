import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShowQR extends StatelessWidget{
  final String secretCode;
  const ShowQR({super.key, required this.secretCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: QrImageView(
              data: secretCode,
              version: QrVersions.auto,
              size: 200,
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

}