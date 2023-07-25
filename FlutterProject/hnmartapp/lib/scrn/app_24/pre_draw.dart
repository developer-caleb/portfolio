import 'package:flutter/material.dart';
import 'package:hanaromart/widgets/blue_rounded_container.dart';

class PreDraw extends StatelessWidget {
  const PreDraw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlueRoundedContainer(
      subText: '',
      child: Padding(
        padding: const EdgeInsets.only(top: 35, bottom: 24),
        child: const Text(
          '이벤트 추첨 전 입니다.\n결과는 추후 발표하겠습니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
