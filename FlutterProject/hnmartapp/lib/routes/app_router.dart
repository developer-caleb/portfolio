import 'package:get/get.dart';
import 'package:hanaromart/routes/router_name.dart';
import 'package:hanaromart/scrn/app_02/permission_guide_screen.dart';
import 'package:hanaromart/scrn/app_04/login_screen.dart';
import 'package:hanaromart/scrn/app_07/shop_info_screen.dart';
import 'package:hanaromart/scrn/app_10/push_screen.dart';
import 'package:hanaromart/scrn/app_11/flyer_screen.dart';
import 'package:hanaromart/scrn/app_16/receipt_list_controller.dart';
import 'package:hanaromart/scrn/app_16/receipt_list_screen.dart';
import 'package:hanaromart/scrn/app_19/barcode_detail_screen.dart';
import 'package:hanaromart/scrn/app_19/point_card_screen.dart';
import 'package:hanaromart/scrn/app_20/event_screen.dart';
import 'package:hanaromart/scrn/app_21/event_detail_controller.dart';
import 'package:hanaromart/scrn/app_21/event_detail_screen.dart';
import 'package:hanaromart/scrn/app_26/qr_scan_screen.dart';
import 'package:hanaromart/scrn/app_27/coupon_list_screen.dart';
import 'package:hanaromart/scrn/app_29/one_time_coupon_screen.dart';
import 'package:hanaromart/scrn/app_30/coupon_barcode_screen.dart';
import 'package:hanaromart/scrn/app_31/change_password_screen.dart';
import 'package:hanaromart/scrn/app_31/find_password_screen.dart';
import 'package:hanaromart/scrn/app_33/inquiry.dart';
import 'package:hanaromart/scrn/app_35/term_screen.dart';
import 'package:hanaromart/scrn/app_37/total_menu_screen.dart';
import 'package:hanaromart/scrn/webviews/privacypolicy.dart';
import 'package:hanaromart/widgets/blank_scaffold.dart';

import '../scrn/app_01/splash_screen.dart';
import '../scrn/app_03/guest_home_screen.dart';
import '../scrn/app_06/app06_controller.dart';
import '../scrn/app_06/shop_search_screen.dart';

class AppRouter {
  AppRouter._(); //it can help you prevent to make instance of this class
  static const initial = Routes.SPLASH;

  static final routes = [
    GetPage(name: Routes.SPLASH, page: () => SplashScreen()),
    GetPage(name: Routes.QRCODE_SCAN, page: () => QrScanScreen()),
    GetPage(name: Routes.HOME, page: () => GuestHomeScreen()),
    GetPage(name: Routes.GUEST_HOME, page: () => GuestHomeScreen()),
    GetPage(name: Routes.LOGIN, page: () => LoginScreen()),
    GetPage(name: Routes.PERMISSION_GUIDE, page: () => PermissionGuideScreen()),
    GetPage(name: Routes.BLANK, page: () => BlankScaffold()),
    GetPage(name: Routes.FLYER, page: () => FlyerScreen()),
    GetPage(name: Routes.TOTAL_MENU, page: () => TotalMenuScreen(), transition: Transition.rightToLeft),
    GetPage(name: Routes.EVENT, page: () => EventScreen()),
    GetPage(
      name: Routes.EVENT_DETAIL,
      page: () => EventDetailScreen(),
      binding: BindingsBuilder<EventDetailController>.put(() => Get.put(EventDetailController())),
    ),
    GetPage(
      name: Routes.SHOP_SEARCH,
      page: () => ShopSearchScreen(),
      binding: BindingsBuilder<App06Controller>.put(() => Get.put(App06Controller())),
    ),
    GetPage(
      name: Routes.SHOP_INFO,
      page: () => ShopInfoScreen(),
    ),
    GetPage(name: Routes.TERM, page: () => TermScreen()),
    GetPage(name: Routes.PRIVACY_POLICY, page: () => PrivacyPolicyScreen()),
    GetPage(name: Routes.PUSH, page: () => PushScreen()),
    GetPage(name: Routes.INQUIRY, page: () => InquiryScreen()),
    GetPage(name: Routes.CHANGE_PASSWORD, page: () => ChangePasswordScreen()),
    GetPage(name: Routes.FIND_PASSWORD, page: () => FindPasswordScreen()),
    GetPage(name: Routes.POINT_CARD, page: () => PointCardScreen()),
    GetPage(name: Routes.BARCODE_DETAIL, page: () => BarcodeDetailScreen()),
    GetPage(name: Routes.COUPON_LIST, page: () => CouponListScreen()),
    GetPage(name: Routes.ONETIME_COUPON, page: () => OneTimeCouponScreen()),
    GetPage(name: Routes.COUPON_BARCODE, page: () => CouponBarCodeScreen()),
    GetPage(
      name: Routes.RECEIPT_LIST,
      page: () => ReceiptList(),
      binding: BindingsBuilder<ReceiptListController>.put(() => Get.put(ReceiptListController())),
    ),
  ];
}
