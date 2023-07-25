import 'package:flutter/material.dart';

import 'component/plain_text.dart';
import 'component/title_nav.dart';
import 'deprecated_coupon_limit_use_confirm.dart';

class CouponLimit extends StatelessWidget {
  final Map<String, dynamic> item;
  const CouponLimit({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TitleNav('쿠폰 (일회용)', context),
            CouoponImage(item),
            CouponUse(context, item),
            CouponDescription(item),
            CouponGuide(),
          ],
        ),
      ),
    );
  }
}

var host = "http://www.hanaromartapp.com";

Widget CouoponImage(item) {
  return Image.network(
    host + item['title_img'].toString(),
  );
}

Widget CouponUse(context, item) {
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
        TextButton(
          child: PlainText('쿠폰 사용하기'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CouponLimitUseConfirm(item: item)));
          },
        ),
        PlainText('* 쿠폰 사용은 반드시 매장 직원을 통해 하시기 바랍니다.'),
      ],
    ),
  );
}

Widget CouponDescription(item) {
  String title = item["title"];
  String price = item["price"].toString();
  String start_date = item["start_date"];
  String end_date = item["end_date"];

  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlainText(
          '쿠폰명 : $title',
        ),
        SizedBox(height: 8.0),
        PlainText(
          '쿠폰할인금액 : $price',
        ),
        SizedBox(height: 8.0),
        PlainText(
          '최소구매금액 : $price 원',
        ),
        SizedBox(height: 8.0),
        PlainText(
          '쿠폰사용기간 : $start_date ~ $end_date 까지',
        ),
      ],
    ),
  );
}

Widget CouponGuide() {
  return Container(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: PlainText("[쿠폰 사용 유의사항]"),
        ),
        PlainText("1. 다른 쿠폰과 중복 사용이 불가합니다."),
        PlainText("2. 해당 쿠폰의 행사 기간 내에만 사용 가능합니다."),
        PlainText("3. 쿠폰은 다운받으신 해당 점포에서만 사용 가능합니다."),
        PlainText("4. 할인 조건은 최종 결제금액 기준으로 적용됩니다."),
        PlainText("5. 재결제 시에는 쿠폰 적용이 불가합니다."),
        PlainText("6. 주류, 담배, 종량제 봉투 등 일부 상품 적용 제외됩니다."),
      ],
    ),
  );
}
