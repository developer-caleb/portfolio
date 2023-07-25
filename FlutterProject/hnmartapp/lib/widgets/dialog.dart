import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/config/app_colors.dart';
import 'package:hanaromart/config/app_style.dart';
import 'package:hanaromart/data/models/shop.dart';

Future blackDialog({
  Widget? widget,
  required String text,
  String? greenText,
  String? redText,
  VoidCallback? onClickGreenText,
  VoidCallback? onClickRedText,
}) {
  return Get.dialog(
    Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
      elevation: 0,
      backgroundColor: Color(0xFF0B0909).withOpacity(0.84),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 32,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
            widget ?? SizedBox.shrink(),
            SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (redText != null)
                  SizedBox(
                    //TextButton에 padding이 있어서 길이 더 많이 줌
                    width: 85,
                    child: TextButton(
                        style: AppStyle.dialogTextRedButtonStyle, onPressed: onClickRedText, child: Text(redText)),
                  ),
                if (greenText != null)
                  SizedBox(
                    //TextButton에 padding이 있어서 길이 더 많이 줌
                    width: 85,
                    child: TextButton(
                        style: AppStyle.dialogTextGreenButtonStyle,
                        onPressed: onClickGreenText,
                        child: Text(greenText)),
                  )
              ],
            ),
            SizedBox(
              height: 13,
            ),
          ],
        ),
      ),
    ),
    barrierColor: Colors.transparent,
  );
}

Future shopConfirmDialog({required Shop item}) => blackDialog(
      text: '[${item.name}점] 으로 지정하시겠습니까? 매장 변경 시 이전 매장에서 다운받은 쿠폰 등 서비스 정보는 [${item.name}점]에서 확인 불가합니다. ',
      widget: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text(
          '*이전 매장으로 복귀 시 언제든지 확인가능',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ),
      greenText: '변경',
      onClickGreenText: () => Get.back(result: true),
      redText: '취소',
      onClickRedText: () => Get.back(result: false),
    );
