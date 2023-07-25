import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:locationdiary/app/splash/splash_controller.dart';
import 'package:locationdiary/utils/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.systemWhite,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark),
        ),
      ),
      body: GetBuilder(
        init: Get.find<SplashController>(),
        builder: (controller) {
          return Center(
            child: Image.asset(
              'assets/images/dlog_logo.png',
              width: 165,
            ),
          );
        },
      ),
    );
  }
}
