import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hanaromart/config/app_style.dart';
import 'package:hanaromart/scrn/app_03/component/tagged_icon.dart';

class TabIcon extends StatelessWidget {
  final String name;
  final double width;
  final double height;
  final bool newicon;

  TabIcon(this.name, {super.key, this.width = 50, this.height = 50, this.newicon = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        SvgPicture.asset(
          'assets/app_03/icons/$name.svg',
          width: width,
          height: height,
        ),
        if (newicon)
          Image.asset(
            'assets/app_03/newicon.png',
            width: 15,
            height: 15,
          ),
      ],
    );
  }
}

class BottomNavIcon extends StatelessWidget {
  final String image;
  final String? label;
  final double width;
  final double height;
  final bool newIcon;

  const BottomNavIcon(
      {required this.image, super.key, this.width = 32, this.height = 32, this.newIcon = false, this.label});

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = Image.asset(
      'assets/app_03/$image.png',
      width: width,
      height: height,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        newIcon
            ? TaggedIcon(
                widget: imageWidget,
                tag: Image.asset(
                  'assets/app_03/newicon.png',
                  width: 15,
                  height: 15,
                ),
              )
            : imageWidget,
        if (label?.isNotEmpty ?? false)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              label!,
              style: AppStyle.tabLabel,
            ),
          )
      ],
    );
  }
}
