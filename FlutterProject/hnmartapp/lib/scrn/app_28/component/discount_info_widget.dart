import 'package:flutter/material.dart';
import 'package:hanaromart/widgets/texts/check_label.dart';

class DiscountInfoWidget extends StatelessWidget {
  const DiscountInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Image.asset('assets/app_28/ic_coupon.png', width: 30, height: 20),
              SizedBox(
                width: 7,
              ),
              Text(
                '쿠폰할인정보',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.black,
          indent: 10,
          endIndent: 10,
        ),
        SizedBox(
          height: 10,
        ),
        _checkLabel('쿠폰명 삼겹살 1kg 4천원 할인쿠폰'),
        _checkLabel('할인금액 4,000원'),
        _checkLabel('최소구매금액 000,000원'),
        _checkLabel('사용기한 23.01.10 까지'),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _checkLabel(String text) => CheckLabel(
        text,
        space: 5,
        padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
        icon: Image.asset(
          'assets/app_28/ic_check2.png',
          width: 20,
          height: 20,
        ),
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w500,
          letterSpacing: -0.24,
        ),
      );
}
