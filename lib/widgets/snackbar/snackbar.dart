import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarX {
  static void showGetX({required String message, String title = '通知'}) =>
      Get.snackbar(title, message);

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showRaw(BuildContext context, String text) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(text),
          duration: Duration(milliseconds: 1800),
        ),
      );
}
