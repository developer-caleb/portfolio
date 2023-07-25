import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> customBottomSheet({Widget? body, Widget? footerWidget}) {
  return Get.bottomSheet(
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 40),
          _bottomSheetHeader(),
          body ?? SizedBox.shrink(),
          bottomSheetFooter(footerWidget),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.white);
}

Container bottomSheetFooter(Widget? footerWidget) {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.maxFinite,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFF167CB3),
        Color(0xFF45C386),
      ])),
      child: footerWidget ?? SizedBox.shrink());
}

Row _bottomSheetHeader() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Spacer(),
      Container(
        width: 80,
        height: 4,
        decoration: ShapeDecoration(
          color: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
      Expanded(
          child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Image.asset('assets/app_23/ic_popup_close.png'),
          ),
        ),
      ))
    ],
  );
}
