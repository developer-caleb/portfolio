import 'dart:convert';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:matjipmemo/data/repo/moim_network_repository.dart';
import 'package:matjipmemo/data/repo/post_network_repository.dart';
import 'package:matjipmemo/data/repo/user_network_repository.dart';
import 'package:matjipmemo/models/firebase/list_model.dart';
import 'package:matjipmemo/models/firebase/matjip_model.dart';
import 'package:matjipmemo/models/firebase/moim_model.dart';
import 'package:matjipmemo/models/firebase/place_model.dart';
import 'package:matjipmemo/models/firebase/user_model.dart';
import 'package:matjipmemo/route/get_arguments.dart';
import 'package:matjipmemo/route/get_parameters.dart';
import 'package:matjipmemo/route/router_name.dart';
import 'package:matjipmemo/tools/logger.dart';
import 'package:matjipmemo/tools/show_toast.dart';

import 'keys_for_dynamic_links.dart';

//const userImg = 'userImg'; // image url 쓰지말것

Future initDynamicLinks() async {
  logger.d('init Dynamic Links');

  //Terminated State
  final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
  if (initialLink != null) {
    final Uri deepLink = initialLink.link;
    await handleDynamicLink(deepLink);
  }

  //Background / Foreground State
  FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
    final Uri? deepLink = dynamicLinkData.link;
    logger.d('firebase link 있음?-> $deepLink ');
    if (deepLink != null) {
      // do something
      logger.d('firebase link 있음! ${deepLink.data.toString()}');
      handleDynamicLink(deepLink);
    } else {
      showToast('init Dynamic Links 없음');
    }
  });
}

Future handleDynamicLink(Uri deepLink) async {
  switch (deepLink.path) {
    case "/share_matjip":
      var code = deepLink.queryParameters[KEY_DYNAMICLINK_matjipId];
      var userid = deepLink.queryParameters[KEY_DYNAMICLINK_userId];
      if (code != null && userid != null) {
        UserModel linkingUser = await userNetworkRepository.getUserModel(userid);
        MatjipModel? matjipModel = await postNetworkRepository.getMatjipModel(code);
        if (matjipModel != null) {
          Get.toNamed(Routes.DetailPost, arguments: {
            GetArguments.postList: [matjipModel],
            GetArguments.title: '공유 된 맛집'.tr,
            GetArguments.linkingUser: linkingUser
          });
        }
      } else {
        showToast('something is null');
      }
      break;
    case "/share_matjips":
      var code = deepLink.queryParameters[KEY_DYNAMICLINK_matjipId];
      var userid = deepLink.queryParameters[KEY_DYNAMICLINK_userId];
      var title = deepLink.queryParameters[KEY_DYNAMICLINK_title];
      List<dynamic> matjipList = (code == null) ? [] : json.decode(deepLink.queryParameters[KEY_DYNAMICLINK_matjipId]!);
      if (code != null && userid != null && title != null) {
        ///json decode 해서 list로 넣어주면 될 듯?
        UserModel linkingUser = await userNetworkRepository.getUserModel(userid);
        List<MatjipModel> matjipModels = await postNetworkRepository.getMatjipModels(matjipList);
        if (matjipModels.isNotEmpty) {
          Get.toNamed(Routes.DetailPost, arguments: {GetArguments.postList: matjipModels, GetArguments.title: title, GetArguments.linkingUser: linkingUser});
        }
      } else {
        showToast('something is null');
      }
      break;
    case "/share_place":
      var placeId = deepLink.queryParameters[KEY_DYNAMICLINK_placeId];
      var userid = deepLink.queryParameters[KEY_DYNAMICLINK_userId];
      if (placeId != null && userid != null) {
        Get.toNamed(Routes.Place, arguments: {
          GetArguments.placeId: placeId,
        });
      } else {
        showToast('something is null');
      }
      break;
    case "/share_moim":
      String? moimId = deepLink.queryParameters[KEY_DYNAMICLINK_moimId];
      var userid = deepLink.queryParameters[KEY_DYNAMICLINK_userId];
      if (moimId != null && userid != null) {
        MoimModel? moimModel = await moimNetworkRepository.getMoim(moim: moimId);
        if (moimModel != null) {
          Get.toNamed(Routes.MoimDetail, parameters: {GetParameters.moimId: moimId}, arguments: moimModel);
        }
      } else {
        showToast('something is null');
      }
      break;
    case "/share_list":
      logger.d('리스트 공유 수정하기');

      ///종료 후에 광고를 보여주거나, 유료 리스트라서 못 보게 한다거나 그렇게 해야할 듯?
      ///링크로 보내는 거니 그거는 봐줄까? 일단은 넘어가자!,
      String? listId = deepLink.queryParameters[KEY_DYNAMICLINK_listId];
      var userid = deepLink.queryParameters[KEY_DYNAMICLINK_userId];
      if (listId != null) {
        Get.toNamed(
          Routes.DetailList,
          parameters: {GetParameters.listId: listId},
        );
      }

      break;
  }
}

Future<Uri> getDynamicLink(String linkAddress) async {
  final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: DynamicLinkHost,
      link: Uri.parse(linkAddress),
      androidParameters: const AndroidParameters(
        packageName: AndroidPackageName,
        minimumVersion: 1,
      ),
      iosParameters: const IOSParameters(
        bundleId: IOSPackageName,
        minimumVersion: '1.0',
        appStoreId: '1588490513',
      ));
  final ShortDynamicLink shortDynamicLink = await FirebaseDynamicLinks.instance.buildShortLink(parameters);
  final Uri uri = shortDynamicLink.shortUrl;
  logger.d('dynamic link -> ${uri.path}');

  return uri;
}

Future<Uri> getMatjipDynamicLink({required MatjipModel matjipModel, required UserModel userModel}) =>
    getDynamicLink('$DynamicLinkHost/share_matjip?$KEY_DYNAMICLINK_matjipId=${matjipModel.matjipId}&$KEY_DYNAMICLINK_userId=${userModel.uid}');

Future<Uri> getMatjipListDynamicLink({required List<MatjipModel> matjipModels, required String title, required UserModel userModel}) => getDynamicLink(
    '$DynamicLinkHost/share_matjips?$KEY_DYNAMICLINK_matjipId=${jsonEncode(matjipModels.map((e) => e.matjipId).toList()).toString()}&$KEY_DYNAMICLINK_userId=${userModel.uid}&$KEY_DYNAMICLINK_title=$title');

Future<Uri> getPlaceDynamicLink({required PlaceModel placeModel, required UserModel userModel}) =>
    getDynamicLink('$DynamicLinkHost/share_place?$KEY_DYNAMICLINK_placeId=${placeModel.places.placeId}&$KEY_DYNAMICLINK_userId=${userModel.uid}');

Future<Uri> getListDynamicLink({required ListModel listModel, required UserModel userModel}) =>
    getDynamicLink('$DynamicLinkHost/share_list?$KEY_DYNAMICLINK_listId=${listModel.listId}&$KEY_DYNAMICLINK_userId=${userModel.uid}');

Future<Uri> getMoimDynamicLink({required MoimModel moimModel, required UserModel userModel}) =>
    getDynamicLink('$DynamicLinkHost/share_moim?$KEY_DYNAMICLINK_moimId=${moimModel.moimUid}&$KEY_DYNAMICLINK_userId=${userModel.uid}');
