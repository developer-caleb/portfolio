import 'dart:math';

import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:matjipmemo/constants/strings.dart';
import 'package:matjipmemo/controller/login_controller.dart';
import 'package:matjipmemo/models/firebase/list_model.dart';
import 'package:matjipmemo/models/firebase/matjip_model.dart';
import 'package:matjipmemo/models/firebase/moim_model.dart';
import 'package:matjipmemo/models/firebase/place_model.dart';
import 'package:matjipmemo/models/firebase/user_model.dart';
import 'package:matjipmemo/tools/dynamic_links/dynamic_link_tools.dart';
import 'package:matjipmemo/tools/hash_tag_tools.dart';
import 'package:matjipmemo/tools/logger.dart';
import 'package:matjipmemo/tools/show_toast.dart';

void kakaoLogout() async {
  try {
    var code = await UserApi.instance.logout();
    logger.d(code.toString());
    logger.d("카카오 로그아웃 되었습니다.");
  } catch (e) {
    logger.e(e);
  }
}

class KakaoShareManager {
  static final KakaoShareManager _manager = KakaoShareManager._internal();
  static String matjipTestImgUrl = 'https://firebasestorage.googleapis.com/v0/b/matjipmemo.appspot.com/o/Apptools%2Fgraphic_img.jpg?alt=media&token=fb800223-f500-48a5-a37e-7fce576eb797';
  static String moimTestImgUrl = 'https://firebasestorage.googleapis.com/v0/b/matjipmemo.appspot.com/o/Apptools%2Fmoim_default_image.png?alt=media&token=15619bfe-8f8b-4b7b-939d-c1fdc9e38bd9';

  factory KakaoShareManager() {
    return _manager;
  }

  KakaoShareManager._internal() {
    // 초기화 코드
  }

  Future shareMatjipKaKao(MatjipModel matjipModel) => shareKaKaoTemplate(_matjipTemplate(matjipModel));

  Future sharePlaceKakao(PlaceModel placeModel, String? imgUrl) => shareKaKaoTemplate(_placeTemplate(placeModel, imgUrl));

  Future shareListKakao(
    ListModel listModel,
  ) =>
      shareKaKaoTemplate(_listTemplate(
        listModel,
      ));

  Future shareMoimKakao(MoimModel moimModel) => shareKaKaoTemplate(_moimTemplate(moimModel));

  Future shareMatjipListKaKao({required List<MatjipModel> matjipList}) => shareKaKaoTemplate(_matjipListTemplate(matjipModels: matjipList));

  Future shareKaKaoTemplate(Future template, {bool userCheck = false}) async {
    if (await ShareClient.instance.isKakaoTalkSharingAvailable() == false) {
      showToast('카카오톡 설치를 확인해주세요'.tr);
      return;
    }
    if (userCheck) {
      UserModel? userModel = Get.find<LoginController>().userModel;
      if (userModel == null) {
        return Get.find<LoginController>().doLogin();
      }
    }
    await sendUri(await template);
  }

  Future sendUri(
    DefaultTemplate template,
  ) async {
    Uri uri = await ShareClient.instance.shareDefault(template: template);
    await ShareClient.instance.launchKakaoTalk(uri);
  }

  Future<LocationTemplate> _matjipTemplate(
    MatjipModel matjipModel,
  ) async {
    UserModel userModel = Get.find<LoginController>().userModel!;
    Uri uri = await getMatjipDynamicLink(matjipModel: matjipModel, userModel: userModel);
    Link myLink = Link(webUrl: uri, mobileWebUrl: uri);
    String? description = matjipModel.tags.isEmpty ? matjipModel.description : matjipModel.description! + '\n${taglistToString(matjipModel.tags)}';
    return LocationTemplate(
        addressTitle: matjipModel.matjipName,
        social: Social(
          likeCount: matjipModel.post.listOfLikes.length,
          commentCount: matjipModel.post.listOfComment.length,
        ),
        buttons: [
          Button(title: '자세히 보기', link: myLink),
        ],
        address: matjipModel.geo.address!,
        content: matjipModel.imageUrls.isNotEmpty
            ? Content(
                title: matjipModel.matjipName + (matjipModel.visited ? '⭐️${matjipModel.starNum}' : ''),
                description: description,
                imageWidth: 1000,
                imageHeight: 1000,
                imageUrl: Uri.parse(matjipModel.imageUrls.first),
                link: myLink)
            : Content(
                description: description,
                imageWidth: 512,
                imageHeight: 250,
                imageUrl: Uri.parse(matjipTestImgUrl),
                title: matjipModel.matjipName + (matjipModel.visited ? '⭐️${matjipModel.starNum}' : ''),
                link: myLink));
  }

