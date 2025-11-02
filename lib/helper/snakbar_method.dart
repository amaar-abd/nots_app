import 'package:flutter/material.dart';

void snackBarr(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.cyan,
    ),
  );
}
