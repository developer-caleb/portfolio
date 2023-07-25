import 'package:flutter/material.dart';
import 'package:matjipmemo/tools/enums.dart';

class AppColors {
  AppColors._(); ////instance 할 수 없음
  static const Color titleBackColor = Colors.white;
  static const Color accentColor = Colors.black87;
  static const Color circularProgressbarColor = greyB2;
  static const Color accentRed1 = Color(0xFFFF4D4D);
  // static const Color red1 = Color(0xFFFF5F4D);
  // static const Color red2 = Color(0xFFFF7F6D);
  static const Color yellow1 = Color(0xFFFF9E59);
  static const Color lastMainColor = Color(0xFFFFC4C5);
  static const Color grey868181 = Color(0xFF868181);
  static const Color grey33 = Color(0xFF333333);
  static const Color grey66 = Color(0xFF666666);
  static const Color grey76 = Color(0xFF767676);
  static const Color grey99 = Color(0xFF999999);
  static const Color greyB2 = Color(0xFFB2B2B2);
  static const Color greyB7 = Color(0xFFB7B7B7);
  static const Color greyBC = Color(0xFFBCBCBC);
  static const Color greyCC = Color(0xFFCCCCCC);
  static const Color greyC4 = Color(0xFFC4C4C4);
  static const Color greyC6 = Color(0xFFC6C3C3);
  static const Color greyE5 = Color(0xFFE5E5E5);
  static const Color greyEC = Color(0xFFE5E5E5);
  static const Color greyF4 = Color(0xFFF4F4F4);
  static const Color starYellow = Color(0xFFFFD600);

  static late MaterialColor mainColor;
  static late Color mainAccentColor;
  static late Color mapEatColor;
  static late Color mapTripColor;

  static const MaterialColor mainPurpleColor = MaterialColor(
    0xFFE484FF,
    <int, Color>{
      50: Color(0x0FE484FF),
      100: Color(0x1FE484FF),
      200: Color(0x2FE484FF),
      300: Color(0x3FE484FF),
      400: Color(0x4FE484FF),
      500: Color(0x5FE484FF),
      600: Color(0x6FE484FF),
      700: Color(0x7FE484FF),
      800: Color(0x8FE484FF),
      900: Color(0x9FE484FF),
      1000: Color(0xAFE484FF),
      1100: Color(0xBFE484FF),
      1200: Color(0xCFE484FF),
      1300: Color(0xDFE484FF),
      1400: Color(0xEFE484FF),
    },
  );

  static void changeMainColor(PostMode mode) {
    bool isBlue = true;
    switch (mode) {
      case PostMode.eatrip:
        mainColor = mainPurpleColor;
        mainAccentColor = Colors.purple;
        break;
      case PostMode.eat:
        mainColor = mainRedColor;
        mainAccentColor = Colors.red;
        break;
      case PostMode.trip:
        mainColor = mainBlueColor;
        mainAccentColor = isBlue ? Colors.blue : Colors.green;
        mainColor = isBlue ? mainBlueColor : mainGreenColor;
        break;
    }
    mapEatColor = mainRedColor;
    mapTripColor = isBlue ? mainBlueColor : mainGreenColor;
  }

  static const MaterialColor mainRedColor = MaterialColor(
    // 0xFFFF5F4D,
    0xFFFF7F6D,
    <int, Color>{
      50: Color(0x0FFF7F6D),
      100: Color(0x1FFF7F6D),
      200: Color(0x2FFF7F6D),
      300: Color(0x3FFF7F6D),
      400: Color(0x4FFF7F6D),
      500: Color(0x5FFF7F6D),
      600: Color(0x6FFF7F6D),
      700: Color(0x7FFF7F6D),
      800: Color(0x8FFF7F6D),
      900: Color(0x9FFF7F6D),
      1000: Color(0xAFFF7F6D),
      1100: Color(0xBFFF7F6D),
      1200: Color(0xCFFF7F6D),
      1300: Color(0xDFFF7F6D),
      1400: Color(0xEFFF7F6D),
    },
  );
  static const MaterialColor mainGreenColor = MaterialColor(
    // 0xFFFF5F4D,
    0xFF00C291,
    <int, Color>{
      50: Color(0x0F00C291),
      100: Color(0x1F00C291),
      200: Color(0x2F00C291),
      300: Color(0x3F00C291),
      400: Color(0x4F00C291),
      500: Color(0x5F00C291),
      600: Color(0x6F00C291),
      700: Color(0x7F00C291),
      800: Color(0x8F00C291),
      900: Color(0x9F00C291),
      1000: Color(0xAF00C291),
      1100: Color(0xBF00C291),
      1200: Color(0xCF00C291),
      1300: Color(0xDF00C291),
      1400: Color(0xEF00C291),
    },
  );
  static const MaterialColor mainBlueColor = MaterialColor(
    0xFF47B3FF,
    <int, Color>{
      50: Color(0x0F47B3FF),
      100: Color(0x1F47B3FF),
      200: Color(0x2F47B3FF),
      300: Color(0x3F47B3FF),
      400: Color(0x4F47B3FF),
      500: Color(0x5F47B3FF),
      600: Color(0x6F47B3FF),
      700: Color(0x7F47B3FF),
      800: Color(0x8F47B3FF),
      900: Color(0x9F47B3FF),
      1000: Color(0xAF47B3FF),
      1100: Color(0xBF47B3FF),
      1200: Color(0xCF47B3FF),
      1300: Color(0xDF47B3FF),
      1400: Color(0xEF47B3FF),
    },
  );
}
