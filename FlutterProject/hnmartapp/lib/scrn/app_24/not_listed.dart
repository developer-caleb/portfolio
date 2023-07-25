import 'package:flutter/material.dart';
import 'package:hanaromart/widgets/blue_rounded_container.dart';

class NotListed extends StatelessWidget {
  const NotListed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlueRoundedContainer(
      child: Padding(
        padding: const EdgeInsets.only(top: 35, bottom: 30),
        child: Column(
          children: const [
            Text(
              '당첨자 명단에 없습니다.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                letterSpacing: -0.38,
              ),
            ),
            Text(
              '다음 기회를 노리시기 바랍니다.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                letterSpacing: -0.27,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
