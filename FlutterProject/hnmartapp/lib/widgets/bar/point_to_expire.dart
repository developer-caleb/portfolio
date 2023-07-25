import 'package:flutter/material.dart';

class PointToExpire extends StatelessWidget {
  const PointToExpire({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17, right: 14),
      child: Row(
        children: [
          Text(
            '소멸 예정 포인트(N월)',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Text(
            '000,000 P',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              letterSpacing: -0.23,
            ),
          )
        ],
      ),
    );
  }
}
