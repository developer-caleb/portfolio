import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/routes/router_name.dart';
import 'package:hanaromart/scrn/app_03/component/barcode_button.dart';
import 'package:intl/intl.dart';

import '../../../config/app_style.dart';
import '../../../widgets/custom_text.dart';
import 'tab_icon.dart';

class UserPointBox extends StatelessWidget {
  const UserPointBox({super.key});

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
                  '안녕하세요 고객님\n편리한 쇼핑 혜택을 누려보세요!',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 5),
              BarCodeButton(),
            ],
          ),
          SizedBox(height: 20),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildPointColumn(flex: 84, labelText: '현재 보유 포인트(P)', point: 123123),
                VerticalDivider(
                  thickness: 2,
                  width: 15,
                  color: Color(0xFF3B3B3A),
                ),
                buildPointColumn(flex: 86, labelText: '소멸 예정 포인트(P)', point: 123123),
                VerticalDivider(
                  thickness: 2,
                  width: 15,
                  color: Color(0xFF3B3B3A),
                ),
                buildPointColumn(flex: 99, labelText: '다운로드 받은 쿠폰(개)', point: 123),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildPointColumn({required int flex, required String labelText, required int point}) {
    NumberFormat f = NumberFormat('###,###,###,###');
    return Expanded(
      flex: flex,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FittedBox(
            fit: BoxFit.fill,
            child: Text(
              labelText,
              style: AppStyle.pointLabel,
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            f.format(point),
            style: AppStyle.pointText,
          ),
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
