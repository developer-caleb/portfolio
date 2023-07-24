class ApiProvider extends GetConnect {
  @override
  void onInit() {
    // FIXME: remove later
    this.allowAutoSignedCert = true;

    httpClient.baseUrl = Environment().config.apiHost;

    httpClient.addRequestModifier((Request request) {
      request.headers['Content-type'] = 'application/json';
      request.headers['Accept'] = 'application/json';

      if (!request.url.path.contains('signIn')) {
        final authService = Get.find<AuthService>();
        if (authService.isLoggedIn) {
          request.headers['Authorization'] = 'Bearer ${authService.accessToken}';
          if (kDebugMode) print(request.headers['Authorization']);
        }
      }

      return request;
    });

    httpClient.addResponseModifier((request, response) async {
      final authService = Get.find<AuthService>();

      // TODO: check status
      if (response.unauthorized && authService.isLoggedIn) {
        await authService.clearUser();
        showToastMessage('세션이 만료되어 로그아웃 되었습니다.');
        await Get.offAllNamed('/navigation');
      } else if (response.hasError) {
        throw Exception('서버접속오류');
      }

      return response;
    });
  }

  Future<int> getCartCount(String deviceId) async {
    deviceId = encryptAes128(deviceId);
    var preCartCount = await get('/v2/user/getCartCount', query: {'deviceId': deviceId});
    return int.tryParse(preCartCount.bodyString ?? '0') ?? 0;
  }

  Future<void> updateOrderStatus(int id, int status) {
    return post('/v2/order/updateOrderStatus', {
      'orderId': id,
      'status': status,
    });
  }

  // 사용자 - 구매취소
  Future<bool> deleteOrder(int id) {
    return post('/v2/order/deleteOrder', {'orderId': id}).then((response) => response.isOk);
  }

  Future<PushToken> getPushToken(String orderNumber, bool toStore) {
    return get('/v2/order/getPushToken', query: {
      'orderNumber': orderNumber,
      'toStore': toStore ? 'true' : 'false',
    }).then((response) => PushToken.fromJson(response.body));
  }

  Future<void> updatePushToken(String deviceId, String pushToken) {
    return post('/v2/user/updatePushToken', {
      'deviceId': encryptAes128(deviceId),
      'pushToken': pushToken,
    });
  }

  Future<void> updateTrackingInfo(String orderNumber, String agentCode, String url) {
    return post('/v2/order/updateTrackingInfo', {
      'orderNumber': orderNumber,
      'agentCode': agentCode,
      'url': url,
    });
  }

  Future<List<UserCar>> getUserCars() {
    return get('/v2/user/getUserCars')
        .then((response) => (response.body as List ?? []).map((e) => UserCar.fromJson(e)).toList());
  }

  Future<PageResponse> getOrderHistory(String deviceId, int page, int size) {
    deviceId = encryptAes128(deviceId);
    return get('/v2/order/listOrders', query: {
      'deviceId': deviceId,
      'page': page.toString(),
      'size': size.toString(),
    }).then((response) => PageResponse.fromJson(response.body));
  }

  Future<List<Order>> createOrder(Map<String, dynamic> body) {
    if (body['deviceId'] != null && body['deviceId'] != '') {
      body['deviceId'] = encryptAes128(body['deviceId']);
    }
    return post('/v2/order/createOrderWithAlarm', body)
        .then((response) => (response.body as List ?? []).map((e) => Order.fromJson(e)).toList());
  }

  // TODO: check duplicated items
  Future<bool> addToCart({
    required String agentCode,
    required String sapCode,
    required String deliveryCode,
    required String partNumber,
    required String mmId,
    required int qty,
  }) async {
    final box = GetStorage();
    final deviceId = box.read('deviceId') ?? '';

    final body = {
      'agentCode': agentCode,
      'sapCode': sapCode,
      'deliveryCode': deliveryCode,
      'partNumber': partNumber,
      'mmId': mmId,
      'qty': qty,
      'deviceId': encryptAes128(deviceId),
    };

    return post('/v2/user/addCart', body).then((response) => response.isOk);
  }

  Future<List<CartItem>> getCartItems() {
    final box = GetStorage();
    String deviceId = box.read('deviceId') ?? '';
    deviceId = encryptAes128(deviceId);

    return get('/v2/user/getCarts', query: {'deviceId': deviceId})
        .then((response) => (response.body as List ?? []).map((e) => CartItem.fromJson(e)).toList());
  }

  Future<UserProfile?> getUserProfile() {
    return get('/v2/user/getProfile')
        .then((response) => (response.body == null) ? null : UserProfile.fromJson(response.body));
  }

  //로그인 진행 시 필수 회원 업데이틀르 위한 회원 정보 조회
  Future<UserProfile?> getUserProfileForLogin(String accessToken) {
    return get('/v2/user/getProfile', headers: {'Authorization': 'Bearer  $accessToken'})
        .then((response) => (response.body == null) ? null : UserProfile.fromJson(response.body));
  }

  //SNS유저 필수정보 업데이트
  Future<SignInResponse> updateRequiredProfile(Map<String, dynamic> body, String accessToken) {
    return post('/v2/user/profile/required', body, headers: {'Authorization': 'Bearer $accessToken'})
        .then((response) => response.body);
  }

  Future<bool> deleteProfile() {
    return get('/v2/user/deleteProfile').then((response) => response.isOk);
  }

  Future<bool> updateProfile(Map<String, dynamic> body, String accessToken) {
    return post('/v2/user/updateProfile', body, headers: {"Authorization": "Bearer $accessToken"})
        .then((response) => response.isOk);
  }

  Future<List<Notification>> getNotifications(String deviceId) {
    deviceId = encryptAes128(deviceId);
    return get('/v2/user/notifications', query: {'deviceId': deviceId})
        .then((response) => ((response.body as List?) ?? []).map((e) => Notification.fromJson(e)).toList());
  }

  Future<SignInResponse> registerUser(Map<String, String> body) {
    body['password'] = hashPassword(body['password'] ?? '');
    body['role'] = body['role'] == 'COMPANY' ? 'C' : 'U';

    return post('/v2/auth/signUp', body).then((response) => SignInResponse.fromJson(response.body));
  }

  /// type: google, apple, kakao, naver
  Future<SignInResponse?> signInWithToken(String token, String type, String deviceId, String pushToken) {
    return post('/v2/auth/signInWithToken', {
      'token': token,
      'type': type,
      'deviceId': encryptAes128(deviceId),
      'pushToken': pushToken,
    }).then((response) {
      logger.i('signInWithToken response ${response.request?.bodyBytes.toList()}');
      //logger.i('signInWithToken response ${response.request?.}');
      //logger.i('signInWithToken response ${response.request?.}');
      logger.d('signInWithToken response ${response.toString()}');
      logger.d('SignInResponse.fromJson(response.body) ${SignInResponse.fromJson(response.body)}');
      return SignInResponse.fromJson(response.body);
    });
  }

  //SNS 로그인 시 사용자 정보 판별
  Future<SignInResponse?> judgeSNSUserInfo(String token, String type) {
    return get('/v2/auth/sns/judge', query: {'token': token, 'type': type}).then((response) {
      Map? responseBody = response.body;
      if (responseBody == null) {
        return null;
      } else {
        return SignInResponse.fromJson(response.body);
      }
      try {} catch (e) {
        logger.e(e);
        return null;

        // }
      }
    });
  }

  Future<SignInResponse> signInWithMobis(
      String username, String password, String deviceId, String pushToken, String role) {
    String roleCode = role == 'COMPANY' ? 'C' : 'U';

    final body = {
      'username': username,
      'password': password,
      'deviceId': encryptAes128(deviceId),
      'pushToken': pushToken,
      'role': roleCode,
    };

    print(body);

    return post('/v2/auth/signInWithMobis', body).then((response) => SignInResponse.fromJson(response.body));
  }

  Future<SignInResponse> signInWithPaycoq(List<String> mmIds, String deviceId, String pushToken) {
    return post('/v2/auth/signInWithPaycoq', {
      'mmIds': mmIds,
      'deviceId': encryptAes128(deviceId),
      'pushToken': pushToken,
    }).then((response) => SignInResponse.fromJson(response.body));
  }

  // TODO: check this backend
  Future<bool> validateEmail(String email) {
    return get('/validateEmail/$email').then((response) => response.isOk);
  }

  // TODO: make sure mobile is exists
  Future<bool> validateMobile(String mobile) {
    return get('/validateSMS/$mobile').then((response) => response.isOk);
  }

  // TODO: check with mobile or email
  Future<int> validateCode(String code) {
    return get('/validateCode/$code').then((response) => response.body['seq']);
  }

  Future<String> findUsername(int seq) {
    return post('/getUsername', {'seq': seq}).then((response) => response.body['username']);
  }

  Future<bool> resetPass(int seq, bool isMobile) {
    final tempPassword = randomString(8);
    final hashedPassword = hashPassword(tempPassword);

    return post('/resetPassword', {
      'password': tempPassword,
      'hashedPassword': hashedPassword,
      'seq': seq,
      'type': isMobile ? 1 : 0,
    }).then((response) => response.isOk);
  }

  Future<List<Announcement>> getAnnouncements({required String keyword, required String kind, int page = 1}) {
    final limit = 10;
    return get('/notice?kind=$kind&limit=$limit&page=$page&search=$keyword')
        .then((response) => (response.body['content'] as List ?? []).map((e) => Announcement.fromJson(e)).toList());
  }

  Future<List<CarModel>> getModels(String maker, String kind) async {
    return get('/models?hkgb=$maker&vtyp=$kind')
        .then((response) => (response.body as List ?? []).map((e) => CarModel.fromJson(e)).toList());
  }

  Future<List<CarPart>> searchParts({
    required String maker,
    required String kind,
    required int modelSeq,
    required String partNo,
    required String keyword,
    required int skip,
    required int limit,
  }) {
    String url = '/partPrcList?hkgb=$maker&firstIndex=$skip&recordCountPerPage=$limit';
    if (kind.isNotEmpty) {
      url += '&vtpy=$kind';
    }
    if (modelSeq != 0) {
      url += '&catSeq=$modelSeq';
    }
    if (partNo.isNotEmpty) {
      url += '&ptno=$partNo';
    }
    if (keyword.isNotEmpty) {
      url += '&inText=$keyword';
    }
    return get(url).then((response) => (response.body as List ?? []).map((e) => CarPart.fromJson(e)).toList());
  }

  Future<List<Sido>> getSido() {
    return get('/sido').then((response) => (response.body as List ?? []).map((e) => Sido.fromJson(e)).toList());
  }

  Future<List<Sigungu>> getSigungu(int seq) {
    return get('/sigungu?seq=$seq')
        .then((response) => (response.body as List ?? []).map((e) => Sigungu.fromJson(e)).toList());
  }

  Future<PartInfo?> getPartInfo(String partNumber) {
    return get('/part?ptno=$partNumber')
        .then((response) => response.body == null ? null : PartInfo.fromJson(response.body));
  }

  Future<List<Store>> searchStores({
    required String maker,
    required String partNumber,
    required String sido,
    required String sigungu,
    required String lat,
    required String lng,
    required int skip,
    required int limit,
  }) {
    return get('/partInventoryList', query: {
      'hkgb': maker,
      'stype': 'ALL',
      'firstIndex': skip.toString(),
      'recordCountPerPage': limit.toString(),
      if (lat.isNotEmpty) 'lat': lat,
      if (lng.isNotEmpty) 'lng': lng,
      if (partNumber.isNotEmpty) 'ptno': partNumber,
      if (sido.isNotEmpty) 'sido': sido,
      if (sigungu.isNotEmpty) 'sigungu': sigungu,
    }).then((response) => (response.body as List ?? []).map((e) => Store.fromJson(e)).toList());
  }

  Future<MissingPart?> getMissingParts(String vhcNo, num cursor, String userId) {
    return get('/searchRepairParts?platNumber=$vhcNo&userId=$userId&cursor=$cursor')
        .then((response) => response.body == null ? null : MissingPart.fromJson(response.body));
  }

  Future<bool> deleteItemsFromCart(List<int> seqs) async {
    return post('/delCarts', seqs.map((e) => {'seq': e}).toList()).then((response) => response.isOk);
  }

  Future<bool> checkUsername(String username) {
    return get('/username/$username').then((response) => response.isOk);
  }

  Future<bool> checkEmail(String email) {
    return get('/email/$email').then((response) => response.isOk);
  }

  //일반 회원 로그인 휴면계정 검사
  Future<UserDormant> checkMobis(
      String username, String password, String deviceId, String pushToken, String role) async {
    String roleCode = role == 'COMPANY' ? 'C' : 'U';
    UserDormant result = UserDormant.fromJson({});

    final body = {
      'username': username, //사용자 아이디
      'password': password, //암호
      'deviceId': encryptAes128(deviceId), //디바이스 ID
      'pushToken': pushToken, //push 토큰
      'role': roleCode, //역할
    };

    print(body);

    final response = await post('/v2/sleep/checkMobis', body);
    print(response.body);
    result = UserDormant.fromJson(response.body);

    return result;
  }

  //SNS 로그인 휴면계정 검사
  Future<UserDormant?> checkToken(String token, String type, String deviceId, String pushToken) async {
    UserDormant? result = UserDormant.fromJson({});
    final body = {
      'token': token, //사용자 아이디
      'type': type, //암호
      'deviceId': encryptAes128(deviceId), //디바이스 ID
      'pushToken': pushToken //push 토큰
    };

    print(body);
    final response = await post('/v2/sleep/checkToken', body);

    print(response.body);
    if (response.body == null) return null;
    result = UserDormant.fromJson(response.body);

    return result;
  }

  //일반 회원 로그인 휴면계정 복구
  Future<bool> recoverMobis(
      String username, String password, String deviceId, String pushToken, String name, String phoneNumber) async {
    bool result = false;

    final body = {
      'username': username, //사용자 아이디
      'password': password, //암호
      'deviceId': encryptAes128(deviceId), //디바이스 ID
      'pushToken': pushToken, //push 토큰
      'name': name, //성명
      'telNumber': phoneNumber
    };

    print(body);
    final response = await post('/v2/sleep/recoverMobis', body);

    print(response.body);
    result = response.body;

    return result;
  }

  //SNS 로그인 휴면계정 복구
  Future<bool> recoverToken(
      String token, String type, String deviceId, String pushToken, String name, String phoneNumber) async {
    bool result = false;

    final body = {
      'token': token, //사용자 아이디
      'type': type, //SNS 타입
      'deviceId': encryptAes128(deviceId), //디바이스 ID
      'pushToken': pushToken, //push 토큰
      'name': name, //성명
      'telNumber': phoneNumber
    };

    print(body);
    final response = await post('/v2/sleep/recoverToken', body);

    print(response.body);
    result = response.body;

    return result;
  }
}
