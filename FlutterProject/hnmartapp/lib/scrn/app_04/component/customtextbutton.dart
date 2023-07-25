import 'package:flutter/material.dart';
import 'package:hanaromart/widgets/custom_text.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final VoidCallback onPressed;

  CustomTextButton({
    this.text = '',
    this.size = 22,
    this.weight = FontWeight.w500,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? () {},
      child: CustomText(text: text, size: size, weight: weight),
    );
  }
}
