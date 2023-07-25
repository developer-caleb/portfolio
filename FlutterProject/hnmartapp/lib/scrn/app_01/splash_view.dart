import 'package:flutter/material.dart';
import 'package:hanaromart/config/constants/image_constant.dart';
import 'package:hanaromart/scrn/common/custom_image_view.dart';
import 'package:hanaromart/scrn/common/size_utils.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: getPadding(
          left: 55,
          top: 52,
          right: 55,
          bottom: 52,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(),
            CustomImageView(
              imagePath: ImageConstant.img,
              height: getSize(
                160,
              ),
              width: getSize(
                160,
              ),
            ),
            Image.asset(
              'assets/app_01/logo_ci.png',
              width: 270,
              height: 34,
            )
          ],
        ),
      ),
    );
  }
}
