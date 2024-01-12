import 'package:attendme/src/students/common_functions/submit_attendance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AttendanceInput extends StatefulWidget {
  const AttendanceInput({super.key});

  @override
  State<AttendanceInput> createState() => _AttendanceInputState();
}

class _AttendanceInputState extends State<AttendanceInput> {
  TextEditingController attendanceEnController = TextEditingController();
  TextEditingController attendanceCodeController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 200),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
              child: Column(
                children: [
                  Container(
                    height: 4,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Colors.grey
                    ),
                  ),
                  const SizedBox(height: 35,),
                  TextField(
                    controller: attendanceEnController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(14),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                        label: Text("Enrolment Number", style: TextStyle(fontSize: 18),)
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: attendanceCodeController,
                    decoration: const InputDecoration(
                        label: Text("Secret Code", style: TextStyle(fontSize: 18),)
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(onPressed: () async {
                    Future<bool> developerMode = Future.value(false);
                    setState(() {
                      isLoading = true;
                    });
                    submitAttendance(context, attendanceEnController, attendanceCodeController, await developerMode);
                    setState(() {
                      isLoading = false;
                    });
                  }, child: isLoading
                      ? const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Set the color
                      strokeWidth: 4,
                    ),
                  )
                      : const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Submit'),
                  )
                  ),
                  const SizedBox(height: 15,),
                  Text("or", style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black),),
                  const Divider(thickness: 2,),
                  GestureDetector(
                    onTap: (){},
                    child: const Icon(
                      Icons.qr_code_2_rounded,
                      size:150
                    ),
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
