import 'package:Attendme/src/before_login/common_functions/faculty_login/perform_faculty_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../general/show_toast.dart';

class FacultyLoginPage extends StatelessWidget {
  FacultyLoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Log in as\nFaculty",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(color: const Color(0xFF1C5D99)),
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
                  // Email field
                  TextFormField(
                    controller: emailController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z0-9@_.]'))
                    ],
                    decoration: const InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email, color: Color(0xFF1C5D99)),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  // Password field
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon:
                          const Icon(Icons.lock, color: Color(0xFF1C5D99)),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.visibility_off),
                        onPressed: () {
                          // Toggle password visibility
                        },
                      ),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20.0),
                  // Login button
                  ElevatedButton(
                    onPressed: () async {
                      await performFacultyLogin(
                              emailController.text, passwordController.text)
                          ? (context.mounted)
                              ?
                              // ignore: use_build_context_synchronously
                              Navigator.pushNamed(context, 'navigationFaculty')
                              : ''
                          : dangerToast(context, 'Incorrect Login Details');
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0)),
                    ),
                    child: const Text("Login"),
                  ),
                  const SizedBox(height: 10.0),
                  // Additional options
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'facultySignUp');
                        },
                        child: Text("Click here",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: const Color(0xFF1C5D99))),
                      ),
                      Text(" to register a new account.",
                          style: Theme.of(context).textTheme.bodyMedium)
                    ],
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
