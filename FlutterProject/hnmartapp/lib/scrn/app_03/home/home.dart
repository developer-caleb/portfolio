import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/routes/router_name.dart';
import 'package:hanaromart/scrn/app_03/component/tagged_icon.dart';
import 'package:hanaromart/scrn/app_03/component/user_point_box_2.dart';
import 'package:hanaromart/scrn/app_03/home/home_banner.dart';
import 'package:hanaromart/services/auth_service.dart';
import 'package:hanaromart/widgets/buttons/hamburger_button.dart';

import '../../../widgets/custom_text.dart';
import '../component/customer_icon.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      //endDrawer: HomeDrawer(),
      body: Stack(
        children: [
          HomeBanner(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() => Get.find<AuthService>().user == null ? UserPointBox2() : UserPointBox2()),
                SizedBox(height: 12),
                ButtonBoxes(context),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: false,
      titleSpacing: 5,
      title: _buildTitle(),
      actions: [
        IconButton(
            onPressed: () {
              Get.toNamed(Routes.PUSH);
            },
            icon: TaggedIcon(
              widget: Padding(
                padding: const EdgeInsets.only(top: 5, right: 5),
                child: Image.asset(
                  'assets/app_03/ic_message.png',
                  width: 30,
                  height: 30,
                ),
              ),
              tag: null,
            )),
        HamburgerButton()
      ],
    );
  }

  InkWell _buildTitle() {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.SHOP_SEARCH,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/app_03/ic_store_chage.png',
              width: 24,
              height: 24,
            ),
            SizedBox(width: 7),
            Text(
              '단골매장설정',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget ConvexButton(
    {required BuildContext context,
    required String icon,
    required String text,
    double width = 40.0,
    double height = 40.0,
    String route = Routes.BLANK}) {
  return InkWell(
      onTap: () {
        Get.toNamed(route);
      },
      child: Column(
        children: [
          Container(
            width: 60,
            height: 55,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                // border: Border.all(
                //   color: Colors.black,
                //   width: 1,
                // ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 4),
                  ),
                ]),
            padding: EdgeInsets.all(12.0),
            child: CustomerIcon(icon, width: width, height: height),
          ),
          SizedBox(
            height: 15,
          ),
          CustomText(text: text, size: 16, weight: FontWeight.bold)
        ],
      ));
}

Widget ButtonBoxes(context) {
  return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ConvexButton(context: context, icon: 'receiptbutton', text: '영수증', route: Routes.RECEIPT_LIST),
          ConvexButton(context: context, icon: 'leafletbutton', text: '행사전단', route: Routes.FLYER),
          ConvexButton(context: context, icon: 'eventbutton', text: '이벤트', route: Routes.EVENT),
          ConvexButton(context: context, icon: 'couponbutton', text: '할인쿠폰', route: Routes.COUPON_LIST),
        ],
      ));
}
