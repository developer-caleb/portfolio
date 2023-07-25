import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class NHGradientText extends StatelessWidget {
  const NHGradientText(this.text, {required this.textStyle, this.gradientDirection, super.key});
  final String text;
  final TextStyle textStyle;
  final GradientDirection? gradientDirection;
  @override
  Widget build(BuildContext context) {
    return GradientText(
      text,
      style: textStyle,
      gradientType: GradientType.linear,
      gradientDirection: gradientDirection ?? GradientDirection.btt,
      colors: [
        Color(0xff22988E),
        Color(0xff2A66AC),
      ],
    );
  }
}
