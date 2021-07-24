import 'package:flutter/material.dart';

class HexColor extends Color {
  HexColor(String hex) : super(int.parse(hex, radix: 16));

  static String color2hex(Color color) => color.value.toRadixString(16);
}
