import 'package:flutter/material.dart';

void successToast(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent.withOpacity(0),
      elevation: 0.0,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
      duration: const Duration(seconds: 10),
    ),
  );
}

void dangerToast(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent.withOpacity(0),
      elevation: 0.0,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      duration: const Duration(seconds: 5),
    ),
  );
}

void warningToast(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent.withOpacity(0),
      elevation: 0.0,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
      duration: const Duration(seconds: 5),
    ),
  );
}



