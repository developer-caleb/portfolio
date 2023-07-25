import 'package:flutter/material.dart';
import 'package:hanaromart/config/app_colors.dart';
import 'package:hanaromart/scrn/common/size_utils.dart';

class AppStyle {
  AppStyle._(); //it can help you prevent to make instance of this class
  static TextStyle txtInterSemiBold12Black90001 = TextStyle(
    color: AppColors.black90001,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtInterSemiBold20 = TextStyle(
    color: AppColors.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtInterSemiBold12 = TextStyle(
    color: AppColors.gray600,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtInterSemiBold16 = TextStyle(
    color: AppColors.black90001,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600,
  );

  static TextStyle tabLabel = TextStyle(
    color: AppColors.black0B0A0A,
    fontSize: getFontSize(
      13,
    ),
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w500,
  );
  static TextStyle pointLabel = TextStyle(
    color: AppColors.black.withOpacity(0.6),
    fontSize: getFontSize(
      15,
    ),
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600,
  );
  static TextStyle pointLabel2 = TextStyle(
    color: Color(0xff000908),
    fontSize: 15,
    fontWeight: FontWeight.w500,
    fontFamily: 'Pretendard',
  );
  static TextStyle noContents = TextStyle(
    fontSize: 18,
    color: AppColors.grey(0X0A),
    fontWeight: FontWeight.w600,
    fontFamily: 'Pretendard',
  );
  static TextStyle pointText = TextStyle(
    color: Color(0xff3B3B3A),
    fontSize: getFontSize(
      18,
    ),
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600,
  );
  static TextStyle eventCardText = TextStyle(
    color: Colors.black,
    fontSize: 13,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600,
    letterSpacing: -0.20,
  );
  static TextStyle pointText2 = TextStyle(
    color: Color(0xffFDC300),
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: 'Pretendard',
  );
  static ButtonStyle dialogTextRedButtonStyle = TextButton.styleFrom(
      textStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      foregroundColor: Color(0xFFFF2849),
      backgroundColor: Color(0xFF513036));
  static ButtonStyle dialogTextGreenButtonStyle = TextButton.styleFrom(
      textStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      foregroundColor: Color(0xFFF9FFFA),
      backgroundColor: Color(0xFF30C04F).withOpacity(0.9));
  static ButtonStyle phoneLoginButtonStyle = TextButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
    ),
    textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
    backgroundColor: Color(0xFF27675F),
    foregroundColor: Colors.white,
  );
  static ButtonStyle noContentsTextButton = TextButton.styleFrom(
    textStyle: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 13,
      fontFamily: 'Pretendard',
      letterSpacing: -0.20,
    ),
    backgroundColor: Color(0xFF4B7ECB),
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
    ),
  );
  static ButtonStyle eventButtonStyle = ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 10),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      textStyle: TextStyle(
        fontSize: 25,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w700,
        letterSpacing: -0.38,
      ),
      foregroundColor: Colors.white,
      backgroundColor: Color(0xFFE06D80));

  static ButtonStyle greyTextButton = TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: AppColors.grey(0x93),
      foregroundColor: Colors.white,
      textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20));
  static OutlineInputBorder normalInputBorder = //return type is OutlineInputBorder
      OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            color: AppColors.black,
            width: 1,
          ));

  static OutlineInputBorder completeInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(
        color: Color(0xFF00793E),
        width: 3,
      ));
  static ButtonStyle roundedElevatedButton = ElevatedButton.styleFrom(
      textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      foregroundColor: AppColors.black0B0A0A,
      backgroundColor: Color(0xFFF0F0F0),
      elevation: 5);
  static ButtonStyle roundedElevatedButton2 = ElevatedButton.styleFrom(
      textStyle: TextStyle(
        color: Color(0xFF3B3B3A),
        fontSize: 15,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w700,
        letterSpacing: -0.23,
      ),
      side: BorderSide(width: 1, color: Colors.black),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      backgroundColor: Color(0xFFEBECEF),
      foregroundColor: Colors.black,
      elevation: 5);
}
