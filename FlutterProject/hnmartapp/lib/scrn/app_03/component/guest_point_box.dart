import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/routes/router_name.dart';
import 'package:hanaromart/scrn/app_03/component/barcode_button.dart';

import '../../../widgets/custom_text.dart';
import 'tab_icon.dart';

class GuestPointBox extends StatelessWidget {
  const GuestPointBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  '하나로마트앱 쇼핑 혜택 이용을 위해 로그인이 필요합니다.',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 5),
              BarCodeButton(),
            ],
          ),
          SizedBox(height: 20),
          buildLoginButton(),
        ],
      ),
    );
  }

  InkWell buildLoginButton() {
    return InkWell(
      onTap: () => Get.toNamed(Routes.LOGIN),
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
            top: Radius.circular(15),
          ),
          color: Color(0xFF27675F),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 10),
            Container(
              margin: EdgeInsets.only(top: 4),
              child: Center(
                child: TabIcon('lockericon'),
              ),
            ),
            CustomText(
              text: '로그인 하기',
              color: Colors.white,
              size: 22,
              weight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
