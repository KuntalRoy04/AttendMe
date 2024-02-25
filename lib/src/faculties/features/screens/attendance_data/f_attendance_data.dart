import 'package:Attendme/src/faculties/features/screens/attendance_data/show_qr.dart';
import 'package:Attendme/src/general/show_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../students/common_widgets/greeting.dart';
import '../../../../students/constants/image_strings.dart';
import '../../../../students/constants/text_strings.dart';
import '../../../common_functions/generate_excel.dart';
import '../../../common_functions/get_faculty_locally.dart';
import '../../../common_functions/get_generated_codes.dart';
import 'package:permission_handler/permission_handler.dart';

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
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(150))),
            alignment: Alignment.topLeft,
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 20),
              child: Greeting(
                type: 'faculty',
              ),
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
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 50,
                        ),
                        Text(
                          "Add Class",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.white),
                        ),
                        Text(
                          "Take Attendance",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
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
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 50,
                        ),
                        Text("Add Class only",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.white))
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      'addClassOnly',
                    );
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
                child: Text(
                  "Recent class-codes: ",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          FutureBuilder(
            future: getGeneratedCodes(),
            builder: (context, AsyncSnapshot<List<String>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<String> documentIDs = snapshot.data ?? [];
                return Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: ListView.builder(
                    itemCount: documentIDs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(documentIDs[index]),
                            GestureDetector(
                              onTap: () async {
                                await Permission.manageExternalStorage.request();
                                // var documentData = await fetchData(documentIDs[index]);
                                context.mounted?await writeToExcel(context, documentIDs[index], /*documentData*/):'';
                              },
                              child: const Icon(Icons.download_rounded),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.pushNamed(context, 'showQr', arguments: documentIDs[index]);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context) => ShowQR(secretCode: documentIDs[index]))
                                );
                              },
                              child: const Icon(Icons.qr_code_2_sharp),
                            ),
                            GestureDetector(
                              onTap: () async {
                                var secretCodeDocumentReference = FirebaseFirestore.instance.collection('secretCodes').doc(documentIDs[index]);
                                var facultyProfileSecretCodeDocumentReference = FirebaseFirestore.instance.collection('faculties').doc(await getFacultyId()).collection('secret_codes').doc(documentIDs[index]);
                                await secretCodeDocumentReference.delete();
                                await facultyProfileSecretCodeDocumentReference.delete();
                                context.mounted?dangerToast(context, '${documentIDs[index]} deleted'):'';
                                setState(() {});
                              },
                              child: const Icon(Icons.delete),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    ));
  }
}
