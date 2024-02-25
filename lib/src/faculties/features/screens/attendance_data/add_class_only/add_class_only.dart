import 'package:Attendme/src/general/show_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Attendme/src/faculties/common_functions/show_alert.dart';

class AddClassOnlyScreen extends StatefulWidget {
  const AddClassOnlyScreen({super.key});

  @override
  State<AddClassOnlyScreen> createState() =>
      _AddClassOnlyScreenState();
}

class _AddClassOnlyScreenState
    extends State<AddClassOnlyScreen> {
  String? semesterValue = "Select";
  String? streamValue = "Select";
  String? sectionValue = "Select";
  String? subjectValue = 'Select';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(child: Text('Create your class')),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Choose your class details",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (semesterValue != 'Select' &&
                            streamValue != 'Select' &&
                            sectionValue != 'Select' &&
                            subjectValue != 'Select') {
                          DocumentReference documentReference =
                          FirebaseFirestore.instance
                              .collection('classes')
                              .doc(semesterValue)
                              .collection(streamValue!)
                              .doc(sectionValue);
                          DocumentSnapshot docSnapshot =
                          await documentReference.get();
                          if (docSnapshot.exists) {
                            context.mounted?
                            showAlertDialog(context, documentReference, docSnapshot, subjectValue!):'';
                          } else {
                            context.mounted?dangerToast(context, "Something went wrong!"):'';
                          }
                        } else {
                          dangerToast(context, "Select all the fields");
                        }
                      },
                      child: const Icon(
                        Icons.arrow_forward_outlined,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              //Choose Semester
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Semester",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    DropdownButton<String>(
                      value: semesterValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          semesterValue = newValue!;
                        });
                      },
                      underline: Container(
                        height: 1,
                        color: Colors.black,
                      ),
                      items: const [
                        DropdownMenuItem(
                            value: "Select", child: Text("Select")),
                        // DropdownMenuItem(value: "s1", child: Text("1st")),
                        // DropdownMenuItem(value: "s2", child: Text("2nd")),
                        // DropdownMenuItem(value: "s3", child: Text("3rd")),
                        DropdownMenuItem(value: "s4", child: Text("4th")),
                        // DropdownMenuItem(value: "s5", child: Text("5th")),
                        DropdownMenuItem(value: "s6", child: Text("6th")),
                        // DropdownMenuItem(value: "s7", child: Text("7th")),
                        // DropdownMenuItem(value: "s8", child: Text("8th")),
                      ],
                    ),
                  ],
                ),
              ),
              //Choose Stream
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Stream",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    DropdownButton<String>(
                      value: streamValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          streamValue = newValue;
                        });
                      },
                      underline: Container(
                        height: 1,
                        color: Colors.black,
                      ),
                      items: const [
                        DropdownMenuItem(
                            value: "Select", child: Text("Select")),
                        DropdownMenuItem(value: "cst", child: Text("CST")),
                        DropdownMenuItem(value: "csit", child: Text("CSIT")),
                      ],
                    )
                  ],
                ),
              ),
              //Choose Section
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Section",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    DropdownButton<String>(
                      value: sectionValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          sectionValue = newValue!;
                        });
                      },
                      underline: Container(
                        height: 1,
                        color: Colors.black,
                      ),
                      items: const [
                        DropdownMenuItem(
                            value: "Select", child: Text("Select")),
                        DropdownMenuItem(value: "A", child: Text("A")),
                        DropdownMenuItem(value: "B", child: Text("B")),
                        DropdownMenuItem(value: "C", child: Text("C")),
                      ],
                    ),
                  ],
                ),
              ),
              //Choose Subject
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Subject",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(width: 2),
                    streamValue == 'cst' || streamValue == 'csit'
                        ? semesterValue == 's4'
                        ? DropdownButton<String>(
                      value: subjectValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          subjectValue = newValue!;
                        });
                      },
                      underline: Container(
                        height: 1,
                        color: Colors.black,
                      ),
                      items: const [
                        DropdownMenuItem(
                            value: "Select",
                            child: Column(
                              children: [
                                Text("Select"),
                                Divider(
                                  thickness: 2,
                                )
                              ],
                            )),
                        DropdownMenuItem(
                            value: "espiv",
                            child: Column(
                              children: [
                                Text("ESP-IV"),
                                Divider(
                                  thickness: 2,
                                )
                              ],
                            )),
                        DropdownMenuItem(
                            value: "oops",
                            child: Column(
                              children: [
                                Text("OOPS"),
                                Divider(
                                  thickness: 2,
                                )
                              ],
                            )),
                        DropdownMenuItem(
                            value: "oopslab",
                            child: Column(
                              children: [
                                Text("OOPS(L)"),
                                Divider(
                                  thickness: 2,
                                )
                              ],
                            )),
                        DropdownMenuItem(
                            value: "discretemath",
                            child: Column(
                              children: [
                                Text("Discrete Math"),
                                Divider(
                                  thickness: 2,
                                )
                              ],
                            )),
                        DropdownMenuItem(
                          value: "dnaalgo",
                          child: Column(
                            children: [
                              Text("Design & analysis of Algo."),
                              Divider(
                                thickness: 2,
                              )
                            ],
                          ),
                        ),
                        DropdownMenuItem(
                            value: "dnaalgolab",
                            child: Column(
                              children: [
                                Text(
                                  "D & A of Algo.(L)",
                                ),
                                Divider(
                                  thickness: 2,
                                )
                              ],
                            )),
                        DropdownMenuItem(
                            value: "cona",
                            child: Column(
                              children: [
                                Text(
                                    "Computer Org. & Arch."),
                                Divider(
                                  thickness: 2,
                                )
                              ],
                            )),
                        DropdownMenuItem(
                            value: "conalab",
                            child: Column(
                              children: [
                                Text("Computer Org. & Arch.(L)"),
                                Divider(
                                  thickness: 2,
                                )
                              ],
                            )),
                        DropdownMenuItem(
                            value: "sdpiv",
                            child: Column(
                              children: [
                                Text("SDP-IV"),
                                Divider(
                                  thickness: 2,
                                )
                              ],
                            )),
                        DropdownMenuItem(
                            value: "management1",
                            child: Column(
                              children: [
                                Text("Management-I"),
                                Divider(
                                  thickness: 2,
                                )
                              ],
                            )),
                        DropdownMenuItem(
                            value: "seaap",
                            child: Column(
                              children: [
                                Text("Soft. Eng. & Agile Prog."),
                                Divider(
                                  thickness: 2,
                                )
                              ],
                            )),
                        DropdownMenuItem(
                            value: "seaaplab",
                            child: Column(
                              children: [
                                Text(
                                    "Soft. Eng. & Agile Prog.(L)"),
                                Divider(
                                  thickness: 2,
                                )
                              ],
                            )),
                      ],
                    )
                        : semesterValue == 's6'
                        ? DropdownButton<String>(
                      value: subjectValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          subjectValue = newValue!;
                        });
                      },
                      underline: Container(
                        height: 1,
                        color: Colors.black,
                      ),
                      items: const [
                        DropdownMenuItem(
                            value: "Select",
                            child: Text("Select")),
                        DropdownMenuItem(
                            value: "test6",
                            child: Text("test6")),
                        DropdownMenuItem(
                            value: "test7",
                            child: Text("test7")),
                        DropdownMenuItem(
                            value: "test8",
                            child: Text("test8")),
                        DropdownMenuItem(
                            value: "test9",
                            child: Text("test9")),
                        DropdownMenuItem(
                            value: "test10",
                            child: Text("test10")),
                      ],
                    )
                        : DropdownButton<String>(
                      value: subjectValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          subjectValue = newValue!;
                        });
                      },
                      underline: Container(
                        height: 1,
                        color: Colors.black,
                      ),
                      items: const [
                        DropdownMenuItem(
                            value: "Select",
                            child: Text("Select")),
                      ],
                    )
                        : DropdownButton<String>(
                      value: subjectValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          subjectValue = newValue!;
                        });
                      },
                      underline: Container(
                        height: 1,
                        color: Colors.black,
                      ),
                      items: const [
                        DropdownMenuItem(
                            value: "Select", child: Text("Select")),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
