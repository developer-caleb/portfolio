import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/routes/router_name.dart';
import 'package:hanaromart/widgets/buttons/coupon_check_button.dart';

Future<dynamic> couponBottomSheet() {
  return Get.bottomSheet(
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 40),
          _bottomSheetHeader(),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 32),
            child: CouponCheckButton(
              onTap: () {
                Get.until((route) => route is! PopupRoute); //팝업창 모두 끄기
                Get.toNamed(Routes.COUPON_LIST);
              },
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xFF167CB3),
                Color(0xFF45C386),
              ])),
              child: Center(
                child: Text(
                  '스탬프 적립 완료\n모바일 앱 쿠폰이 발급되었습니다.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                    letterSpacing: -0.32,
                  ),
                ),
              ))
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.white);
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
