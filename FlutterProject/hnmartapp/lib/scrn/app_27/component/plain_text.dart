import 'package:flutter/material.dart';


class PlainText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final bool underline;

  PlainText(String this.text, {
    this.textColor = Colors.black,
    this.fontSize = 20,
    this.underline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        decoration: underline ? TextDecoration.underline : TextDecoration.none,
      ),
    );
  }
}