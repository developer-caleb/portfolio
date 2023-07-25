import 'package:get/get.dart';
import 'package:locationdiary/app/location/location_page.dart';
import 'package:locationdiary/app/main/main_binding.dart';
import 'package:locationdiary/app/main/main_page.dart';
import 'package:locationdiary/app/post/post_page.dart';
import 'package:locationdiary/app/profile/profile_page.dart';
import 'package:locationdiary/app/settings/setting_page.dart';
import 'package:locationdiary/app/splash/splash_controller.dart';
import 'package:locationdiary/app/splash/splash_page.dart';
import 'package:locationdiary/route/router_name.dart';

class AppRouter {
  static const initial = Routes.mainPage;

  // static const initial = Routes.settingPage; // for debug and test

  static final routes = [
    GetPage(
      name: Routes.splashPage,
      page: () => const SplashPage(),
      transition: Transition.fadeIn,
      binding: BindingsBuilder(
          () => Get.lazyPut<SplashController>(() => SplashController())),
    ),
    GetPage(
      name: Routes.setProfilePage,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: Routes.editProfilePage,
      page: () => ProfilePage(
        isEdit: true,
      ),
    ),
    GetPage(
      name: Routes.settingPage,
      page: () => const SettingPage(),
    ),
    GetPage(
      name: Routes.mainPage,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.postPage,
      page: () => PostPage(),
    ),
    GetPage(
      name: Routes.locationPage,
      page: () => const LocationPage(),
    ),
  ];
}
