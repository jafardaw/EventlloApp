import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message,
    {Color color = Colors.black}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
      duration: const Duration(seconds: 2),
    ),
  );
}
