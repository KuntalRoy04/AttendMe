import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common_widgets/features_card.dart';
import '../../../constants/image_strings/image_strings.dart';

class LoginDashboardScreen extends StatelessWidget {
  const LoginDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          //-Below is the application Background of grey half circle svg.
          SvgPicture.asset(svgBg, fit: BoxFit.cover,)          ,//-A Column containing the App name and Features Card in to it
          Padding(
            padding: EdgeInsets.only(left: screenWidth*0.05, right: screenWidth*0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //-Welcoming the user with the Application name along with Tagline
                Padding(
                  padding: EdgeInsets.only(top: screenHeight*0.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to AttendMe",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        "Mark your Attendance",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                SizedBox(height: screenHeight*0.15),
                //-Feature Card containing features of the application and showing as a banner type in Login Dashboard Screen
                Padding(
                  padding: EdgeInsets.only(left: screenWidth*0.3),
                  child: const FeaturesCard(),
                ),
              ],
            ),
          ),
          //-Login Area containing one button as 'Login as Student' and one clickable text as 'Join as a Faculty'
          Positioned(
            bottom: screenWidth*0,
            left: screenWidth*0.05,
            right: screenWidth*0.05,
            child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'studentLogin');
                        },
                        child: Text("Login as Student",
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white)
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight*0.02, bottom: screenHeight*0.02),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, 'facultyLogin');
                          },
                          child: InkWell(
                            child: Text(
                              "Join as a Faculty",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(color: const Color(0xFF1C5D99),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
