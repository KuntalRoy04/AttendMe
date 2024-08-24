import 'package:Attendme/src/students/common_functions/get_user_locally.dart';
import 'package:flutter/material.dart';

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
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C5D99),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SvgPicture.asset(attendMeLogo, width: 70, height: 70,),
                                Text("Attendance Percentage: Coming soon", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),),
                              ],
                            )
                          ],

                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Text("Attendance Information: ", style: Theme.of(context).textTheme.bodyLarge),
                    //   ],
                    // ),
                    // const SizedBox(height: 10,),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height,
                    //   child: ListView(
                    //     padding: EdgeInsets.zero,
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.only(top: 5),
                    //         child: Container(
                    //           height: 70,
                    //           width: double.infinity,
                    //           decoration: BoxDecoration(
                    //               color: Colors.grey.withOpacity(0.2),
                    //               borderRadius: BorderRadius.circular(10)
                    //           ),
                    //           child: const Padding(
                    //             padding: EdgeInsets.all(8.0),
                    //             child: Row(
                    //               mainAxisAlignment: MainAxisAlignment.start,
                    //               children: [
                    //                 Text("Check class wise attendance"),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.only(top: 5),
                    //         child: Container(
                    //           height: 70,
                    //           width: double.infinity,
                    //           decoration: BoxDecoration(
                    //               color: Colors.grey.withOpacity(0.2),
                    //               borderRadius: BorderRadius.circular(10)
                    //           ),
                    //           child: const Padding(
                    //             padding: EdgeInsets.all(8.0),
                    //             child: Row(
                    //               mainAxisAlignment: MainAxisAlignment.start,
                    //               children: [
                    //                 Text("Check attendance percentage this month"),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.only(top: 5),
                    //         child: Container(
                    //           height: 70,
                    //           width: double.infinity,
                    //           decoration: BoxDecoration(
                    //               color: Colors.grey.withOpacity(0.2),
                    //               borderRadius: BorderRadius.circular(10)
                    //           ),
                    //           child: const Padding(
                    //             padding: EdgeInsets.all(8.0),
                    //             child: Row(
                    //               mainAxisAlignment: MainAxisAlignment.start,
                    //               children: [
                    //                 Text("Total classes: 80"),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                  ],
                ),
              ),
            )
        ),
      ],
    ));
  }
}
