import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/routes/router_name.dart';
import 'package:hanaromart/scrn/app_01/network_error_screen.dart';
import 'package:hanaromart/tools/logger.dart';
import 'package:hanaromart/tools/preferences.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// 접근권한설정(App-02) 완료여부 점검 →  로그인 여부 점검
Future<void> checkLoginAndNavigateToScreen() async {
  debugPrint('checkLoginAndNavigateToScreen');
  // await Future.delayed(SPLASH_DISPLAY_SECONDS);
  bool internetCheck = await InternetConnectionChecker().hasConnection;
  if (internetCheck == true) {
    logger.d('Internet Check Success');
  } else {
    logger.e('No internet :( Reason:');
    Get.offAll(() => NetworkErrorScreen());
    return;
  }
  final bool completed_setup = await getHasCompletePermissionSetup();
  final bool isLoggedIn = await getUserLoggedInState();

  // 중첩된 `if..then..else`. 권한설정완료 여부와 로그인상태에 따라 라우팅한다

  Get.offAllNamed(completed_setup
      ? isLoggedIn
          ? Routes.HOME
          : Routes.GUEST_HOME
      : Routes.PERMISSION_GUIDE);
/*  if_then_else(
      () => completed_setup,
      () => if_then_else(() => isLoggedIn, () => Get.offNamed(Routes.HOME), () => Get.offNamed(Routes.GUESTHOME)),
      () => Get.offNamed(Routes.PERMISSIONGUIDE));*/
}

/// Actual Splash Widget
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    checkLoginAndNavigateToScreen();

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
