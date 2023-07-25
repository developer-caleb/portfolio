import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle heading1 =
      TextStyle(fontSize: 24, fontWeight: AppFontWeight.bold);
  static const TextStyle heading2 =
      TextStyle(fontSize: 22, fontWeight: AppFontWeight.bold);
  static const TextStyle button1 =
      TextStyle(fontSize: 18, fontWeight: AppFontWeight.bold);
  static const TextStyle body1 =
      TextStyle(fontSize: 18, fontWeight: AppFontWeight.medium);
  static const TextStyle heading3 =
      TextStyle(fontSize: 17, fontWeight: AppFontWeight.semiBold);
  static const TextStyle body2 = TextStyle(
      fontSize: 16,
      fontWeight: AppFontWeight.regular,
      height: 1.44 // lineSpacingExtra : 7 -> 23 / 16 = 1.44
      );
  static const TextStyle heading4 =
      TextStyle(fontSize: 16, fontWeight: AppFontWeight.light);
  static const TextStyle subtitle1 =
      TextStyle(fontSize: 15, fontWeight: AppFontWeight.medium);
  static const TextStyle body3 =
      TextStyle(fontSize: 14, fontWeight: AppFontWeight.bold);
  static const TextStyle subtitle2 =
      TextStyle(fontSize: 14, fontWeight: AppFontWeight.regular);
  static const TextStyle button2 =
      TextStyle(fontSize: 13, fontWeight: AppFontWeight.semiBold);
  static const TextStyle subtitle3 =
      TextStyle(fontSize: 13, fontWeight: AppFontWeight.regular);
  static const TextStyle subtitle4 =
      TextStyle(fontSize: 11, fontWeight: AppFontWeight.regular);
}


class AppFontWeight {
  static const FontWeight black = FontWeight.w900;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight thin = FontWeight.w100;
}
