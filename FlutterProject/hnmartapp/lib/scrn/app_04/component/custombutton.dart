import 'package:flutter/material.dart';

import '../../../widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double margin;
  final Color background_color;
  final double font_size;
  final Color font_color;
  final FontWeight font_weight;
  final Color border_color;
  final double border_width;
  final BorderRadius border_radius;
  final double height;
  final List<BoxShadow> boxshadow;
  final VoidCallback onPressed;
  final dynamic params;

  CustomButton({
    this.text = '',
    this.margin = 40.0,
    this.background_color = Colors.white,
    this.font_size = 22,
    this.font_color = Colors.black,
    this.font_weight = FontWeight.w500,
    this.border_color = Colors.black,
    this.border_width = 1.0,
    this.border_radius = const BorderRadius.all(Radius.circular(30)),
    this.height = 50.0,
    this.boxshadow = const [BoxShadow()],
    required this.onPressed,
    this.params,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: height,
        margin: const EdgeInsets.only(left: 40.0, right: 40.0),
        decoration: BoxDecoration(
          color: background_color,
          border: Border.all(color: border_color, width: border_width),
          borderRadius: border_radius,
          boxShadow: boxshadow,
        ),
        child: Center(
          child: CustomText(text: text, size: font_size, color: font_color, weight: font_weight),
        ),
      ),
    );
  }
}
