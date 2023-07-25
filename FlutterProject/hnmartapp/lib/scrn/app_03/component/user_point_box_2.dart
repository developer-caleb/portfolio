import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/config/app_style.dart';
import 'package:hanaromart/routes/router_name.dart';
import 'package:hanaromart/scrn/app_03/component/barcode_button.dart';
import 'package:hanaromart/scrn/app_03/component/tab_icon.dart';
import 'package:hanaromart/widgets/custom_text.dart';
import 'package:intl/intl.dart';

class UserPointBox2 extends StatelessWidget {
  const UserPointBox2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color(0xff0B6F3F),
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 13, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/app_03/ic_nh_ci.png',
                          width: 167,
                          height: 20,
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Image.asset(
                              'assets/app_03/ic_point.png',
                              width: 18,
                              height: 13,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'NH 포인트 잔액',
                              style: AppStyle.pointLabel2,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              '000,000 P',
                              style: AppStyle.pointText2.copyWith(color: Colors.black),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Image.asset(
                              'assets/app_03/ic_coupon.png',
                              width: 15,
                              height: 20,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              '다운받은 쿠폰수',
                              style: AppStyle.pointLabel2,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              '000 개',
                              style: AppStyle.pointText2.copyWith(color: Colors.black),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(width: 5),
                    Expanded(
                        child: Row(
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        BarCodeButton(),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    )),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(left: 15, right: 15, top: 13, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(13)),
              /* border: Border.symmetric(
                    vertical: BorderSide(
                  color: Color(0xff0B6F3F),
                  width: 1.5,
                )),*/
              gradient: LinearGradient(
                begin: Alignment(-0.3, -0.5),
                end: Alignment(0.3, 0.5),
                colors: [
                  Color(0xFF167CB3),
                  Color(0xFF45C386),
                ],
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/app_03/ic_info.png',
                  width: 15,
                  height: 20,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  '소멸 예정 포인트(N월)',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13),
                ),
                Spacer(),
                Text(
                  '000,000 P',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13),
                ),
              ],
            ),
          )
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
