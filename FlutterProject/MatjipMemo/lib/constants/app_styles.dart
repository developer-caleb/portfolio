import 'package:flutter/material.dart';

import 'common_size.dart';

class AppStyles {
  AppStyles._(); ////instance 할 수 없음
  static TextStyle titleStyle = const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold, height: 1.4);
  static TextStyle moreTextStyle = const TextStyle(fontSize: 16, color: Colors.blue, height: 1.4);
  static TextStyle matjipName = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static TextStyle matjipStar = const TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static TextStyle menutext = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
  );
  static TextStyle pointTextStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  static TextStyle seperator = const TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle readBoardTime = TextStyle(fontSize: 14, color: Colors.grey[400], letterSpacing: 0.8);
  static TextStyle readBoardManager = const TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.bold);
  static TextStyle readBoardTitle = const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black87);
  static TextStyle readBoardContents = const TextStyle(color: Colors.black87, fontSize: 14);
  static TextStyle readBoardBoardList = TextStyle(color: Colors.grey[600]);
  static TextStyle readBoardBoardListBlue = const TextStyle(color: Colors.blue);
  static TextStyle profileTitleStyle = const TextStyle();
  static TextStyle profileSubtitleStyle = const TextStyle(fontSize: 16);
  static TextStyle writeBoardTitle = const TextStyle(
    fontSize: 17,
    color: Colors.black87,
  );
  static TextStyle refundTitleTextStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  static TextStyle refundDropdownTextStyle = const TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black54);
  static BoxDecoration roundGreyDecoration = BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(5)),
    border: Border.all(
      color: Colors.grey,
    ),
  );

  static ButtonStyle spinnerButtonStyle = ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: commonSGap, horizontal: commonLLGap)),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0), side: BorderSide(color: Colors.grey[200]!))));
  static TextStyle smallDescription = TextStyle(height: 1.4, fontSize: 14, color: Colors.grey[600]);
  static InputDecoration refundInputDecoration = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
