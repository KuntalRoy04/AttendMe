import 'package:flutter/material.dart';

class FeaturesCard extends StatelessWidget{
  const FeaturesCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 0.1,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth*0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align the column content to the start (left)
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start, // Align each row content to the start (left)
              children: [
                Icon(Icons.location_on),
                Text(" Location Checking"),
              ],
            ),
            SizedBox(height: screenHeight*0.01),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.block),
                Text(" No Attendance Spoofing"),
              ],
            ),
            SizedBox(height: screenHeight*0.01),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.verified_user),
                Text(" Secure Environment"),
              ],
            ),
            SizedBox(height: screenHeight*0.01),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.qr_code),
                Text(" Scan and Attend feature"),
              ],
            ),
            SizedBox(height: screenHeight*0.01),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check),
                Text(" Easy User Interface"),
              ],
            ),
          ],
        ),
      ),
    );
  }

}