import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:get/get.dart' hide FormData;
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:mobis_pss_app/app/data/providers/api_provider.dart';
import 'package:mobis_pss_app/app/data/services/third_party_service.dart';
import 'package:mobis_pss_app/core/enums/login_status.dart';
import 'package:mobis_pss_app/core/enums/login_type.dart';
import 'package:mobis_pss_app/core/utils/helpers.dart';
import 'package:mobis_pss_app/core/utils/jwt.dart';
import 'package:mobis_pss_app/utils/logger.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../core/environment/base_config/dev_config.dart';
import '../../../global_widgets/progress_dialog.dart';
import '../models/sign_in_response.dart';
import '../models/user_dormant.dart';

class AuthService extends GetxService {
  final apiProvider = Get.put(ApiProvider());
  final box = GetStorage();

  final legalName = ''.obs;

  //회원 필수 입력 정보 : 부품몰앱ID, 성명, 전화번호, 이메일주소
  final name = ''.obs;
  final telNumber = ''.obs;
  final birth = ''.obs;
  final email = ''.obs;

  final accessToken = ''.obs;
  final refreshToken = ''.obs;
  final userSeq = 0.obs;
  final role = ''.obs;

  bool get isLoggedIn => accessToken.isNotEmpty;

  String get currentLegalName => legalName.value;

  String get currentTelNumber => telNumber.value;

  String get currentBirth => birth.value;

  // 애플 개인정보 관련 리젝
  // String get currentGender => gender.value;

  String get currentEmail => email.value;

  int get currentUserSeq => userSeq.value;

  String get currentToken => accessToken.value;

  bool get isStoreUser => role.value == 'STORE';

  bool get isNormalUser => role.value == 'USER';

  bool get isCompanyUser => role.value == 'COMPANY';

  Future<void> getUserFromDisk() async {
    final user = box.read('user');
    if (user != null) {
      await updateUserInfo(
        legalName: user['legalName'],
        accessToken: user['accessToken'],
        refreshToken: user['refreshToken'],
        userSeq: user['userSeq'],
        role: user['role'],
      );
    }
  }

  ///TODO
  Future<void> updateUserInfo({
    String? legalName,
    String? accessToken,
    String? refreshToken,
    int? userSeq,
    String? role,
  }) async {
    if (accessToken?.isNotEmpty ?? false) {
      this.accessToken.value = accessToken!;
      await box.write('accessToken', accessToken);
    }

    if (legalName?.isNotEmpty ?? false) this.legalName.value = legalName!;
    if (refreshToken?.isNotEmpty ?? false)
      this.refreshToken.value = refreshToken!;
    if ((userSeq ?? 0) > 0) this.userSeq.value = userSeq!;
    if (role?.isNotEmpty ?? false) this.role.value = role!;

    await box.write('user', {
      'legalName': legalName,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'userSeq': userSeq,
      'role': role,
    });
  }

  Future<void> clearUserData() async {
    name.value = '';
    telNumber.value = '';
    birth.value = '';
    email.value = '';
  }

  Future<void> clearUser() async {
    await box.remove('accessToken');
    await box.remove('user');

    legalName.value = '';

    name.value = '';
    telNumber.value = '';
    birth.value = '';
    email.value = '';

    accessToken.value = '';
    refreshToken.value = '';
    userSeq.value = 0;
    role.value = '';
  }

  Future<void> signOut() async {
    await clearUser();
  }