  Future<ListTemplate> _matjipListTemplate({
    required List<MatjipModel> matjipModels,
  }) async {
    UserModel userModel = Get.find<LoginController>().userModel!;
    String title = '${userModel.nickname}님의 맛집리스트 ${matjipModels.length}선';
    Uri uri = await getMatjipListDynamicLink(matjipModels: matjipModels, title: title, userModel: userModel);
    Link myLink = Link(webUrl: uri, mobileWebUrl: uri);
    return ListTemplate(
      contents: List.generate(
          min(matjipModels.length, 3),
          (index) => Content(
              title: matjipModels[index].matjipName + (matjipModels[index].visited ? '⭐️${matjipModels[index].starNum}' : ''),
              imageUrl: Uri.parse(matjipModels[index].thumbnailImageUrls.isNotEmpty
                  ? matjipModels[index].thumbnailImageUrls.first
                  : matjipModels[index].imageUrls.isNotEmpty
                      ? matjipModels[index].imageUrls.first
                      : defaultFoodImage),
              link: myLink,
              description: matjipModels[index].description,
              imageHeight: 50,
              imageWidth: 50)),
      headerLink: myLink,
      headerTitle: title,
      buttons: [
        Button(title: '자세히 보기', link: myLink),
      ],
    );
  }

  Future<LocationTemplate> _placeTemplate(PlaceModel placeModel, String? imgUrl) async {
    logger.d('_placeTemplate 만들어짐');
    UserModel userModel = Get.find<LoginController>().userModel!;
    Uri uri = await getPlaceDynamicLink(placeModel: placeModel, userModel: userModel);
    var myLink = Link(webUrl: uri, mobileWebUrl: uri);
    var description = '${placeModel.geo.address}\n${placeModel.places.phone}';
    return LocationTemplate(
        addressTitle: placeModel.places.matjipName,
        social: Social(
          likeCount: placeModel.places.listOfLikes.length,
          commentCount: placeModel.places.listOfReview.length,
        ),
        buttons: [
          Button(link: myLink, title: "자세히 보기"),
        ],
        content: imgUrl != null
            ? Content(description: description, imageWidth: 1000, imageHeight: 1000, imageUrl: Uri.parse(imgUrl), link: myLink, title: placeModel.places.matjipName)
            : Content(
                description: description,
                imageWidth: 512,
                imageHeight: 250,
                imageUrl: Uri.parse(matjipTestImgUrl),
                title: placeModel.places.matjipName,
                link: myLink,
              ),
        address: placeModel.geo.address!);
  }

  Future<TextTemplate> _listTemplate(
    ListModel listModel,
  ) async {
    logger.d('_placeTemplate 만들어짐');
    UserModel userModel = Get.find<LoginController>().userModel!;
    Uri uri = await getListDynamicLink(listModel: listModel, userModel: userModel);
    var myLink = Link(webUrl: uri, mobileWebUrl: uri);
    return TextTemplate(buttons: [
      Button(link: myLink, title: "자세히 보기"),
    ], text: '${userModel.name}님이 리스트를 공유했습니다.\n\n${listModel.listName}\n\n${listModel.description}', link: myLink);
  }

  Future<DefaultTemplate> _moimTemplate(
    MoimModel moimModel,
  ) async {
    UserModel userModel = Get.find<LoginController>().userModel!;
    Uri uri = await getMoimDynamicLink(moimModel: moimModel, userModel: userModel);
    var myLink = Link(webUrl: uri, mobileWebUrl: uri);
    var description = moimModel.description;
    return FeedTemplate(
        content: moimModel.moimImage.isNotEmpty
            ? Content(description: description, imageWidth: 1000, imageHeight: 1000, imageUrl: Uri.parse(moimModel.moimImage), link: myLink, title: moimModel.moimName)
            : Content(
                description: description,
                imageWidth: 512,
                imageHeight: 341,
                imageUrl: Uri.parse(moimTestImgUrl),
                title: moimModel.moimName,
                link: myLink,
              ),
        buttons: [
          Button(link: myLink, title: "자세히 보기"),
        ],
        buttonTitle: "자세히 보기",
        social: Social(subscriberCount: moimModel.memberNum.toInt()));
  }
}
