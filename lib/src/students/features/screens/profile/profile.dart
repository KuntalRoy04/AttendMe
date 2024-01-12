import 'package:attendme/src/before_login/constants/image_strings/image_strings.dart';
import 'package:attendme/src/students/common_functions/get_user_locally.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 550,
          child: Container(
            alignment: Alignment.topCenter,
            color: const Color(0xFF1C5D99),
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text("Profile", style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white),),
            ),
          ),
        ),
        Positioned(
          top: 120,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30,),
                    FutureBuilder<String?>(
                      future: getFullName(),
                      builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        String? firstName = snapshot.data;
                        return Text(firstName!, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),); // Display the user name
                      } else if (snapshot.hasError) {
                        return const Text('User'); // Handle errors
                      } else {
                        return const CircularProgressIndicator(); // Show loading indicator
                      }
                  },
                ),
                    const SizedBox(height: 10,),
                    FutureBuilder<String?>(
                      future: getEnNum(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          String? enNum = snapshot.data;
                          return Text('EID: ${enNum!}', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black),); // Display the user name
                        } else if (snapshot.hasError) {
                          return const Text('User ID');
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1C5D99),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 40, top: 15, bottom: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(attendMeLogo, width: 70, height: 70,),
                                  Column(
                                    children: [
                                      Text("Percentage: 70%", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),),
                                      const SizedBox(height: 10,),
                                      Text("Days: 15 this month", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white))
                                    ],
                                  ),
                                ],
                              )
                            ],

                          ),
                        ),
                      ),

                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Attendance Information: ", style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Total days present: 80"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Total days absent: 80"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Total classes: 80"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            )
        ),
        // Positioned(
        //   top: 100,
        //   left: 80,
        //   right: 80,
        //   child: CircleAvatar(
        //     radius: 50,
        //     backgroundColor: Colors.white,
        //     child: ClipOval(
        //     child: SvgPicture.asset(attendMeLogo, width: 90, height: 90, fit: BoxFit.cover,)
        //     )
        //     ),
        //   ),
        // Positioned(
        //   top: 150,
        //     left: 205,
        //     child: IconButton(onPressed: (){
        //
        //     }, icon: const Icon(Icons.camera_alt))
        // )
      ],
    ));
  }
}
