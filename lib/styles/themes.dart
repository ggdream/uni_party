import 'package:flutter/material.dart';

import 'colors.dart';

class ThemesX {
  static final _floatingActionButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: ColorsX.primary,
  );

  static final _bottomNavigationBarTheme = BottomNavigationBarThemeData(
    selectedItemColor: ColorsX.primary,
  );

  static final global = ThemeData(
    primaryColor: ColorsX.primary,
    floatingActionButtonTheme: _floatingActionButtonTheme,
    bottomNavigationBarTheme: _bottomNavigationBarTheme,
  );
}
