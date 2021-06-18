import 'package:flutter/material.dart';

import 'color.dart';

class BtnStyles {
  BtnStyles._();

  static textStyle(BuildContext context) => TextButton.styleFrom(
        primary: ColorsX.text,
        backgroundColor: Theme.of(context).primaryColor,
      );

  static elevatedStyle(BuildContext context) => ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor,
        onPrimary: ColorsX.text,
      );
}
