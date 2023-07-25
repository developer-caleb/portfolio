import 'dart:io';

import 'package:get/get.dart';
import 'package:locationdiary/app/auth/auth_controller.dart';
import 'package:locationdiary/app/common/show_toast.dart';
import 'package:locationdiary/data/datasources/http_client.dart';
import 'package:locationdiary/data/dto/model/guest_login_dto.dart';
import 'package:locationdiary/data/dto/model/user_model.dart';
import 'package:locationdiary/data/repositories/diary_repository_impl.dart';
import 'package:locationdiary/domain/repository/get_storages.dart';
import 'package:locationdiary/domain/usecases/get_image_usecase.dart';
import 'package:locationdiary/domain/usecases/save_image_usecase.dart';
import 'package:locationdiary/network/apis/auth_api.dart';
import 'package:locationdiary/network/apis/dio.dart';
import 'package:locationdiary/route/router_name.dart';
import 'package:locationdiary/utils/logger.dart';


class ProfileController extends GetxController {
  bool _isProgressing = false;
  bool get isProgressing => _isProgressing;


  File? _profileImgFile;
  File? get profileImgFile => _profileImgFile;

  setProfileImgFile(File? profileImgFile) {
    _profileImgFile = profileImgFile;
    update();
  }

  setProgressing(bool progressing) {
    _isProgressing = progressing;
    update();
  }

  void onSubmitted({String? text, bool isEdit = false}) async {
    setProgressing(true);
    late GuestLoginDto resultData;
    late UserModel newUserModel;
    final client = AuthApi(dio, baseUrl: baseUrl3);
    dio.interceptors.add(prettyDioLogger);

    // 프로필 이미지 저장
    SaveImageUseCase saveImageUseCase = SaveImageUseCase(DiaryRepositoryImpl());

    String imgUrl = '';
    if (_profileImgFile != null) {
      imgUrl = await saveImageUseCase(
          imageFilePath: _profileImgFile!.path, directory: 'profile');
    }
    // _profileImgUrl = imgUrl;

    if (isEdit) {
      var inputUserModel = Get.find<AuthController>().userModel;
      var userSeq = getStorageBox.read(GetStorageKey.keyMyUserSeq);
      var accessToken = getStorageBox.read(GetStorageKey.keyMyAccessToken);
      if (inputUserModel == null || userSeq == null || accessToken == null) {
        return showToast('오류입니다');
      }
      dio.options.headers['Authorization'] = 'Bearer: $accessToken';
      newUserModel = inputUserModel.copyWith(
        userNickname: text,
        authTypeCode: 'OWNER',
        userSeq: userSeq is int ? userSeq : int.parse(userSeq),
        userProfileImgUrl: imgUrl,
      );

      try {
        var result =
            await client.modifyUserInfo(userSeq.toString(), newUserModel);
        if (result.result?.message == "SUCCESS") {
          Get.find<AuthController>().saveUserModel(userModel: newUserModel);
          setProgressing(false);
          Get.back();
        } else {
          return;
        }
      } catch (e) {
        logger.e('통신 오류 $e');
      }
    } else {
      String myUid = DateTime.now().millisecondsSinceEpoch.toString();

      newUserModel = UserModel(
          uid: myUid,
          userNickname: text,
          userProfileImgUrl: imgUrl,
          authTypeCode: 'OWNER');

      // 서버에서 id 만들기
      try {
        resultData = await client.guestLogin(newUserModel);
      } catch (e) {
        logger.e('통신 오류 $e');
      }

      logger.d('통신 결과 -> ${resultData.data.toString()}');
      // 통신결과 값 GetX LoginController에 저장
      if (resultData.data == null) {
        return showToast('데이터가 없습니다.');
      }
      var networkResultUserModel = newUserModel.copyWith(
          userNickname: resultData.data?.userNickname ?? '',
          userProfileImgUrl: resultData.data?.userProfileImgUrl);
      Get.find<AuthController>()
          .saveUserModel(userModel: networkResultUserModel);
      //Uid 값과 AccessToken은 GetStorage에 저장
      getStorageBox.write(GetStorageKey.keyMyUid, networkResultUserModel.uid);
      getStorageBox.write(
          GetStorageKey.keyMyAccessToken, resultData.data!.accessToken);
      getStorageBox.write(GetStorageKey.keyMyUserSeq, resultData.data!.userSeq);
      setProgressing(false);
      Get.offAllNamed(Routes.mainPage);
    }
    update();
  }

  Future<File> getImage(
      {required String fileName, String directory = 'profile',}) async {
    GetImageUseCase getImageUseCase = GetImageUseCase(DiaryRepositoryImpl());
    return await getImageUseCase(fileName: fileName, directory: directory);
  }
}
