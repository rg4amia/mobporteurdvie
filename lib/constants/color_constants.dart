import 'dart:ui';
import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class ColorConstants {
  static Color primaryColor = Colors.white;
  static Color appBarColor = Colors.teal[100]!;
  static List<Color> addTodoColor = [
    Colors.teal[900]!,
    Colors.teal[700]!,
    Colors.teal[500]!
  ];
  static Color todoTitleColor = Colors.black;
  static Color deleteIconColor = Colors.red;
}
