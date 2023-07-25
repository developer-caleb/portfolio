import 'package:flutter/material.dart';

class LogoCI extends StatelessWidget {
  const LogoCI({this.width, this.height, super.key});
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/app_16/logo_ci.png',
      width: width ?? 146,
      height: height ?? 19,
    );
  }
}
