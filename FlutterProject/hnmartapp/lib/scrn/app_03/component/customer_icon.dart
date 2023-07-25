import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomerIcon extends StatelessWidget {
  final String name;
  final double width;
  final double height;

  const CustomerIcon(this.name,
      {super.key, this.width = 50.0, this.height = 50.0});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/app_03/icons/$name.svg',
      width: width,
      height: height,
    );
  }
}
