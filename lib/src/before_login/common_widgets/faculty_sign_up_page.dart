import 'package:attendme/src/before_login/common_functions/faculty_sign_up/perform_faculty_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../general/show_toast.dart';

class FacultySignUpPage extends StatelessWidget {
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  FacultySignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
                            'Create a\nFaculty Account',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(color: const Color(0xFF1C5D99)),
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
                          controller: firstNameController,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                          ],
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
                          controller: phoneController,
                          decoration: const InputDecoration(
                            labelText: "Phone",
                            counterText: ""
                          ),
                        ),
                      ),
                      const SizedBox(
                          width: 20), // Add space between text fields
                      Expanded(
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@_.]'))
                          ],
                          controller: emailController,
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
                    controller: passwordController,
                    decoration: const InputDecoration(
                        labelText: "Password",
                        prefixIcon:
                            Icon(Icons.password, color: Color(0xFF1C5D99))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: confirmPasswordController,
                    decoration: const InputDecoration(
                        labelText: "Confirm Password",
                        prefixIcon: Icon(
                          Icons.password,
                          color: Color(0xFF1C5D99),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (passwordController.text ==
                            confirmPasswordController.text) {
                          await performFacultySignUp(
                              passwordController.text,
                              firstNameController.text,
                              lastNameController.text,
                              phoneController.text,
                              emailController.text)?(context.mounted)?Navigator.pushNamedAndRemoveUntil(
                              context, 'navigationFaculty', (route) => false):'':dangerToast("Something went wrong!");
                        }
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0)),
                      ),
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
