import 'package:flutter/material.dart';

import 'color.dart';

class ThemeX {
  static final _floatingActionButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: ColorsX.primary,
  );

  static final _bottomNavigationBarTheme = BottomNavigationBarThemeData(
    selectedItemColor: ColorsX.primary,
  );

  static const colorScheme = ColorScheme.light(
    primary: ColorsX.primary,
  );

  static final global = ThemeData.from(colorScheme: colorScheme).copyWith(
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      backgroundColor: ColorsX.primary,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    floatingActionButtonTheme: _floatingActionButtonTheme,
    bottomNavigationBarTheme: _bottomNavigationBarTheme,
    iconTheme: IconThemeData(
      color: ColorsX.grey,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        // padding: const EdgeInsets.symmetric(vertical: 16),
        primary: ColorsX.primary,
        textStyle: TextStyle(
            // fontSize: 18,
            ),
      ),
    ),
  );
}
