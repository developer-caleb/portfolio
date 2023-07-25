import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hanaromart/data/models/shop.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../tools/disatance.dart';

class App07Controller extends GetxController with StateMixin {
  late final Shop shop;

  late RxBool hasPermission;
  late RxString distance;
  late RxBool isLiked;
  late WebViewController webViewController = WebViewController();
  late final List<Marker> marker;

  @override
  void onInit() {
    super.onInit();
    shop = Get.arguments as Shop;
    hasPermission = false.obs;
    distance = ''.obs;
    isLiked = shop.isLike!.obs;
    marker = <Marker>[].obs;
    checkDistance();
  }

  checkDistance() async {
    marker.add(Marker(
        markerId: MarkerId(shop.index.toString()),
        draggable: true,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: LatLng(shop.lat, shop.lng),
        onTap: () {}));
    change(null, status: RxStatus.loading());
    hasPermission.value = await CustomLocationService().checkPermission();
    if (hasPermission.value) {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      distance.value =
          '${CustomLocationService().getDistance(shop.lat, shop.lng, position.latitude, position.longitude)}';
    }
    debugPrint(distance.value);
    change(distance, status: RxStatus.success());
  }

  void toggleLike() {
    isLiked.toggle();
  }

  Widget dialogCustom() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "[${shop.name}점] 으로 지정하시겠습니까? 매장 변경 시 이전 매장에서 다운받은 쿠폰 등 서비스 정보는 [${shop.name}점]에서 확인 불가합니다. ",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      "※ 이전 매장으로 복귀 시 언제든지 확인가능",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            child: Text(
                              '네 지정합니다',
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(0, 45),
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), side: const BorderSide(color: Colors.black)),
                            ),
                            onPressed: () {
                              //Get.to(()=>)
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            child: Text(
                              '아니요',
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(0, 45),
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), side: const BorderSide(color: Colors.black)),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
