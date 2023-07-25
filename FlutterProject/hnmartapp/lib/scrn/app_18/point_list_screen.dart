import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/config/app_colors.dart';
import 'package:hanaromart/routes/router_name.dart';
import 'package:hanaromart/tools/logger.dart';
import 'package:hanaromart/widgets/bar/point_to_expire.dart';
import 'package:hanaromart/widgets/blue_rounded_container.dart';
import 'package:hanaromart/widgets/buttons/barcode_button.dart';
import 'package:hanaromart/widgets/buttons/duration_button_tab.dart';
import 'package:hanaromart/widgets/default_screen.dart';
import 'package:hanaromart/widgets/image/logo_ci.dart';
import 'package:hanaromart/widgets/texts/check_label.dart';
import 'package:hanaromart/widgets/texts/nh_gradient_text.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class PointListScreen extends StatefulWidget {
  const PointListScreen({super.key});

  @override
  State<PointListScreen> createState() => _PointListScreenState();
}

class _PointListScreenState extends State<PointListScreen> {
  List<String> dropdownText = [
    '전체내역',
    '적립',
    '사용',
  ];
  String selectedDropdown = '전체내역';
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
        titleString: '포인트 내역',
        backButton: false,
        body: ListView(
          children: [
            SizedBox(
              height: 21,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  LogoCI(),
                  SizedBox(
                    width: 3,
                  ),
                  NHGradientText(
                    'NH포인트',
                    textStyle: TextStyle(
                      fontSize: 19,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      logger.d('onClick PointCard');
                      Get.toNamed(Routes.POINT_CARD);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                      child: BarcodeButton(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            CheckLabel(
              '하나로마트 적립/사용 포인트 내역만 확인 가능합니다.',
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
              ),
            ),
            _pointIndicatorCard(),
            SizedBox(
              height: 26,
            ),
            DurationButtonTab(
              valueChanged: (int value) {},
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 36),
              child: Row(
                children: [
                  Text('총 000건'),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: _dropdownButton(),
                  ),
                ],
              ),
            ),
            Divider(
              color: Color(0xff3B3B3A),
            ),
            ...[
              pointCard(),
              pointCard(),
              pointCard(),
            ]
          ],
        ));
  }

  DecoratedBox _dropdownButton() {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3), border: Border.all(width: 1, color: AppColors.grey(0x7C))),
      child: DropdownButton<String>(
        isDense: true,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        borderRadius: BorderRadius.circular(12),
        isExpanded: false,
        icon: Padding(
          padding: const EdgeInsets.only(top: 7.0, bottom: 7.0, right: 7.0, left: 3),
          child: Image.asset(
            'assets/app_11/ic_arrow_down.png',
            width: 12,
            height: 6,
          ),
        ),
        //style: AppStyles.refundDropdownTextStyle.copyWith(color: Colors.black87),
        underline: SizedBox.shrink(),
        value: selectedDropdown,
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.black),
        items: dropdownText.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(item),
            ),
          );
        }).toList(),
        onChanged: (dynamic value) {
          setState(() {
            selectedDropdown = value;
          });
        },
      ),
    );
  }

  Widget pointCard() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '농협하나로유통 고양유통센터',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.23,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    '2023-01-30',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.21,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('+000,000 P',
                    style: TextStyle(
                      color: Color(0xFF000001),
                      fontSize: 15,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.23,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '포인트 적립',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.21,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  BlueRoundedContainer _pointIndicatorCard() {
    return BlueRoundedContainer(
      subChild: PointToExpire(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 7),
            child: Row(
              children: [
                Image.asset(
                  'assets/app_03/ic_point.png',
                  fit: BoxFit.fitHeight,
                  width: 20,
                  height: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'NH포인트 잔액',
                  style: TextStyle(
                    color: Color(0xFF000807),
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Spacer(),
              NHGradientText(
                '000,000 P',
                gradientDirection: GradientDirection.rtl,
                textStyle: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.53,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/app_18/ic_refresh.png',
                      width: 25,
                      height: 20,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text('새로고침')
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
