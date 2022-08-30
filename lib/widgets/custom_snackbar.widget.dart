import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnackBar(String title, String message, int type) {
  Get.snackbar(
    title,
    message,
    margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
    icon: Icon(
      type == 0
          ? Icons.error_outline
          : type == 1
              ? Icons.done
              : Icons.warning_amber,
      color: Colors.white,
    ),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: type == 0
        ? Colors.red
        : type == 1
            ? Colors.green
            : Colors.yellow[500],
    colorText: Colors.white,
    duration: const Duration(seconds: 3),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
  );
}
