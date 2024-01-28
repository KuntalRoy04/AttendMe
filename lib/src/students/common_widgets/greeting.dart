import 'package:Attendme/src/faculties/common_functions/get_faculty_locally.dart';
import 'package:Attendme/src/students/common_functions/get_user_locally.dart';
import 'package:flutter/material.dart';
import '../constants/text_strings.dart';

String getGreeting() {

  var hour = DateTime.now().hour;
  if (hour < 12 && hour >= 2) {
    return morningGreet;
  } else if (hour < 18 && hour >= 12) {
    return afternoonGreet;
  } else if (hour >= 18 || hour < 2) {
    return eveningGreet;
  } else {
    return generalGreet;
  }
}

class Greeting extends StatelessWidget {
  final String type;

  const Greeting({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: type == 'student'? getFirstName():getFacultyFirstName(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          String? firstName = snapshot.data;
          return Text('${getGreeting()}\n$firstName', style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white),); // Display the user name
        } else if (snapshot.hasError) {
          return const Text('Error fetching user name'); // Handle errors
        } else {
          return Container(); // Show loading indicator
        }
      },
    );

  }
}
