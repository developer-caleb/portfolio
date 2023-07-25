import 'package:flutter/material.dart';

class CheckLabel3 extends StatelessWidget {
  const CheckLabel3({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/app_28/ic_check3.png',
            width: 21,
            height: 21,
          ),
          SizedBox(
            width: 6,
          ),
          Expanded(
            child: FittedBox(
              alignment: Alignment.centerLeft,
              fit: BoxFit.scaleDown,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.27,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
