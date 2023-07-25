import 'package:flutter/material.dart';
import 'package:hanaromart/scrn/app_28/component/discount_info_widget.dart';
import 'package:hanaromart/scrn/app_28/component/info_text.dart';
import 'package:hanaromart/widgets/default_screen.dart';

import 'component/barcode_with_text.dart';
import 'component/coupon_bottom_container.dart';

class InfiniteCouponUseScreen extends StatelessWidget {
  const InfiniteCouponUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
        titleString: '쿠폰',
        body: ListView(
          padding: EdgeInsets.only(
            top: 30,
          ),
          children: [
            AspectRatio(
              aspectRatio: 360 / 317,
              child: Placeholder(),
            ),
            SizedBox(
              height: 24,
            ),
            BarcodeWithText(),
            SizedBox(
              height: 24,
            ),
            DiscountInfoWidget(),
            InfoText(),
            SizedBox(
              height: 76,
            ),
            CouponBottomContainer(),
          ],
        ));
  }
}
