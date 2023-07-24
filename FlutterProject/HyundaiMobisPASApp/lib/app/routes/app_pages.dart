import 'package:get/get.dart';

import 'package:mobis_pss_app/app/modules/announcements/bindings/announcements_binding.dart';
import 'package:mobis_pss_app/app/modules/announcements/views/announcements_view.dart';
import 'package:mobis_pss_app/app/modules/authentication/bindings/authentication_binding.dart';
import 'package:mobis_pss_app/app/modules/authentication/views/authentication_view.dart';
import 'package:mobis_pss_app/app/modules/cart/bindings/cart_binding.dart';
import 'package:mobis_pss_app/app/modules/cart/views/cart_view.dart';
import 'package:mobis_pss_app/app/modules/chatting/bindings/chatting_binding.dart';
import 'package:mobis_pss_app/app/modules/chatting/views/chatting_view.dart';
import 'package:mobis_pss_app/app/modules/companyLogin/bindings/company_login_binding.dart';
import 'package:mobis_pss_app/app/modules/companyLogin/views/company_login_view.dart';
import 'package:mobis_pss_app/app/modules/delivery/bindings/delivery_binding.dart';
import 'package:mobis_pss_app/app/modules/delivery/views/delivery_view.dart';
import 'package:mobis_pss_app/app/modules/deliveryInfo/bindings/delivery_info_binding.dart';
import 'package:mobis_pss_app/app/modules/deliveryInfo/views/delivery_info_view.dart';
import 'package:mobis_pss_app/app/modules/dormantUsers/bindings/dormant_users_binding.dart';
import 'package:mobis_pss_app/app/modules/dormantUsers/views/dormant_users_view.dart';
import 'package:mobis_pss_app/app/modules/forgot/bindings/forgot_binding.dart';
import 'package:mobis_pss_app/app/modules/forgot/views/forgot_view.dart';
import 'package:mobis_pss_app/app/modules/login/bindings/login_binding.dart';
import 'package:mobis_pss_app/app/modules/login/views/login_view.dart';
import 'package:mobis_pss_app/app/modules/loginOptions/bindings/login_options_binding.dart';
import 'package:mobis_pss_app/app/modules/loginOptions/views/login_options_view.dart';
import 'package:mobis_pss_app/app/modules/myInfo/bindings/my_info_binding.dart';
import 'package:mobis_pss_app/app/modules/myInfo/views/my_info_view.dart';
import 'package:mobis_pss_app/app/modules/navigation/bindings/navigation_binding.dart';
import 'package:mobis_pss_app/app/modules/navigation/views/navigation_view.dart';
import 'package:mobis_pss_app/app/modules/orderDetail/bindings/order_detail_binding.dart';
import 'package:mobis_pss_app/app/modules/orderDetail/views/order_detail_view.dart';
import 'package:mobis_pss_app/app/modules/orderList/bindings/order_list_binding.dart';
import 'package:mobis_pss_app/app/modules/orderList/views/order_list_view.dart';
import 'package:mobis_pss_app/app/modules/paycoqLogin/bindings/paycoq_login_binding.dart';
import 'package:mobis_pss_app/app/modules/paycoqLogin/views/paycoq_login_view.dart';
import 'package:mobis_pss_app/app/modules/pickup/bindings/pickup_binding.dart';
import 'package:mobis_pss_app/app/modules/pickup/views/pickup_view.dart';
import 'package:mobis_pss_app/app/modules/purchase/bindings/purchase_binding.dart';
import 'package:mobis_pss_app/app/modules/purchase/views/purchase_view.dart';
import 'package:mobis_pss_app/app/modules/register/bindings/register_binding.dart';
import 'package:mobis_pss_app/app/modules/register/views/register_view.dart';
import 'package:mobis_pss_app/app/modules/requiredUserInfo/bindings/requiredUserInfo_binding.dart';
import 'package:mobis_pss_app/app/modules/requiredUserInfo/views/requiredUserInfo_view.dart';
import 'package:mobis_pss_app/app/modules/searchAddress/bindings/search_address_binding.dart';
import 'package:mobis_pss_app/app/modules/searchAddress/views/search_address_view.dart';
import 'package:mobis_pss_app/app/modules/searchMissings/bindings/search_missings_binding.dart';
import 'package:mobis_pss_app/app/modules/searchMissings/views/search_missings_view.dart';
import 'package:mobis_pss_app/app/modules/searchParts/bindings/search_parts_binding.dart';
import 'package:mobis_pss_app/app/modules/searchParts/views/search_parts_view.dart';
import 'package:mobis_pss_app/app/modules/searchStores/bindings/search_stores_binding.dart';
import 'package:mobis_pss_app/app/modules/searchStores/views/search_stores_view.dart';
import 'package:mobis_pss_app/app/modules/tracking/bindings/tracking_binding.dart';
import 'package:mobis_pss_app/app/modules/tracking/views/tracking_view.dart';
import 'package:mobis_pss_app/app/modules/userLogin/bindings/user_login_binding.dart';
import 'package:mobis_pss_app/app/modules/userLogin/views/user_login_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.NAVIGATION;

  static final routes = [
    GetPage(
      name: _Paths.NAVIGATION,
      page: () => NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),

  ];
}
