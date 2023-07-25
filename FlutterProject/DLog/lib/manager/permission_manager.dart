import 'package:permission_handler/permission_handler.dart';

class PermissionManager {
  Future<bool> checkAndRequestPermission(
      Permission permission, {
        bool? appSetting,
      }) async {
    PermissionStatus? result = await checkPermission(permission);
    if (result == PermissionStatus.granted) return true;
    result = await _requestPermission(permission);
    if (result == PermissionStatus.granted) return true;

    if (result != PermissionStatus.granted || appSetting == true) {
      PermissionStatus? appSettingResult =
      await openAppSettings().then((value) async {
        if (value == true) {
          return await checkPermission(permission);
        }
        return null;
      });
      if (appSettingResult != null) {
        result = appSettingResult;
      }
    }
    return result == PermissionStatus.granted ||
        result == PermissionStatus.limited;
  }

  Future<PermissionStatus> checkPermission(Permission permission) async {
    return await permission.status;
  }

  Future<PermissionStatus> _requestPermission(Permission permission) async {
    return permission.request();
  }
}
