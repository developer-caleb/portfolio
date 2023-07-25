import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'app_strings.dart';
import 'logger.dart';

Future<bool> checkLocationPermission() async {
  logger.d('위치 허가');
  Permission permission = Permission.locationWhenInUse;

  PermissionStatus previousPermissionStatus = await permission.status;
  PermissionStatus permissionStatus = await permission.request();
  logger.d('permissionStatus:$permissionStatus');
  if (permissionStatus.isPermanentlyDenied || permissionStatus.isDenied) {
    bool? isOpenSettings = await showDialog<bool?>(
      barrierDismissible: false,
      context: Get.context!,
      builder: (ctx) {
        return CupertinoAlertDialog(
          title: const Text("${AppStrings.appName}가 사용자의 위치 서비스를 사용할 수 없습니다."),
          content: const Text(AppStrings.preventLocationUseString),
          actions: [
            CupertinoDialogAction(
                child: const Text("취소"),
                onPressed: () {
                  Get.back(result: false);
                }),
            CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text("설정으로 이동"),
                onPressed: () {
                  Get.back(result: true);
                })
          ],
        );
      },
    );
    if (isOpenSettings == true) {
      bool settingResult =
      await openAppSettings(); //자동으로 async로 만들어짐, openAppSettings결과 값을 받는 것이 불가능하여 그대로 진행함
      logger.d('settingResult -> $settingResult'); //켜짐과 동시에 true만 반환함
      return false;
    }
  } else if (permissionStatus.isGranted || permissionStatus.isLimited) {
    if (previousPermissionStatus.isPermanentlyDenied ||
        previousPermissionStatus.isDenied) {
      await Future.delayed(const Duration(milliseconds: 300));
    }
    return true;
  }
  return false;
}


Future<bool> checkImagePermission() async {
  logger.d('이미지 사용 허가');
  Permission permission = Permission.photos;

  PermissionStatus previousPermissionStatus = await permission.status;
  PermissionStatus permissionStatus = await permission.request();
  logger.d('permissionStatus:$permissionStatus');
  if (permissionStatus.isPermanentlyDenied || permissionStatus.isDenied) {
    bool? isOpenSettings = await showDialog<bool?>(
      barrierDismissible: false,
      context: Get.context!,
      builder: (ctx) {
        return CupertinoAlertDialog(
          title: const Text("${AppStrings.appName}가 사용자의 사진에 접근할 수 없습니다."),
          content: const Text(AppStrings.preventImageUseString),
          actions: [
            CupertinoDialogAction(
                child: const Text("취소"),
                onPressed: () {
                  Get.back(result: false);
                }),
            CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text("설정으로 이동"),
                onPressed: () {
                  Get.back(result: true);
                })
          ],
        );
      },
    );
    if (isOpenSettings == true) {
      bool settingResult =
      await openAppSettings(); //자동으로 async로 만들어짐, openAppSettings결과 값을 받는 것이 불가능하여 그대로 진행함
      logger.d('settingResult -> $settingResult'); //켜짐과 동시에 true만 반환함
      return false;
    }
  } else if (permissionStatus.isGranted || permissionStatus.isLimited) {
    if (previousPermissionStatus.isPermanentlyDenied ||
        previousPermissionStatus.isDenied) {
      await Future.delayed(const Duration(milliseconds: 300));
    }
    return true;
  }
  return false;
}