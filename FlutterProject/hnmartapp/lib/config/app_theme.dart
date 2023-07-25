import 'package:flutter/material.dart';
import 'package:hanaromart/config/app_colors.dart';
import 'package:hanaromart/config/constants/constants.dart';

class AppTheme {
  AppTheme._(); //it can help you prevent to make instance of this class

  static ThemeData light = ThemeData(
    fontFamily: fontFamily,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.grey[700]),
    backgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(color: AppColors.black, fontSize: 22, fontWeight: FontWeight.w600),
      iconTheme: IconThemeData(color: AppColors.black),
      centerTitle: true,
      //shadowColor: AppColors.mainColor,
      elevation: 0,
      backgroundColor: AppColors.white,
    ),
    colorScheme: ColorScheme.fromSwatch(
      accentColor: Color(0xFF16B368), // but now it should be declared like this
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500),
    ),
  );
}
