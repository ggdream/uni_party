import 'package:flutter/material.dart';

import 'color.dart';

class ThemesX {
  static final _floatingActionButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: ColorsX.primary,
  );

  static final _bottomNavigationBarTheme = BottomNavigationBarThemeData(
    selectedItemColor: ColorsX.primary,
  );

  static final global =
      ThemeData.from(colorScheme: ColorScheme.light()).copyWith(
    appBarTheme: AppBarTheme(backgroundColor: ColorsX.primary),
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
