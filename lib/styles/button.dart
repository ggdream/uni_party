import 'package:flutter/material.dart';

class BtnStyles {
  static textStyle(BuildContext context) => TextButton.styleFrom(
    primary: Colors.black,
    backgroundColor: Theme.of(context).primaryColor,
  );
}
