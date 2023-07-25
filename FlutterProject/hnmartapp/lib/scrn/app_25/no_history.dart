import 'package:flutter/material.dart';
import 'package:hanaromart/widgets/blue_rounded_container.dart';

class NoHistory extends StatelessWidget {
  const NoHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlueRoundedContainer(
      child: Padding(
        padding: const EdgeInsets.only(top: 35, bottom: 24),
        child: Text(
          '해당 스탬프 이벤트\n상품 교환 내역이 없습니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
            letterSpacing: -0.38,
          ),
        ),
      ),
    );
  }
}
