import 'package:flutter/material.dart';

Future<T?> showTypeBottomSheet<T>(BuildContext context, Widget child) {
  return showModalBottomSheet<T>(
    context: context,
    builder: (BuildContext context) {
      return child;
    },
  );
}
