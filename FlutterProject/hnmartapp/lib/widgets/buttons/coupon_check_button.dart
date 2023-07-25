import 'package:flutter/material.dart';

class CouponCheckButton extends StatelessWidget {
  const CouponCheckButton({required this.onTap, Key? key}) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 50,
        right: 50,
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 11),
            side: BorderSide(width: 1, color: Colors.black),
            textStyle: TextStyle(
              fontSize: 20,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              letterSpacing: -0.30,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        onPressed: onTap,
        child: Text(
          '쿠폰 확인하기',
        ),
      ),
    );
  }
}