  Future<bool> signInWithPaycoq(String telNumber, String legalName) async {
    final thirdPartyService = Get.find<ThirdPartyService>();

    List<String>? mmIds = box.read('mmIds');
    String paycoqUsername = box.read('paycoqUsername') ?? '';

    if (kDebugMode) {
      mmIds = [DevConfig.mmid];
      paycoqUsername = DevConfig.paycoqUsername;
    }

    try {
      if (paycoqUsername != telNumber || mmIds == null) {
        mmIds = await thirdPartyService.paycoqSignIn(telNumber, legalName);
      } else {
        mmIds = mmIds.map((e) => e.toString()).toList();
      }

      final deviceId = box.read('deviceId') ?? '';
      final pushToken = box.read('pushToken') ?? '';

      final signInResponse = await apiProvider.signInWithPaycoq(
        mmIds,
        deviceId,
        pushToken,
      );

      await updateUserInfo(
        userSeq: signInResponse.id!,
        accessToken: signInResponse.accessToken!,
        refreshToken: signInResponse.refreshToken!,
        legalName: signInResponse.legalName!,
        role: 'STORE',
      );

      await box.write('mmIds', mmIds);
      await box.write('paycoqUsername', signInResponse.username);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<LoginStatus> signInWithMobis(
      String username, String password, String role) async {
    final deviceId = box.read('deviceId') ?? '';
    final pushToken = box.read('pushToken') ?? '';
    try {
      password = hashPassword(password);

      //휴면계정 확인
      final checkSleepResponse = await apiProvider.checkMobis(
        username,
        password,
        deviceId,
        pushToken,
        role,
      );

      if (checkSleepResponse.isSuccess) {
        //해당 계정이 휴면계정일 때
        //휴면계정 복구 팝업
        var result = await openConfirmDialog(
            "휴면계정 복구 안내", "해당 계정은 휴면계정입니다. 휴면계정 복구를 진행하시겠습니까? ");
        if (result) {
          String username = checkSleepResponse.username;
          String email = checkSleepResponse.email ?? "";
          String legalName = checkSleepResponse.legalName ?? "";
          String telNumber = checkSleepResponse.telNumber ?? "";

          await Get.toNamed('/dormant-users', parameters: {
            'loginType': describeEnum(LoginType.mobis),
            'username': username,
            'email': email,
            'password': password,
            'legalName': legalName,
            'telNumber': telNumber
          });
        } else {
          logger.d("그냥 취소");
        }
        return LoginStatus.sleep;
      } else {
        //해당 계정이 휴면계정이 아닐 때
        //기존 로그인 로직 진행
        try {
          final signInResponse = await apiProvider.signInWithMobis(
            username,
            password,
            deviceId,
            pushToken,
            role,
          );

          //필수 회원정보 확인 결과 별 로직 적용
          if (signInResponse.statusMessage == 'LOGIN') {
            ///기존 동일 ID 有, 필수 회원정보 有
          } else if (signInResponse.statusMessage == 'REQUIRED_NOT_SAVED') {
            ///기존 동일 ID 有, 필수 회원정보 無
            var result = await Get.toNamed('/required-user-info',
                parameters: {"accessToken": signInResponse.accessToken!});
            //회원정보 수정 페이지에서 필수 회원정보 입력 취소 시
            if (result == null || !result) return LoginStatus.cancel;
          } else if (signInResponse.statusMessage == 'REGISTER') {
            ///기존 동일 ID 無, 필수 회원정보 無
            await Get.toNamed('/register');
            //회원가입 후에는 필수로 재 로그인 진행해야함
            return LoginStatus.cancel;
          } else {
            // 탈퇴한 계정일 때
            if (signInResponse.id == -1) {
              return LoginStatus.delete;
            }
            if (signInResponse.id == 14313) {
              logger.d("demo account");
            } else {
              return LoginStatus.fail;
            }
          }

          await updateUserInfo(
            userSeq: signInResponse.id!,
            accessToken: signInResponse.accessToken!,
            refreshToken: signInResponse.refreshToken!,
            legalName: signInResponse.legalName!,
            role: role,
          );

          return LoginStatus.success;
        } catch (e) {
          return LoginStatus.fail;
        }
      }
    } catch (e) {
      return LoginStatus.fail;
    }
  }

  void sendErrorToFireStore(String e) {
    FirebaseFirestore.instance.collection('error').doc().set({
      'created': Timestamp.now(),
      'type': 'login',
      'reason': 'phone',
      'description': e.toString()
    });
  }

  Future<LoginStatus> signInWithToken(
      String token, String type, Map<String, String> userData) async {
    try {
      final String deviceId = box.read('deviceId') ?? '';
      final String pushToken = box.read('pushToken') ?? '';
      logger.d(
          'signin with token $token deviceId $deviceId pushToken $pushToken');
      //휴면계정 확인
      final UserDormant? checkSleepResponse =
          await apiProvider.checkToken(token, type, deviceId, pushToken);
      logger.d('checkSleepResponse ${checkSleepResponse.toString()}');
      if (checkSleepResponse?.isSuccess ?? false) {
        //해당 계정이 휴면계정일 때
        //휴면계정 복구 팝업
        Get.until((route) => route is! PopupRoute); //팝업창 모두 끄기
        bool? result = await openConfirmDialog(
            "휴면계정 복구 안내", "해당 계정은 휴면계정입니다. 휴면계정 복구를 진행하시겠습니까? ");
        if (result ?? false) {
          var username = checkSleepResponse!.username;
          var email = checkSleepResponse.email ?? "";
          var legalName = checkSleepResponse.legalName ?? "";
          var telNumber = checkSleepResponse.telNumber ?? "";

          await Get.toNamed('/dormant-users', parameters: {
            'loginType': describeEnum(LoginType.token),
            'username': username,
            'email': email,
            'legalName': legalName,
            'telNumber': telNumber,
            'token': token,
            'type': type
          });
        } else {
          logger.d("그냥 취소");
        }
        return LoginStatus.sleep;
      } else {
        //해당 계정이 휴면계정이 아닐 때
        //SNS 필수 회원정보 확인 로직 진행
        SignInResponse? judgeResult =
            await apiProvider.judgeSNSUserInfo(token, type);
        if (judgeResult == null) {
          throw 'judge -> null[서버]';
        }
        logger.d('judgeResult.statusMessage   ${judgeResult.statusMessage}');
        //필수 회원정보 확인 결과 별 로직 적용
        if (judgeResult.statusMessage == 'LOGIN') {
          ///기존 동일 토큰 有, 필수 회원정보 有
          logger.d('Login success');
        } else if (judgeResult.statusMessage == 'REQUIRED_NOT_SAVED') {
          Get.until((route) => route is! PopupRoute); //팝업창 모두 끄기
          ///기존 동일 토근 有, 필수 회원정보 無
          userData['accessToken'] = judgeResult.accessToken!;
          var result =
              await Get.toNamed('/required-user-info', parameters: userData);
          //회원정보 수정 페이지에서 필수 회원정보 입력 취소 시
          if (result == null || !result) return LoginStatus.cancel;
        } else if (judgeResult.statusMessage == 'REGISTER') {
          Get.until((route) => route is! PopupRoute); //팝업창 모두 끄기
          ///기존 동일 토근 無, 필수 회원정보 無
          userData['type'] = type;
          userData['token'] = token;

          await Get.toNamed('/register', parameters: userData);
          //회원가입 후에는 필수로 재 로그인 진행해야함
          return LoginStatus.cancel;
        } else {
          throw 'judge -> ${judgeResult.statusMessage}[서버]';
        }

        //기존 로그인 로직 진행
        try {
          logger.d('signInWithToken trigger $token');
          final SignInResponse? signInResponse = await apiProvider
              .signInWithToken(token, type, deviceId, pushToken);

          if (signInResponse == null) {
            throw '서버 signInResponse: null';
          }
          // signIn id ==
          if (signInResponse.id == null) {
            throw '서버 signIn id: null';
          }
          // 탈퇴한 계정일 시
          if (signInResponse.id == -1) {
            return LoginStatus.delete;
          }

          await updateUserInfo(
            userSeq: signInResponse.id ?? 0,
            accessToken: signInResponse.accessToken,
            refreshToken: signInResponse.refreshToken,
            legalName: signInResponse.legalName,
            role: 'USER',
          );
          Get.until((route) => route is! PopupRoute); //팝업창 모두 끄기
          return LoginStatus.success;
        } catch (e) {
          sendErrorToFireStore(e.toString());
          throw e;
        }
      }
    } catch (e) {
      showToastMessage('로그인 실패1: $e');
      sendErrorToFireStore(e.toString());
      logger.e(e);
      return LoginStatus.fail;
    } finally {
      Get.until((route) => route is! PopupRoute); //팝업창 모두 끄기
    }
  }

  Future<bool> getNaverTokenWithWeb() async {
    logger.d('getNaverTokenWithWeb');
    final naverClientId = 'l6LGfoBpcSkwQGra7S54';
    final callbackUrlScheme = 'webauthcallback';
    final redirectUrl = 'http://49.247.19.85:3030/naverWebLogin';
// Construct the url
    String url =
        'https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=$naverClientId&redirect_uri=$redirectUrl';

// Present the dialog to the user
    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: callbackUrlScheme);
    logger.d('여기까지 성공? $result');

// Extract code from resulting url
    final code = Uri.parse(result).queryParameters['code'];
    logger.d('code $code');
    // 백엔드에서 redirect한 callback 데이터 파싱
    var dio = Dio();
    final response = await dio
        .post('https://nid.naver.com/oauth2.0/token', queryParameters: {
      'grant_type': 'authorization_code',
      'client_id': naverClientId,
      'client_secret': '7PEUaMK1pk',
      'redirect_uri': redirectUrl,
      'code': code,
    });
    logger.d('dd $response');

    final accessToken = response.data['access_token'];
    logger.i('accessToken $accessToken');
    // final refreshToken = Uri.parse(result).queryParameters['refresh_token'];
    final redirectUrl2 = 'http://49.247.19.85:3030/naverSNSLogin';
    final redirectUrl3 = 'https://openapi.naver.com/v1/nid/me';
    /*  final response2 = await dio.post(redirectUrl2, data: {
      'token': accessToken,
    });*/
    final response3 = await dio.get(redirectUrl3,
        options: Options(headers: {
          'Authorization': 'Bearer ' + accessToken,
          'X-Naver-Client-Id': 'l6LGfoBpcSkwQGra7S54',
          'X-Naver-Client-Secret': '7PEUaMK1pk'
        }));
    logger.d('response2 $response3');
    Map responseMap = response3.data['response'];
    //필수 회원 정보 저장
    name.value = responseMap['name'] ?? '';
    telNumber.value = responseMap['mobile'] ?? '';
    email.value = responseMap['email'] ?? '';
    //서버 연동
    final token = responseMap['id'];
    final type = 'naver';

    signInSnsProgress(token: token, type: type);
    return true;
  }

  Future<bool> signInWithNaver() async {
    try {
      //네이버 로그인 연동 및 데이터 가져오기
      NaverLoginResult result = await FlutterNaverLogin.logIn();

      /// final NaverLoginResult result = await FlutterNaverLogin.logIn();
      if (result.status != NaverLoginStatus.loggedIn) {
        showToastMessage('앱 로그인 실패 ${result.errorMessage}');
        throw result.errorMessage;
      }

      //필수 회원 정보 저장
      name.value = result.account.name ?? '';
      telNumber.value = result.account.mobile ?? '';
      email.value = result.account.email ?? '';

      //생일은 출생년도 4자, 생일 4자 총 8자 문자열로 구성
      if (result.account.birthyear.isNotEmpty &&
          result.account.birthday.isNotEmpty) {
        var birthyear = result.account.birthyear;
        var birthday = result.account.birthday.split('-').join("");
        birth.value = birthyear + birthday ?? '';
      }
      //서버 연동
      final token = result.account.id;
      final type = 'naver';

      signInSnsProgress(token: token, type: type);
      return true;
    } catch (e) {
      logger.d("Naver 로그인 실패0: $e");
      sendErrorToFireStore(e.toString());
    }
    await clearUser();
    return false;
  }

  void processAfterSignIn(LoginStatus signInResult) {
    if (signInResult == LoginStatus.success) {
      // 로그인 성공 시
      Get.back();
    } else if (signInResult == LoginStatus.delete) {
      // 탈퇴한 회원일 시
      throw "탈퇴한 회원 계정 입니다. ";
    } else if (signInResult == LoginStatus.sleep) {
      // 로그인 실패 시
      throw "휴먼 상태를 해제해주세요";
    } else if (signInResult == LoginStatus.fail) {
      // 로그인 실패 시
      // throw FormatException("SNS 로그인 실패");
    }
  }

  Future<bool> getKakaoTokenWithWeb() async {
    logger.d('getKakaoTokenWithWeb');
    final kakaoClientId = '8e5f3cbf20e1bb1afcae2bd9dcd28cfc';
    final callbackUrlScheme = 'webauthcallback';
    final redirectUrl = 'http://49.247.19.85:3030/naverWebLogin';
// Construct the url
    String url =
        'https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=$kakaoClientId&redirect_uri=$redirectUrl';
// Present the dialog to the user
    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: callbackUrlScheme);
    logger.d('여기까지 성공? $result');
// Extract code from resulting url
    final code = Uri.parse(result).queryParameters['code'];
    logger.d('code $code');
    // 백엔드에서 redirect한 callback 데이터 파싱
    var dio = Dio();
    final response =
        await dio.post('https://kauth.kakao.com/oauth/token', queryParameters: {
      'grant_type': 'authorization_code',
      'client_id': kakaoClientId,
      'redirect_uri': redirectUrl,
      'code': code,
      //'client_secret': '7PEUaMK1pk',
    });
    logger.d('dd $response');
    final accessToken = response.data['access_token'];
    logger.i('accessToken $accessToken');
    final redirectUrl3 = 'https://kapi.kakao.com/v2/user/me';
    final response3 = await dio.get(redirectUrl3,
        options: Options(headers: {
          'Authorization': 'Bearer ' + accessToken,
        }));
    logger.d('response2 $response3');
    Map responseMap = response3.data;
    //필수 회원 정보 저장
    email.value = responseMap['kakao_account']?['email'] ?? '';
    //서버 연동
    final String token = responseMap['id'].toString();
    final type = 'kakao';

    signInSnsProgress(token: token, type: type);
    return true;
  }

