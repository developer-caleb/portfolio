import 'package:flutter/material.dart';

import 'component/plain_text.dart';
import 'component/title_nav.dart';
import 'deprecated_coupon_barcode.dart';

class CouponLimitUseConfirm extends StatelessWidget {
  final Map<String, dynamic> item;
  const CouponLimitUseConfirm({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TitleNav('쿠폰 (일회용, 사용)', context),
            CouponUseConfirms(context, item),
          ],
        ),
      ),
    );
  }
}

var host = "http://www.hanaromartapp.com";

Widget CouponUseConfirms(context, item) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 2.0,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PlainText('[쿠폰사용]을 누르시는 순간 쿠폰이 사용된 것으로 처리되니 반드시 매장 직원을 통해 사용하세요'),
        Row(
          children: [
            TextButton(
              child: PlainText('[쿠폰사용]'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CouponBarcode(item: item)));
              },
            ),
            TextButton(
              child: PlainText('[뒤로가기]'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        )
      ],
    ),
  );
}
