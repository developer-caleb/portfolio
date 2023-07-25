import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/routes/router_name.dart';

class HamburgerButton extends StatelessWidget {
  const HamburgerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.toNamed(Routes.TOTAL_MENU);
          //  _scaffoldKey.currentState?.openEndDrawer();
        },
        icon: ImageIcon(
          AssetImage(
            'assets/app_03/ic_hamburger.png',
          ),
        ));
  }
}