  Future<bool> signInWithKakao() async {
    logger.d('signInWithKakao');
    try {
      //카카오 로그인 연동 및  데이터 가져오기
      final installed = await isKakaoTalkInstalled();
      OAuthToken oAuthToken = installed
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();

      User kakaoUser = await UserApi.instance.me();

      //필수 회원 정보 저장
      email.value = kakaoUser.kakaoAccount?.email ?? '';
      // gender.value = kakaoUser.kakaoAccount.gender == kakao.Gender.FEMALE
      //     ? 'F'
      //     : 'M' ?? '';

      //서버 연동
      final token = kakaoUser.id.toString();
      final type = 'kakao';

      signInSnsProgress(token: token, type: type);
      return true;
    } on String catch (e) {
      showToastMessage(e);
    } catch (e) {
      logger.d("Kakao login error $e");
      sendErrorToFireStore(e.toString());
    }
    await clearUser();
    return false;
  }

  Future<bool> signInWithGoogle() async {
    try {
      GoogleSignInAccount? currentUser;

      //구글 로그인 연동 및  데이터 가져오기
      GoogleSignIn googleSignIn = GoogleSignIn();

      currentUser = await googleSignIn.signIn();
      if (currentUser == null) {
        await clearUser();
        return false;
      }
      logger.d("hello $currentUser");

      name.value = currentUser.displayName ?? '';
      email.value = currentUser.email ?? '';

      //서버 연동
      final String token = currentUser.id;
      final String type = 'google';
      signInSnsProgress(token: token, type: type);

      return true;
    } on String catch (e) {
      showToastMessage(e);
      sendErrorToFireStore(e.toString());
    } catch (e) {
      logger.d("Google login error $e");
      sendErrorToFireStore(e.toString());
    }
    await clearUser();
    return false;
  }

