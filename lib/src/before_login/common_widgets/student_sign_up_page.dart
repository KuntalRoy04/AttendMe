import 'package:attendme/src/before_login/common_functions/sign_up/perform_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../general/show_toast.dart';
import '../constants/image_strings/image_strings.dart';
import '../constants/text_strings/text_strings.dart';

class StudentSignUpPage extends StatelessWidget {
  final TextEditingController enController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  StudentSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          loginSvgBg,
          fit: BoxFit.cover,
        ),
        Center(
          child: SingleChildScrollView(
            child: Padding(
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
                            studentSignUp,
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
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                          ],
                          controller: firstNameController,
                          decoration: const InputDecoration(
                            labelText: "First Name",
                          ),
                        ),
                      ),
                      const SizedBox(
                          width: 20), // Add space between text fields
                      Expanded(
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                          ],
                          controller: lastNameController,
                          decoration: const InputDecoration(
                            labelText: "Last Name",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          maxLength: 10,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          controller: phoneController,
                          decoration: const InputDecoration(
                            labelText: "Phone",
                            counterText: "",
                          ),
                        ),
                      ),
                      const SizedBox(
                          width: 20), // Add space between text fields
                      Expanded(
                        child: TextField(
                          controller: emailController,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@_.]'))
                          ],
                          decoration: const InputDecoration(
                            labelText: "Email",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: enController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(14),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Enrolment number',
                        prefixIcon: Icon(Icons.perm_identity, color: Color(0xFF1C5D99))
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: "Password",
                        prefixIcon: Icon(Icons.password, color: Color(0xFF1C5D99))
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: "Confirm Password",
                        prefixIcon: Icon(Icons.password,color: Color(0xFF1C5D99))
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (passwordController.text ==
                            confirmPasswordController.text) {
                          await performSignUp(
                                  enController.text,
                                  passwordController.text,
                                  firstNameController.text,
                                  lastNameController.text,
                                  phoneController.text,
                                  emailController.text)
                              ? (!context.mounted)
                                  ? ''
                                  : Navigator.pushNamedAndRemoveUntil(
                                      context, 'navigationStudent', (route) => false)
                              : dangerToast("Something went wrong!");
                        }
                        else{
                          Fluttertoast.showToast(
                            msg: "Password not matched",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.yellow,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      },
                      child: const Text("Sign Up")),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
