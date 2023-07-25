import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart' show GetStorage;

import 'logger.dart';

const _USER_COMPLETED_PERMISSION_SETUP = 'has-complete-permission-setup';

/// 접근권한설정(App-02) 완료여부 리턴
Future<bool> getHasCompletePermissionSetup() async {
  final flag = GetStorage().read(_USER_COMPLETED_PERMISSION_SETUP) ?? false;
  logger.d('getCompletePermissionSetup() => $flag');
  return flag;
}

/// 접근권한설정(App-02) 완료여부 설정
Future<void> setCompletePermissionSetup(bool flag) async {
  debugPrint('setCompletePermissionSetup: $flag');
  GetStorage().write(_USER_COMPLETED_PERMISSION_SETUP, flag);
}

/// 디버깅용도
Future<void> resetCompletePermissionSetup() async {
  logger.d('clearCompletePermissionSetup ...');
  setCompletePermissionSetup(false);
}

/* ------------------------------------------------------ */

const _READ_ABOUT_PERMISSION_KEY = 'read_about_permission';
const _USER_LOGIN_STATE_KEY = 'login_state';
const _USER_LOGGED_IN_STATE = 'logged in';
const _USER_LOGOUT_STATE = 'not logged in';

/// 로그인상태 리턴
Future<bool> getUserLoggedInState() async {
  final flag = GetStorage().read(_USER_LOGIN_STATE_KEY) ?? false;
  debugPrint('getUserLoggedInState() => $flag');
  return flag;
}
