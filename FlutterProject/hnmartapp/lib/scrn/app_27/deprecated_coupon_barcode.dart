import 'dart:async';
import 'dart:convert';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'component/plain_text.dart';
import 'component/title_nav.dart';

class CouponBarcode extends StatelessWidget {
  final Map<String, dynamic> item;
  const CouponBarcode({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TitleNav('쿠폰 (바코드)', context),
            const CouponProgressBar(),
            CouponBarcodes(item: item),
            CouponBarcodeGuide(),
            CouponClose(context),
          ],
        ),
      ),
    );
  }
}

Widget CouponClose(context) {
  return ElevatedButton(
    onPressed: () {
      // Action to be performed when the button is pressed
      Navigator.pop(context);
    },
    child: PlainText('쿠폰 사용 완료, 화면 닫기'),
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

class ButtonWithLabel extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ButtonWithLabel({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          child: PlainText(label),
        ),
        const SizedBox(height: 8),
        PlainText(
          'Under Label',
        ),
      ],
    );
  }
}

class CouponProgressBar extends StatefulWidget {
  const CouponProgressBar({super.key});

  @override
  _ProgressBarTimerExampleState createState() => _ProgressBarTimerExampleState();
}

class _ProgressBarTimerExampleState extends State<CouponProgressBar> {
  double _progressValue = 0.0; // Initial progress value
  final int _durationInSeconds = 300; // Total duration in seconds
  late Timer _timer;
  var seconds = 0;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_progressValue >= 1.0) {
          timer.cancel(); // Stop the timer when progress reaches 100%
        } else {
          _progressValue += 1 / _durationInSeconds;
          seconds++;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LinearProgressIndicator(
            value: _progressValue, // Current progress value
            minHeight: 10,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
          const SizedBox(height: 20),
          PlainText(
            '$seconds / 300 초',
          ),
        ],
      ),
    );
  }
}
