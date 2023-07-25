import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hanaromart/config/app_theme.dart';
import 'package:hanaromart/routes/app_router.dart';
import 'package:hanaromart/services/setting_service.dart';

import 'config/constants/constants.dart';
import 'services/auth_service.dart';

void main() async {
  await initServices();
  // resetCompletePermissionSetup();
  runApp(MyApp());
}

Future<void> initServices() async {
  await Get.putAsync(() => SettingsService().init());
  Get.put(AuthService());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: ((context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: application_title_ko,
            theme: AppTheme.light,
            initialRoute: AppRouter.initial,
            getPages: AppRouter.routes,
          );
        }));
  }
}
