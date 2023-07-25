import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final TextOverflow overflow;
  final TextAlign textAlign;

  const CustomText({
    super.key,
    this.text = '',
    this.size = 18,
    this.color = Colors.black,
    this.weight = FontWeight.w500,
    this.overflow = TextOverflow.clip,
    this.textAlign = TextAlign.center
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,

      textAlign: textAlign,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}
