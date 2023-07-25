import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hanaromart/data/dummy_data.dart';
import 'package:hanaromart/data/models/address.dart';
import 'package:hanaromart/data/models/shop.dart';
import 'package:hanaromart/tools/disatance.dart';
import 'package:hanaromart/tools/logger.dart';

import '../../services/shop.app06.dart';
import '../../widgets/dialog.dart';

class App06Controller extends GetxController with StateMixin {
  final RxString regionName = '전체'.obs;
  final RxInt filterIndex = 0.obs;
  late final RxList<RegionsItems> regionItems;
  late final RxList<Shop> shopItems;

  // RxList<ShopModel> shopModels = <ShopModel>[].obs; //TODO 안쓰고 있는 것 같음
  RxList<Address> addressModels = <Address>[].obs;
  RxList<Shop> filteredShopModels = <Shop>[].obs;
  RxString hintText = '매장 검색'.obs;
  RxString filterText = '가나다 순'.obs;

  List<String> filters = ['가나다 순', '가까운 순', '앱 운영중'];

  final TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    regionItems = <RegionsItems>[].obs;
    shopItems = <Shop>[].obs;

    //shopModels = <ShopModel>[].obs;
    addressModels = <Address>[].obs;

    initData();

    regionItems.value = DummyData.regionsDummy;
    regionName.listen((name) {
      filterShopModel();
    });
    filtering(filterIndex.value);
  }

  void filterShopModel() {
    List<Shop> resultWidget = [];
    switch (regionName.value) {
      case "전체":
        resultWidget = shopItems;
        break;
      default:
        resultWidget = shopItems.where((Shop ele) => ele.regionName == regionName.value).toList();
        break;
    }

    filteredShopModels.value = resultWidget;
  }

  void initData() async {
    //shopModels.value = await CustomJsonService().fetchStore();

    addressModels.value = await CustomJsonService().fetchAddress();
    addressModels.insert(0, Address(lname: "전체"));

    // shopModels.refresh();
    addressModels.refresh();
  }

  void onChange(String name) {
    regionName.value = regionItems.firstWhere((element) => element.name == name).name;
  }

  void searchText(String? text) {
    shopItems.value = DummyData.shopDummys;
    textEditingController.text = text ?? '';

    final suggestions = shopItems.where((element) {
      final name = element.name.toLowerCase();
      final input = textEditingController.text.toLowerCase();

      return name.contains(input);
    }).toList();

    shopItems.value = suggestions.obs;
    shopItems.refresh();
  }

  void filtering(int index) async {
    logger.d('on filtering');
    shopItems.value = DummyData.shopDummys;

    filterIndex.value = index;
    filterText.value = filters[filterIndex.value];
    switch (filterIndex.value) {
      case 0:
        shopItems.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 1:
        await checkDistance();

        break;
      case 2:
        shopItems.value = shopItems.where((ele) => ele.isOpening == true).toList();
        break;
    }

    /*  update();
    shopItems.refresh();*/
    filterShopModel();
  }

  Future checkDistance() async {
    change(null, status: RxStatus.loading());
    Position position = await CustomLocationService().determinePosition();
    for (Shop element in shopItems) {
      element.distance =
          CustomLocationService().getDistance(position.latitude, position.longitude, element.lat, element.lng);
    }
    shopItems.sort((a, b) => a.distance.compareTo(b.distance));
    change(shopItems, status: RxStatus.success());
  }

  void isLike(int index) async {
    Shop item = shopItems.firstWhere((element) => element.index == index);
    bool? result = await shopConfirmDialog(item: item);
    if (result ?? false) {
      item.isLike = !item.isLike!;
      shopItems.refresh();
    }
  }
}
