import 'package:flutter/material.dart';

class TaggedIcon extends StatelessWidget {
  const TaggedIcon({required this.widget, required this.tag, Key? key}) : super(key: key);
  final Widget widget;
  final Widget? tag;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget,
        Positioned(
          top: 0,
          right: 0,
          child: tag ??
              Image.asset(
                'assets/app_03/newicon.png',
                width: 15,
                height: 15,
              ),
        )
      ],
    );
  }
}
