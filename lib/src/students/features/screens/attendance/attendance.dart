import 'package:Attendme/src/students/constants/image_strings.dart';
import 'package:Attendme/src/students/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../../../common_widgets/attendance_input.dart';
import '../../../common_widgets/greeting.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  bool isLoading = false;
  String greetImagePath = 'null';

  @override
  Widget build(BuildContext context) {
    if (getGreeting() == morningGreet){
      greetImagePath = morningSky;
    }
    else if (getGreeting() == afternoonGreet){
      greetImagePath = afternoonSky;
    }
    else if (getGreeting() == eveningGreet){
      greetImagePath = eveningSky;
    }
    else{
      greetImagePath = morningSky;
    }
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 270,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(greetImagePath),
                fit: BoxFit.cover, // Adjust as needed
              ),
            ),
            alignment: Alignment.topLeft,
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 20),
              child: Greeting(type: 'student'),
            ),
          ),
          const AttendanceInput(),
          // Add other widgets on top of the background image here
        ],
      ),
    );
  }
}
