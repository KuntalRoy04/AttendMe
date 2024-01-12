import 'package:flutter/material.dart';

import '../../../../students/common_widgets/greeting.dart';
import '../../../../students/constants/image_strings.dart';
import '../../../../students/constants/text_strings.dart';

class FAttendanceDataScreen extends StatefulWidget {
  const FAttendanceDataScreen({super.key});

  @override
  State<FAttendanceDataScreen> createState() => _FAttendanceDataScreenState();
}

class _FAttendanceDataScreenState extends State<FAttendanceDataScreen> {
  String greetImagePath = 'null';

  @override
  Widget build(BuildContext context) {
    if (getGreeting() == morningGreet) {
      greetImagePath = morningSky;
    } else if (getGreeting() == afternoonGreet) {
      greetImagePath = fAfternoonSky;
    } else if (getGreeting() == eveningGreet) {
      greetImagePath = eveningSky;
    } else {
      greetImagePath = morningSky;
    }
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(greetImagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(150))
            ),
            alignment: Alignment.topLeft,
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 20),
              child: Greeting(type: 'faculty',),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C5D99),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add, color: Colors.white, size: 50,),
                        Text("Add Class", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),),
                        Text("Take Attendance", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),)
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, 'addClassTakeAttendance');
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C5D99),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add, color: Colors.white, size: 50,),
                        Text("Add Class only", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white))
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, 'addClassOnly', );
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Recent class-codes: ", style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
