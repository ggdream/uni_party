import 'package:flutter/material.dart';

Future<T?> showDialogX<T>(BuildContext context, Widget child) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return child;
    },
  );
}
