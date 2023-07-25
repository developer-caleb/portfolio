import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/tools/logger.dart';

GetSnackBar cameraSettingSnackBar() {
  return GetSnackBar(
    duration: Duration(milliseconds: 2500),
    title: '접근 거부 됨',
    message: '설정에서 카메라\n권한 허용으로 사용 가능합니다.',
    mainButton: TextButton(
      onPressed: () {
        logger.d('클릭 스낵바');
        AppSettings.openAppSettings();
        Get.closeCurrentSnackbar();
      },
      child: Text(
        '설정',
        style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF03A64A)),
      ),
    ),
  );
}
