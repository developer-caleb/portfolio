import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:locationdiary/app/auth/auth_controller.dart';
import 'package:locationdiary/app/profile/profile_controller.dart';
import 'package:locationdiary/route/app_router.dart';
import 'package:locationdiary/utils/app_colors.dart';

void main() async {
  await GetStorage.init(); //내부저장소 get_storage
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.systemWhite,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: AppColors.systemWhite,
        appBarTheme: AppBarTheme(
            titleTextStyle:
                TextStyle(fontSize: 16, color: AppColors.systemBlack),
            color: AppColors.systemWhite,
            elevation: 0,
            iconTheme: IconThemeData(color: AppColors.systemBlack),
            centerTitle: true),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.systemBlack,
          selectionColor: AppColors.systemBlack.withOpacity(0.2),
          selectionHandleColor: AppColors.systemBlack.withOpacity(0.5),
        ),
        splashColor: Colors.transparent, //Inkwell color 없애려고 추가 22.07.13
        highlightColor: Colors.transparent, //Inkwell color 없애려고 추가 22.07.13
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: AppColors.darkGray01),
        progressIndicatorTheme:
            ProgressIndicatorThemeData(color: AppColors.darkGray01),
      ),
      initialRoute: AppRouter.initial,
      getPages: AppRouter.routes,
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController(), permanent: true);
        Get.put(ProfileController());
      }),
    );
  }
}
