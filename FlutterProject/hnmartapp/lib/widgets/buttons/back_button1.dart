import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_text.dart';

class BackButton1 extends StatelessWidget {
  const BackButton1({this.onTap, Key? key}) : super(key: key);
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ??
          () {
            Get.back();
          },
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: Row(
          children: [
            Image.asset(
              'assets/app_04/ic_back.png',
              width: 10,
              height: 17,
            ),
            SizedBox(
              width: 7,
            ),
            CustomText(
              text: '이전',
              size: 20,
              weight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
