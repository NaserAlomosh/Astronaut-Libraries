import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomShowDailog {
  showDailog({
    required BuildContext context,
    required void Function() okOnTap,
    required String description,
    required String title,
  }) {
    return showDialog(
      barrierColor: Colors.black.withOpacity(0.2),
      context: context,
      builder: (BuildContext context) {
        // Return the Dialog widget
        return AlertDialog(
          title: Text(title),
          content: Text(description),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: okOnTap,
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
