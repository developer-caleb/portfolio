import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hanaromart/scrn/app_28/component/check_label3.dart';
import 'package:hanaromart/scrn/app_28/component/discount_info_widget.dart';
import 'package:hanaromart/scrn/app_28/component/info_text.dart';
import 'package:hanaromart/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:hanaromart/widgets/default_screen.dart';

import '../app_28/component/barcode_with_text.dart';
import 'component/custom_progress_indicator.dart';

class CouponBarCodeScreen extends StatefulWidget {
  const CouponBarCodeScreen({super.key});

  @override
  State<CouponBarCodeScreen> createState() => _CouponBarCodeScreenState();
}

class _CouponBarCodeScreenState extends State<CouponBarCodeScreen> {
  bool couponAvailable = true;
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      titleString: '쿠폰',
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          CouponTimer(
            onFinished: () {
              setState(() {
                couponAvailable = false;
              });
            },
            setTimeSecond: 300,
          ),
          SizedBox(
            height: 68,
          ),
          BarcodeWithText(),
          SizedBox(
            height: 30,
          ),
          CheckLabel3(
            text: '쿠폰 사용 제한시간은 300초입니다.',
          ),
          SizedBox(
            height: 15,
          ),
          CheckLabel3(
            text: '제한시간 종료 후 쿠폰 재사용 불가합니다.',
          ),
          SizedBox(
            height: 15,
          ),
          CheckLabel3(
            text: '쿠폰 POS 스캔 후 [사용 완료]를 눌러주세요.',
          ),
          SizedBox(
            height: 63,
          ),
          DiscountInfoWidget(),
          InfoText(),
          SizedBox(
            height: 68,
          ),
          _completeButton(),
          SizedBox(
            height: 75,
          )
        ],
      ),
      hamburgerButton: false,
      backButton: false,
    );
  }

  Padding _completeButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF112EC3),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              textStyle: TextStyle(
                color: Color(0xFFF9FFFA),
                fontSize: 25,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                letterSpacing: -0.38,
              ),
              padding: EdgeInsets.symmetric(vertical: 10)),
          onPressed: () {
            _completeBottomSheet();
          },
          child: Text(
            '사용 완료',
          )),
    );
  }

  Future<dynamic> _completeBottomSheet() {
    return customBottomSheet(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            '[사용 완료]를 누르면 \n실제 쿠폰 사용 여부에 상관없이\n해당 쿠폰은 재사용 불가합니다.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              letterSpacing: -0.33,
            ),
          ),
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
              onPressed: () {},
              child: Text('사용 완료')),
        ));
  }
}

class CouponTimer extends StatefulWidget {
  const CouponTimer({
    super.key,
    required this.onFinished,
    required this.setTimeSecond,
  });
  final VoidCallback onFinished;
  final int setTimeSecond;
  @override
  State<CouponTimer> createState() => _CouponTimerState();
}

class _CouponTimerState extends State<CouponTimer> {
  late DateTime initialTime;
  late Stream<int> remainTimeStream;
  @override
  void initState() {
    initialTime = DateTime.now();
    remainTimeStream = Stream.periodic(Duration(milliseconds: 100), (value) {
      int remainTime = (widget.setTimeSecond - DateTime.now().difference(initialTime).inSeconds);
      return remainTime;
    }).takeWhile((element) => element >= 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: remainTimeStream,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        return Column(
          children: [
            CustomProgressIndicator(snapshot.data! / widget.setTimeSecond),
            SizedBox(
              height: 26,
            ),
            Center(
              child: RichText(
                  text: TextSpan(
                children: [
                  TextSpan(text: '사용 제한 시간 '),
                  TextSpan(
                      text: '${snapshot.data}초 ',
                      style: TextStyle(
                        color: Color(0xFF1F9549),
                      )),
                  TextSpan(text: '/ ${widget.setTimeSecond}초(종료)'),
                ],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.27,
                ),
              )),
            ),
          ],
        );
      },
    );
  }
}
