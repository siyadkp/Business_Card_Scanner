// Show an alert dialog
import 'package:business_card_scanner/view/home/widget/show_warning_message_widget/show_warning_message_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../screen_home.dart';

Future<void> showAlertDialog(
  BuildContext ctx,
  Function() function,
  String title,
  String message,
  String warningMessage,
) async {
  return showDialog(
    context: ctx,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Get.offAll(() => const ScreenHome());
            },
          ),
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              function();

              Get.offAll(() => const ScreenHome());
              showWarningMessage(context, warningMessage);
            },
          )
        ],
      );
    },
  );
}
