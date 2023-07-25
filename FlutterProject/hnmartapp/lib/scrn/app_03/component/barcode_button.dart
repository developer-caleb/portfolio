import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/config/app_colors.dart';
import 'package:hanaromart/routes/router_name.dart';
import 'package:hanaromart/widgets/dialog.dart';

class BarCodeButton extends StatelessWidget {
  const BarCodeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.dialog(LoginModal());
        blackDialog(
            text: '서비스 이용을 위해 로그인이 필요합니다.',
            redText: '취소',
            greenText: '로그인',
            onClickGreenText: () => Get.offNamed(Routes.LOGIN),
            onClickRedText: () => Get.back());
      },
      child: Column(
        children: [
          SizedBox(height: 5),
          Image.asset(
            'assets/app_37/ic_barcode2.png',
            width: 50,
            height: 25,
          ),
          SizedBox(height: 3),
          Container(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color(0xFFE63650)),
            child: Center(
              child: Text(
                '포인트바코드',
                style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