  Future signInSnsProgress(
      {required String token, required String type}) async {
    logger.d("signInSnsProgress token : $token \n type : $type");
    var userData = {
      "legalName": name.value,
      "email": email.value,
      "telNumber": (telNumber.value).replaceAll('-', ''),
      "birth": birth.value
    };

    logger.d("$type User Data");
    logger.d(userData);
    showProgressbar(barrierDismissible: true);
    final signInResult = await signInWithToken(token, type, userData);
    try {
      processAfterSignIn(signInResult);
    } catch (e) {
      showToastMessage('로그인 실패: $e');
      sendErrorToFireStore(e.toString());
    }
    clearUserData();
  }

  Future<bool> signInWithApple() async {
    try {
      //애플 로그인 연동 및 데이터 가져오기
      ///TODO apple login Check
      /*  final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);*/

      final AuthorizationCredentialAppleID appleCredential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],

        // nonce: nonce,
      );
      if (appleCredential.identityToken == null) {
        await clearUser();
        return false;
      }
      var data = parseJwt(appleCredential.identityToken!);

      email.value = data['email'];

      //성명 family name, given name 합치기
      final String familyName = appleCredential.familyName ?? '';
      final String givenName = appleCredential.givenName ?? '';
      name.value = familyName.isNotEmpty && givenName.isNotEmpty
          ? '${appleCredential.familyName}${appleCredential.givenName}'
          : '';

      //서버 연동
      final token = appleCredential.userIdentifier!;
      final type = 'apple';
      signInSnsProgress(token: token, type: type);

      return true;
    } on String catch (e) {
      showToastMessage(e);
      sendErrorToFireStore(e.toString());
    } catch (e) {
      logger.d("Apple login error $e");
      sendErrorToFireStore(e.toString());
    }
    await clearUser();
    return false;
  }

  Future<bool> recoverMobis(
      String username, String password, String name, String phoneNumber) async {
    try {
      final String deviceId = box.read('deviceId') ?? '';
      final String pushToken = box.read('pushToken') ?? '';

      //휴면계정 확인
      final recoverResponse = await apiProvider.recoverMobis(
          username, password, deviceId, pushToken, name, phoneNumber);

      logger.d(recoverResponse);

      return recoverResponse;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }

  Future<bool> recoverToken(
      String token, String type, String name, String phoneNumber) async {
    try {
      final String deviceId = box.read('deviceId') ?? '';
      final String pushToken = box.read('pushToken') ?? '';

      //휴면계정 확인
      final recoverResponse = await apiProvider.recoverToken(
          token, type, deviceId, pushToken, name, phoneNumber);

      logger.d(recoverResponse);

      return recoverResponse;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }
}
