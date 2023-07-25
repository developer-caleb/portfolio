import 'package:flutter/material.dart';

class CheckLabel extends StatelessWidget {
  const CheckLabel(this.text, {this.icon, super.key, this.space = 8, this.padding, this.textStyle});
  final String text;
  final Widget? icon;
  final double space;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 15),
      child: Row(
        children: [
          icon ??
              Image.asset(
                'assets/app_25/ic_check.png',
                width: 16,
                height: 16,
              ),
          SizedBox(
            width: space,
          ),
          Text(
            text,
            style: textStyle ??
                TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
