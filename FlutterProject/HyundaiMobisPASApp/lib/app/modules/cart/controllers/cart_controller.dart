class CartController extends GetxController {
  final authService = Get.find<AuthService>();
  final mobisService = Get.find<MobisService>();

  final loading = false.obs;
  final checkAll = false.obs;

  final total = 0.obs;
  final items = [].obs;

  bool get isLoading => loading.value;

  bool get isCheckAll => checkAll.value;

  int get currentTotal => total.value;

  void markAll(bool? value) {
    items.forEach((element) {
      (element as CartItem).isChecked = value!;
    });
    checkAll.value = value!;

    getTotal();
  }

  void changeCheckAll(bool value) {
    checkAll.value = value;
  }

  void removeItems() async {
    loading.value = true;

    try {
      final List<int> seqs = [];
      for (final CartItem item in items) {
        if (item.isChecked) {
          seqs.add(item.seq);
        }
      }
      if (seqs.isNotEmpty) {
        await mobisService.deleteItemsFromCart(seqs);

        showToastMessage('삭제되었습니다.');

        await getCartItems();
      }
    } catch (e) {
      showToastMessage('와');
    } finally {
      loading.value = false;
    }
  }

  Future<void> removeItem(int seq) async {
    loading.value = true;

    try {
      await mobisService.deleteItemsFromCart([seq]);

      showToastMessage('삭제되었습니다.');

      await getCartItems();
      total.value = 0;
    } catch (e) {
      showToastMessage('서버와 통신이 원활하지 않습니다.');
    } finally {
      loading.value = false;
    }
  }

  void request() async {
    loading.value = true;

    try {
      final List<CartItem> deliveryItems = [];
      final List<CartItem> pickupItems = [];
      for (final item in items) {
        if (item.isChecked) {
          if (item.deliveryCode == 'D') {
            deliveryItems.add(item);
          } else {
            pickupItems.add(item);
          }
        }
      }

      if (deliveryItems.isEmpty && pickupItems.isEmpty)
        throw Exception('no_items');

      if (deliveryItems.isNotEmpty) {
        await Get.toNamed('/delivery', arguments: deliveryItems);
      }
      if (pickupItems.isNotEmpty) {
        await Get.toNamed('/pickup', arguments: pickupItems);
      }

      await getCartItems();
    } catch (e) {
      if (e.toString() == 'Exception: no_items')
        showToastMessage('선택된 상품이 없습니다.');
    } finally {
      loading.value = false;
    }
  }

  Future<void> getCartItems() async {
    loading.value = true;

    try {
      items.clear();

      var cartItems = await mobisService.getCartItems();

      //로컬서버일 때 mutual, sapCode, tel 초기값 세팅
      // if (Environment().serverType == Environment.LOCAL) {
      //   showToastMessage("로컬서버 구매요청 테스트 세팅");
      //   cartItems.forEach((e) => {
      //         if (e.mutual == null || e.mutual.isEmpty) {e.mutual = "초영상사"},
      //         if (e.sapCode == null || e.sapCode.isEmpty)
      //           {e.sapCode = "100100"},
      //         if (e.tel == null || e.tel.isEmpty) {e.tel = "010-2329-7862"}
      //       });
      // }

      items.addAll(cartItems);
      total.value = 0;
    } catch (e) {
      showToastMessage('서버와 통신이 원활하지 않습니다.');
    } finally {
      loading.value = false;
    }
  }

  void getTotal() {
    int curTotal = 0;
    for (final CartItem item in items) {
      if (item.isChecked) {
        curTotal += item.price * item.qty;
      }
    }

    total.value = curTotal;
  }

  @override
  void onInit() async {
    super.onInit();

    // await initSettings();
  }

  //비회원일 시 로그인 화면으로 이동 팝업 출력
  // Future<void> initSettings() async {
  //   //빌드 후에 비동기로 콜백함수를 호출
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
  //     if (!authService.isLoggedIn) {
  //       final result = await openConfirmDialog("로그인 안내", loginPopupText);
  //       if (result) {
  //         Get.offNamed('/login');
  //       } else {
  //         Get.back();
  //       }
  //     }
  //   });
  // }

  @override
  void onReady() {
    super.onReady();

    getCartItems();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
