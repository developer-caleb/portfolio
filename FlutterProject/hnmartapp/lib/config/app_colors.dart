import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); //it can help you prevent to make instance of this class
  static Color black = const Color(0xff000000);
  static Color white = Color(0xffffffff);
  static Color whiteA700 = Color(0xffffffff);
  static Color gray600 = Color(0xff7a7373);
  static Color black90001 = Color(0xff0a0a0a);
  static Color black900 = Color(0xff000000);
  static Color gray800 = Color(0xff3d3e42);
  static Color blueGray700 = Color(0xff27675f);
  static Color gray50 = Color(0xfffffafa);
  static Color black0B0A0A = Color(0xff0b0a0a);
  static Color primary = Color(0xff245E57);

  static Color grey(int num) {
    String hexValue = num.toRadixString(16).padLeft(2, '0');
    String hexColor = '0xFF$hexValue$hexValue$hexValue';
    return Color(int.parse(hexColor));
  }

/*  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }*/
}
