import 'dart:convert';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'component/plain_text.dart';
import 'component/title_nav.dart';
import 'deprecated_coupon_limit_use_confirm.dart';

class CouponUnlimited extends StatelessWidget {
  final Map<String, dynamic> item;
  const CouponUnlimited({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TitleNav('쿠폰 (무제한)', context),
            CouoponImage(item),
            CouponBarcodes(item: item),
            CouponDescription(item),
            // CouponBarcodeGuide(),
            // CouponUse(context, item),
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

var barcode;

class CouponBarcodes extends StatefulWidget {
  final Map<String, dynamic> item;
  const CouponBarcodes({Key? key, required this.item}) : super(key: key);

  @override
  _CouponBarcodes createState() => _CouponBarcodes();
}

class _CouponBarcodes extends State<CouponBarcodes> {
  @override
  void initState() {
    super.initState();
    fetchBarcodeDetail(widget.item); // Access the item from the widget
  }

  Future<void> fetchBarcodeDetail(item) async {
    try {
      final response = await http.get(Uri.parse(
          "http://www.hanaromartapp.com/api/coupon/${item["cou_cd"]}?user_cd=Qtw4Fw2UhUCt%2FGDC19VXxQ%3D%3D"));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        final couponData = responseData["data"]["couponInfo"] as Map<String, dynamic>;
        setState(() {
          print(couponData);
          barcode = couponData["barcode"].toString();
          // couponList = couponData.cast<Map<String, dynamic>>();
          // coupon_list = couponList;
        });
      } else {
        // Handle error
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (error) {
      // Handle error
      print('Failed to fetch data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BarcodeWidget(
      barcode: Barcode.code128(),
      data: barcode != null ? barcode : "1234567890",
      width: 400,
      height: 200,
    );
  }
}

Widget CouponBarcodeGuide() {
  return Container(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: PlainText('[3] 쿠폰 사용 유의사항'),
        ),
        Center(
          child: PlainText('- 해당 쿠폰 사용 제한시간은 300초입니다.'),
        ),
        Center(
          child: PlainText('- 제한시간 종료 후 현재 화면은 자동종료 됩니다.'),
        ),
        Center(
          child: PlainText('- 제한시간 내 쿠폰 사용 못하신경우 고객센터에 문의하시기 바랍니다.'),
        ),
      ],
    ),
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
        PlainText(
          '* 쿠폰 사용은 반드시 매장 직원을 통해 하시기 바랍니다.',
        ),
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
