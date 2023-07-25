import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matjipmemo/constants/const_languages.dart';
import 'package:matjipmemo/controller/login_controller.dart';
import 'package:matjipmemo/controller/picked_image_controller.dart';
import 'package:matjipmemo/pages/list/list_controller.dart';
import 'package:matjipmemo/pages/manage_matjip/manage_controller.dart';
import 'package:matjipmemo/pages/my/my_controller.dart';
import 'package:matjipmemo/pages/post/post_mode_manager.dart';
import 'package:matjipmemo/pages/square/square_controller.dart';
import 'package:matjipmemo/route/app_router.dart';
import 'package:matjipmemo/service/ads_service.dart';
import 'package:matjipmemo/service/algolia_service.dart';
import 'package:matjipmemo/service/fcm_service.dart';
import 'package:matjipmemo/service/internal_data_service.dart';
import 'package:matjipmemo/service/remote_config_service.dart';
import 'package:matjipmemo/service/setting_service.dart';

import 'constants/app_colors.dart';

void main() async {
  ///firebase crashlytics start
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initServices();
    // The following lines are the same as previously explained in "Handling uncaught errors"
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    runApp(const MyApp());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    PostModeManager postModeManager = PostModeManager();

    ///기본 모드 -> eatrip

    AppColors.changeMainColor(postModeManager.postMode);
    return GetMaterialApp(
      getPages: AppRouter.routes,
      translations: ConstLanguages(),
      debugShowCheckedModeBanner: false,
      locale: Get.find<SettingsService>().locale ?? Get.deviceLocale ?? Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      //지원하지 않는 언어를 사용하는 곳에서 기본적으로 사용될 언어
      initialBinding: BindingsBuilder(() {
        Get.put(LoginController(), permanent: true);
        Get.put(SquareController());
        Get.put(ManagerController());
        Get.put(ListController());
        Get.put(MyController());
        Get.put(PickedImageController(), permanent: true);
      }),
      title: 'EATRIP',
      initialRoute: AppRouter.initial,
      theme: ThemeData(
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: Colors.white,
        progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColors.circularProgressbarColor),
        appBarTheme: AppBarTheme(
          titleTextStyle: const TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
          iconTheme: const IconThemeData(color: AppColors.accentColor),
          centerTitle: true,
          shadowColor: AppColors.mainColor,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        primaryTextTheme: Theme.of(context).primaryTextTheme.apply(
              bodyColor: AppColors.accentColor,
            ),
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.grey[700]),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: AppColors.mainColor).copyWith(secondary: Colors.grey),
      ),
    );
  }
}

Future<void> initServices() async {
  Get.put(InternalDataService());
  await Get.putAsync(() => SettingsService().init());
  Get.put(AdsService());
  Get.put(RemoteConfigService());
  Get.put(FcmService());
  Get.put(AlgoliaService());
}
