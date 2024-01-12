import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../common_functions/login/perform_login.dart';
import '../constants/image_strings/image_strings.dart';
import '../constants/text_strings/text_strings.dart';

class StudentLoginPage extends StatelessWidget {
  final TextEditingController enController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  StudentLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          loginSvgBg,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        studentLogin,
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(color: const Color(0xFF1C5D99)),
                      ),
                      Text(
                        "Welcome Back",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40,),
              TextField(
                controller: enController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(14),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  labelText: 'Enrolment number',
                  prefixIcon: Icon(Icons.perm_identity, color: Color(0xFF1C5D99)),
                ),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF1C5D99)),
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () async {
                    await performLogin(
                        enController.text, passwordController.text)
                        ? (!context.mounted)
                        ? ''
                        : Navigator.pushNamedAndRemoveUntil(
                        context, 'navigationStudent', (route) => false)
                        : Fluttertoast.showToast(
                      msg: "Incorrect login details",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  },
                  child: const Text("Login")),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, 'studentSignUp');
                    },
                    child: Text("Click here", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: const Color(0xFF1C5D99))),
                  ),
                  Text(" to register a new account.", style: Theme.of(context).textTheme.bodyMedium)
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
