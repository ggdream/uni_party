import 'package:flutter/material.dart';

import 'color.dart';

class BorderX {
  static final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(24),
    borderSide: BorderSide(
      color: ColorsX.grey,
    ),
  );

    static final OutlineInputBorder outlineLoginInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  );
}
