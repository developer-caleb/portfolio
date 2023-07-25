import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matjipmemo/constants/firestore_keys.dart';
import 'package:matjipmemo/controller/login_controller.dart';
import 'package:matjipmemo/data/repo/collections_network_repository.dart';
import 'package:matjipmemo/data/repo/list_network_repository.dart';
import 'package:matjipmemo/models/base/post.dart';
import 'package:matjipmemo/models/firebase/color_set.dart';
import 'package:matjipmemo/models/firebase/list_model.dart';
import 'package:matjipmemo/models/firebase/user_model.dart';
import 'package:matjipmemo/pages/post/post_mode_manager.dart';
import 'package:matjipmemo/tools/enums.dart';
import 'package:matjipmemo/tools/logger.dart';
import 'package:matjipmemo/tools/show_toast.dart';
import 'package:matjipmemo/view/widget/crop_images.dart';
import 'package:matjipmemo/view/widget/pop_ups.dart';

import '../../constants/const_level_table.dart';

class WriteListController extends GetxController with GetSingleTickerProviderStateMixin {
  final int maxContentsLength = 500;
  TextEditingController titleEditController = TextEditingController();
  TextEditingController descriptionEditController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  String get inputTitleText => _inputTitleText.value;
  final RxString _inputTitleText = ''.obs;

  int get inputPrice => _inputPrice.value;
  final RxInt _inputPrice = 0.obs;

  String get inputDescriptionText => _inputDescriptionText.value;
  final RxString _inputDescriptionText = ''.obs;

  PostMode get postMode => _postMode.value;
  final Rx<PostMode> _postMode = PostMode.eatrip.obs;

  File? get imageFile => _imageFile.value;
  final Rxn<File> _imageFile = Rxn();

  UserModel get userModel => Get.find<LoginController>().userModel!;
  List<ColorSet> colorList = [];
  String? webImg;
  PostModeManager postModeManager = PostModeManager();
  ColorSet selectedColor = ColorSet(backgroundColor: Colors.white.value, textColor: Colors.black87.value);
  ListModel? originList;

  int? maxPrice;

  @override
  void onInit() {
    titleEditController.addListener(() {
      _inputTitleText(titleEditController.text);
    });
    descriptionEditController.addListener(() {
      _inputDescriptionText(descriptionEditController.text);
    });

    priceController.addListener(() {
      int? parsePrice = int.tryParse(priceController.text);

      ///parse가 제대로 안되면 0원을 return 해버리기~
      if (parsePrice == null) {
        return;
      }
      _inputPrice(parsePrice);
      if (parsePrice > maxPrice!) {
        priceController.text = maxPrice!.toString();
      }
    });

    maxPrice = AppLevelTable.getMaxPrice(userModel.level);
    if (Get.arguments != null) {
      logger.i('Get.arguments is not null');
      originList = Get.arguments as ListModel;
      titleEditController.text = originList?.listName ?? '';
      descriptionEditController.text = originList?.description ?? '';
      priceController.text = originList?.price.toString() ?? '';
      _postMode(originList!.postType);
      if (originList?.thumbUrl?.isNotEmpty ?? false) {
        webImg = originList!.thumbUrl;
      }
    } else {
      _postMode(postModeManager.postMode);
    }

    super.onInit();
  }

