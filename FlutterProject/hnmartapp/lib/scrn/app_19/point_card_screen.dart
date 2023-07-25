import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/routes/router_name.dart';
import 'package:hanaromart/widgets/blue_rounded_container.dart';
import 'package:hanaromart/widgets/default_screen.dart';
import 'package:hanaromart/widgets/image/logo_ci.dart';
import 'package:hanaromart/widgets/texts/check_label.dart';
import 'package:hanaromart/widgets/texts/nh_gradient_text.dart';

class PointCardScreen extends StatelessWidget {
  const PointCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      titleString: '포인트 카드',
      body: ListView(
        children: [
          SizedBox(
            height: 21,
          ),
          _subTitle(),
          _buildCheckLabel(text: '바코드 제시 후 포인트 적립/사용 중 원하시는 것을 말해주세요.', number: '1'),
          _buildCheckLabel(text: '포인트 사용 시 생년월일 6자리 혹은 비밀번호를 입력해주세요.', number: '2'),
          SizedBox(
            height: 18,
          ),
          _barcodeCard(),
          SizedBox(
            height: 33,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, bottom: 33),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  side: BorderSide(color: Colors.black),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  foregroundColor: Colors.black,
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.30,
                  ),
                ),
                onPressed: () {
                  Get.toNamed(Routes.BARCODE_DETAIL);
                },
                child: Text('바코드 크게보기')),
          )
        ],
      ),
    );
  }

  Padding _barcodeCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14),
      child: BlueRoundedContainer(
        child: RotatedBox(
          quarterTurns: -1,
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 55, bottom: 28),
            child: Column(
              children: [
                LogoCI(
                  width: 260,
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35, bottom: 35),
                  child: BarcodeWidget(
                    width: 350,
                    height: 100,
                    data: '2836907654123',
                    barcode: Barcode.ean13(),
                    drawText: false,
                  ),
                ),
                Text(
                  '2836907654123',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 4.94,
                  ),
                )
              ],
            ),
          ),
        ),
        subChild: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Row(
            children: [
              Text(
                'NH 포인트 잔액',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w800,
                ),
              ),
              Spacer(),
              Text(
                '000,000 P',
                style: TextStyle(
                  color: Color(0xFFF9FFFA),
                  fontSize: 25,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.38,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  CheckLabel _buildCheckLabel2() {
    return CheckLabel(
      '포인트 사용 시 생년월일 6자리 혹은 비밀번호를 입력해주세요.',
      icon: Container(
        width: 16,
        height: 16,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Color(0xFF167BB4), borderRadius: BorderRadius.circular(2)),
        child: Center(
            child: Text(
          '2',
          style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
        )),
      ),
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 13,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildCheckLabel({required String text, required String number}) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: CheckLabel(
          text,
          icon: Container(
            width: 16,
            height: 16,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Color(0xFF167BB4), borderRadius: BorderRadius.circular(2)),
            child: Center(
                child: Text(
              number,
              style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
            )),
          ),
          textStyle: TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Padding _subTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: const [
          LogoCI(),
          SizedBox(
            width: 3,
          ),
          NHGradientText(
            '포인트카드',
            textStyle: TextStyle(
              fontSize: 19,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
