// Show a warning message using a SnackBar
import 'package:flutter/material.dart';

void showWarningMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.black,
    ),
  );
}
