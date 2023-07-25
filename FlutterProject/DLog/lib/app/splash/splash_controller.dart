import 'dart:async';
import 'package:get/get.dart';
import 'package:locationdiary/app/auth/auth_controller.dart';
import 'package:locationdiary/data/datasources/http_client.dart';
import 'package:locationdiary/utils/logger.dart';
import 'package:locationdiary/data/dto/model/user_model.dart';
import 'package:locationdiary/domain/repository/get_storages.dart';
import 'package:locationdiary/network/apis/auth_api.dart';
import 'package:locationdiary/network/apis/dio.dart';
import 'package:locationdiary/route/router_name.dart';
import 'package:locationdiary/network/network_tools.dart';

class SplashController extends GetxController {
  bool hasLoginInfo = false;

  @override
  void onInit() async {
    super.onInit();
    await Future.wait([
      Future.delayed(const Duration(milliseconds: 1000)),
      getMyProfileInfoFromServer()
    ]);
    if (hasLoginInfo) {
      Get.offAllNamed(Routes.mainPage);
    } else {
      Get.offAllNamed(Routes.setProfilePage);
    }
    //Deprecated at 22.07.11(Switch with another feature)
    /*    Timer(const Duration(milliseconds: 1000), () {
      // Get.offAllNamed(Routes.profilePage); //푸쉬할 때 프로필 페이지로 해놓기
      Get.offAllNamed(Routes.mainPage);
    });*/
  }

  Future getMyProfileInfoFromServer() async {
    String? myUid = getStorageBox.read(GetStorageKey.keyMyUid)?.toString();
    String? myAccessToken = getStorageBox.read(GetStorageKey.keyMyAccessToken)?.toString();
    String? myUserSeq = getStorageBox.read(GetStorageKey.keyMyUserSeq)?.toString();
    if (myUid == null || myAccessToken == null || myUserSeq == null) {
      return;
    }
    logger.d('uid is $myUid \n'
        'myAccessToken is $myAccessToken \n'
        'myUserSeq is $myUserSeq');
    try {
      var myUserModel = UserModel(
        uid: myUid,
      );
      final client = AuthApi(dio, baseUrl: baseUrl3);
      dio.interceptors.add(prettyDioLogger);
      var result = await client.guestLogin(myUserModel);
      logger.d('통신 결과->  ${result.data.toString()}');
      //통신결과 값 GetX LoginController에 저장
      if (result.data == null) {
        return;
      }
      var networkResultUserModel = myUserModel.copyWith(
          userNickname: result.data?.userNickname ?? '',
          userProfileImgUrl: result.data?.userProfileImgUrl,

      );
      Get.find<AuthController>()
          .saveUserModel(userModel: networkResultUserModel);
      //Uid 값과 AccessToken은 GetStorage에 저장
      getStorageBox.write(
          GetStorageKey.keyMyAccessToken, result.data!.accessToken);
      hasLoginInfo = true;
    } catch (e) {
      logger.e('통신 오류 $e');
    }
  }
}