  Future<List<ColorSet>> fetchColorList() async {
    var colorCollectionList = await collectionsNetworkRepository.getColorList(userModel);
    colorList = colorCollectionList.map((e) => ColorSet(backgroundColor: e.backgroundColor ?? 4294967295, textColor: e.textColor ?? Colors.black87.value)).toList();
    return colorList;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onClickCoverImg() async {
    logger.d('onClickCoverImg');
    try {
      final _picker = ImagePicker();
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;
      _imageFile(await cropImage(pickedFile.path, width: 500, height: 500));
    } finally {}
  }

/*  void onClickPallet() {
    logger.d('onClickPallet');
  }*/

  void onClickPostMode(PostMode mode) {
    logger.d('onClickPostMode');
    switch (postModeManager.postMode) {
      case PostMode.eatrip:
        break;
      case PostMode.eat:
        if (mode != PostMode.eat) {
          showToast('해당 모드에서 불가능🥲\n설정 → 맛집 & 여행 모드');
          return;
        }
        break;
      case PostMode.trip:
        if (mode != PostMode.trip) {
          showToast('해당 모드에서 불가능🥲\n설정 → 맛집 & 여행 모드');
          return;
        }
        break;
    }
    _postMode(mode);
  }

  void onClickSaveButton() async {
    logger.d('onClickSaveButton');
    if (titleEditController.text.trim().isEmpty) {
      return showToast('리스트명을 입력해주세요');
    }
    DocumentReference docRef = originList?.reference ?? FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(userModel.uid).collection(COLLECTION_LIST).doc();

    ///Loading progressBar 넣기
    showProgressTextDialog('리스트를 제작 중 입니다\n잠시만 기다려주세요', dismissible: false);

    String? imgUrl;
    String? thumbUrl;
    logger.d('docRef is ${docRef.path}');
    imgUrl = (originList?.imageUrl?.isNotEmpty ?? true) ? originList?.imageUrl : null;
    thumbUrl = (originList?.thumbUrl?.isNotEmpty ?? true) ? originList?.thumbUrl : null;
    if (imageFile != null) {
      Timestamp nowTime = Timestamp.now();

      ///image 넣기
      imgUrl = await listNetworkRepository.uploadImage(image: imageFile!, docPath: docRef.path, timestamp1: nowTime);

      ///thumbImage 넣기
      thumbUrl = await listNetworkRepository.uploadThumb(
        originImage: imageFile!,
        docPath: docRef.path,
        timestamp1: nowTime,
      );
    }
    if (originList != null) {
      updateListModel(docRef: docRef, thumbUrl: thumbUrl, imgUrl: imgUrl);
    } else {
      saveListModel(docRef: docRef, thumbUrl: thumbUrl, imgUrl: imgUrl);
    }
  }

  void saveListModel({required DocumentReference docRef, required String? thumbUrl, required String? imgUrl}) async {
    logger.d('saveListModel docRef : $docRef');
    ListModel listModel = ListModel.createList(
        listName: titleEditController.text.trim(),
        description: descriptionEditController.text.trim(),
        postType: postMode,
        post: Post(invisible: true),
        docRef1: docRef,
        colorSet: selectedColor,
        userModel: userModel,
        thumbUrl: thumbUrl,
        imgUrl: imgUrl,
        price: inputPrice);
    logger.d('listModel ->  $listModel');
    await listNetworkRepository.makeNewList(
      listModel: listModel,
    );
    Get.until((route) => route is! PopupRoute); //팝업창 모두 끄기
    Get.back(result: listModel);
  }

  void updateListModel({required DocumentReference docRef, required String? thumbUrl, required String? imgUrl}) async {
    await listNetworkRepository.updateOriginList(
      docRef: docRef,
      thumbUrl: thumbUrl,
      imgUrl: imgUrl,
      postType: postMode,
      selectedColor: selectedColor,
      listName: titleEditController.text.trim(),
      description: descriptionEditController.text.trim(),
      price: inputPrice,
    );
    ListModel newList = ListModel.fromMap(originList!.toJson(), reference: originList!.reference);
    newList.thumbUrl = thumbUrl;
    newList.imageUrl = imgUrl;
    newList.price = inputPrice;
    newList.postType = postMode;
    newList.colorSet = selectedColor;
    newList.listName = titleEditController.text.trim();
    newList.description = descriptionEditController.text.trim();
    Get.until((route) => route is! PopupRoute); //팝업창 모두 끄기
    Get.back(result: newList);
  }
}
