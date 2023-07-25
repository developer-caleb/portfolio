import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/routes/router_name.dart';
import 'package:hanaromart/scrn/app_28/component/check_label3.dart';
import 'package:hanaromart/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:hanaromart/widgets/texts/check_label.dart';

import '../../widgets/default_screen.dart';
import '../app_28/component/coupon_bottom_container.dart';
import '../app_28/component/discount_info_widget.dart';
import '../app_28/component/info_text.dart';

class OneTimeCouponScreen extends StatelessWidget {
  const OneTimeCouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
        titleString: '쿠폰',
        body: ListView(
          padding: EdgeInsets.only(
            top: 30,
          ),
          children: [
            AspectRatio(
              aspectRatio: 360 / 317,
              child: Placeholder(),
            ),
            SizedBox(
              height: 34,
            ),
            true ? _couponCheckButton() : _doneCouponButton(),
            SizedBox(
              height: 47,
            ),
            DiscountInfoWidget(),
            InfoText(),
            SizedBox(
              height: 76,
            ),
            CouponBottomContainer(),
          ],
        ));
  }

  Widget _couponCheckButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  backgroundColor: Color(0xFF03A64A),
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(
                    color: Color(0xFFF9FFFA),
                    fontSize: 25,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.38,
                  ),
                  elevation: 5),
              onPressed: () {
                _couponCheckBottomSheet();
              },
              child: Text('쿠폰 직원 확인')),
        ),
        SizedBox(
          height: 21,
        ),
        CheckLabel3(
          text: '매장 직원을 통해 쿠폰 사용하시기 바랍니다.',
        )
      ],
    );
  }

  Widget _doneCouponButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 4,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    backgroundColor: Color(0xFF3E4541),
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.38,
                    ),
                    disabledForegroundColor: Colors.white,
                    disabledBackgroundColor: Color(0xFF3E4541),
                    elevation: 5),
                onPressed: null,
                child: Text('쿠폰 사용 완료')),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Center(
            child: Text(
          '사용일자 : 2023.01.31',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
            letterSpacing: -0.27,
          ),
        ))
      ],
    );
  }

  Future<dynamic> _couponCheckBottomSheet() {
    return customBottomSheet(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ...[
            '[직원확인]은 매장 직원이 누르는 버튼입니다.',
            '쿠폰 사용 전 버튼을 누르지 마시기 바랍니다.',
            '사용 확인된 쿠폰은 재사용이 불가합니다.',
          ]
              .map(
                (e) => FittedBox(
                  fit: BoxFit.scaleDown,
                  child: CheckLabel(
                    e,
                    padding: EdgeInsets.only(top: 11, bottom: 11),
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.27,
                    ),
                  ),
                ),
              )
              .toList(),
          SizedBox(
            height: 40,
          )
        ]),
        footerWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: TextButton(
              style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.38,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: BorderSide(width: 1, color: Colors.white),
                  foregroundColor: Colors.white),
              onPressed: () {
                Get.offNamed(Routes.COUPON_BARCODE);
              },
              child: Text('직원 확인')),
        ));
  }
}
