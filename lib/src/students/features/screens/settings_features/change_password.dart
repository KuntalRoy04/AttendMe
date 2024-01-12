import 'package:attendme/src/general/show_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../common_functions/get_user_locally.dart';

class ChangePasswordScreen extends StatefulWidget{
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Container containing settings banner
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 50,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xFF1C5D99)
              ),
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(top: 60.0, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Reset Password", style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white)),
                      const SizedBox(height: 5),
                      Text("Change your AttendMe account password", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),),
                    ],
                  )
              ),
            ),
          ),
          //Containing settings' options | It contains he logout button
          SingleChildScrollView(
            child: Column(
              children: [
                //The upper blank space containing Logout button
                const SizedBox(
                  height: 155,
                ),
                //Scrollable Container containing options
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        //Scrollable indication bar
                        Container(
                          height: 4,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: Colors.grey
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextField(
                          controller: currentPasswordController,
                          decoration: const InputDecoration(
                            labelText: "Password",
                            hintText: "Current Password",
                            hintStyle: TextStyle(color: Colors.grey)
                          )
                        ),
                        const SizedBox(height: 20,),
                        TextField(
                          controller: newPasswordController,
                            decoration: const InputDecoration(
                                labelText: "New Password",
                            )
                        ),
                        const SizedBox(height: 20,),
                        TextField(
                          controller: confirmNewPasswordController,
                            decoration: const InputDecoration(
                                labelText: "Confirm Password",
                            )
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: () async {
                              final docRef = FirebaseFirestore.instance.collection('users').doc(await getEnNum());
                              final docSnapshot = await docRef.get();
                              if (newPasswordController.text == confirmNewPasswordController.text && currentPasswordController.text == await docSnapshot.get('password')){
                                await docRef.update({
                                  'password': newPasswordController.text
                                });
                                successToast("Password Changed Successfully");
                                (context.mounted)?Navigator.of(context).pop():'';
                              }else{
                                dangerToast("Enter correct information");
                              }
                            },
                            child: const Text("Reset Password")
                        )
                      ],
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