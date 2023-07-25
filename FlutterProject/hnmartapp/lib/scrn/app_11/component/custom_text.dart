import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;

  CustomText({
    super.key,
    this.text = '',
    this.size = 18,
    this.color = Colors.black,
    this.weight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FittedBox(
        fit: BoxFit.scaleDown, // 자식 위젯의 크기를 부모 위젯 내에 맞게 조절
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: size,
            color: color,
            fontWeight: weight,
          ),
        ),
      ),
    );
  }
}
