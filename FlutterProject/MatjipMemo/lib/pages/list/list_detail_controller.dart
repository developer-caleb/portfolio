import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matjipmemo/constants/firestore_keys.dart';
import 'package:matjipmemo/controller/login_controller.dart';
import 'package:matjipmemo/data/repo/list_network_repository.dart';
import 'package:matjipmemo/data/repo/review_network_repository.dart';
import 'package:matjipmemo/models/firebase/list_model.dart';
import 'package:matjipmemo/models/firebase/matjip_model.dart';
import 'package:matjipmemo/models/firebase/review_model.dart';
import 'package:matjipmemo/models/firebase/user_model.dart';
import 'package:matjipmemo/pages/list/list_controller.dart';
import 'package:matjipmemo/pages/list/list_description_modify_page.dart';
import 'package:matjipmemo/pages/list/list_post_add_page.dart';
import 'package:matjipmemo/route/get_arguments.dart';
import 'package:matjipmemo/route/get_parameters.dart';
import 'package:matjipmemo/route/router_name.dart';
import 'package:matjipmemo/tools/enums.dart';
import 'package:matjipmemo/tools/kakao_tools.dart';
import 'package:matjipmemo/tools/logger.dart';
import 'package:matjipmemo/tools/show_toast.dart';
import 'package:matjipmemo/view/widget/pop_ups.dart';
import 'package:matjipmemo/view/widget/report_item/open_report_dialog.dart';

class ListDetailController extends GetxController {
  final Rxn<ListModel> _listModel = Rxn();

  ListModel? get listModel => _listModel.value;
  final Rxn<ListModel> _publicListModel = Rxn();
  ListModel? get publicListModel => _publicListModel.value;
  final RxList<MatjipModel> _matjipList = RxList();

  List<MatjipModel> get matjipList => _matjipList.value;
  final RxBool _isProgressing = true.obs;
  bool get isMine => (thisUserModel?.uid ?? 'noUser') == listModel?.writer.uid;
  bool get isProgressing => _isProgressing.value;
  bool isModified = false;
  double horizontalPadding = 20;
  Rxn<ReviewModel> myReview = Rxn<ReviewModel>();
  RxList<ReviewModel> otherReviews = RxList();

  UserModel? get thisUserModel => Get.find<LoginController>().userModel;

  @override
  void onInit() {
    super.onInit();
    initialLoading();
  }

  void initialLoading() async {
    logger.i('current Route => ${Get.currentRoute}');
    logger.i('current Route4 => ${Uri.decodeComponent(Get.currentRoute)}');
    if (Get.arguments != null) {
      logger.i('Get.arguments is not null');
      _listModel.value = Get.arguments as ListModel;
    } else {
      String? listId = Get.parameters[GetParameters.listId];
      if (listId != null) {
        await loadListModel(listId);
      } else {
        logger.d('input listId is $listId');
        closeListDetailPage();
        return;
      }
    }
    _publicListModel.value ??= await listNetworkRepository.getList(list: listModel!.listId);

    await Future.wait([getMyReview(), getOtherReview(), loadMatjipList()]);
    _isProgressing(false);
  }

  Future<void> getMyReview() async {
    logger.d('getMyReview listModel -> $listModel');
    myReview.value = await reviewNetworkRepository.loadMyReviewModel(parentRef: listModel!.reference!, uid: thisUserModel?.uid);
    return;
  }

  Future<void> getOtherReview() async {
    otherReviews.value = await reviewNetworkRepository.loadReviewModels(parentRef: listModel!.reference!, uid: thisUserModel?.uid);
    return;
  }

  Future loadMatjipList() async {
    if (listModel == null) {
      return logger.e('listModel==null');
    }
    _matjipList.value = await listNetworkRepository.getMatjipsFromList(listModel: listModel!);
  }

  void onClickFloatingButton() async {
    if (isProgressing) {
      return logger.e('now progressing');
    }
    logger.d('onClickFloatingButton');
    if (listModel == null) {
      return logger.e('listModel is empty!');
    }
    await Get.to(() => ListPostAddPage(
          listModel: listModel!,
          matjipList: matjipList.map((e) => e.matjipId).toList(),
        ));
    loadMatjipList();
  }

  void onClickIssueButton() async {
    logger.d('onClickIssueButton');

    if (matjipList.length < 5) {
      return showToast('장소를 5개 이상 등록해주세요😢');
    }

    ///TODO 만약에 리스트 중에 1개라도 사진이 없다면, 출시가 안 됨
    List<String> noImageMatjipList = matjipList.where((element) => element.imageUrls.isEmpty).map((element) => element.matjipName).toList();
    if (noImageMatjipList.isNotEmpty) {
      return Get.dialog(AlertDialog(
        title: const Text('사진이 없는 맛집은 업로드 불가합니다'),
        content: Text(('${noImageMatjipList.join(',')} \n')),
        actions: [TextButton(onPressed: () => Get.back(), child: Text('확인'))],
      ));
    }

    await listNetworkRepository.issueList(listModel: listModel!);
    ListModel newList = listModel!.copyWith(
        isPublished: true,
        post: listModel!.post.copyWith(
          invisible: false,
        ));
    Get.back(result: newList);

/*    await optionButtonListBottomSheet(listModel!, isIssue: true);
    loadMatjipList();*/
  }

  void onClickPostModifyButton(int index) async {
    MatjipModel? newMatjipModel = await Get.to(() => ListDescriptionModifyPage(
          matjipModel: matjipList[index],
        ));
    if (newMatjipModel != null) {
      logger.d('newMatjipModel ${newMatjipModel.matjipName}, ${newMatjipModel.description}');
      _matjipList[index] = newMatjipModel;
    }
  }

  Future<void> loadListModel(String listId) async {
    logger.d('loadListModel');
    ListModel? listModel = await listNetworkRepository.getList(list: listId);
    if (listModel != null) {
      logger.d('getList result is ${listModel = null}');
      _listModel.value = listModel;
      _publicListModel.value = listModel;
    } else {
      closeListDetailPage();
    }
  }

  Future<void> closeListDetailPage() async {
    await Future.microtask(() => null);
    Get.back();
    Get.delete<ListDetailController>();
    showToast('해당 모임은 존재하지 않습니다');
  }

  Future<void> onClickMatjip(MatjipModel matjipModel) async {
    String placeId = (matjipModel.placeId.isNotEmpty) ? matjipModel.placeId : matjipModel.toPlaceId();
    logger.d(placeId);
    Get.toNamed(Routes.Place, arguments: {GetArguments.placeId: placeId, GetArguments.placeMatjip: matjipModel});
  }

  Future<bool> onWillPop() async {
    if (isModified) {
      logger.d('modified Model $listModel');
      Get.back(result: listModel);
      return false;
    } else {
      return true;
    }
  }

  Future<bool> onSubmitReview(String text, double starNum) async {
    logger.d('review submitted. starNum : $starNum, \n Text: $text');
    if (thisUserModel == null) {
      Get.find<LoginController>().doLogin();
      return false;
    }
    if (listModel == null) {
      logger.d('list Model이 없습니다.');
      return false;
    }
    if (myReview.value != null) {
      showToast('이미 작성한 리뷰가 있습니다.😢');
      return false;
    }
    DocumentReference reviewRef = listModel!.reference!.collection(COLLECTION_REVIEWS).doc(thisUserModel!.uid);
    DocumentSnapshot myReviewSnapshot = await reviewRef.get();
    if (myReviewSnapshot.exists) {
      myReview.value = ReviewModel.fromSnapshot(myReviewSnapshot);
      showToast('이미 작성한 리뷰가 있습니다.');
      return false;
    }
    logger.d('저장 클릭-> text :  $text, \n starNum : $starNum ');
    ReviewModel reviewModel = ReviewModel.newReview(reviewRef.id, userModel: thisUserModel!, text: text, starNum: starNum, docRef1: reviewRef);
    double starAvgNum = listModel!.calculateAvgStarNum(newStarNum: starNum);
    reviewNetworkRepository.postReview(docRef: reviewRef, parentDocRef: listModel!.reference, reviewModel: reviewModel, starAvgNum: starAvgNum);
    myReview(reviewModel);
    ListModel newListModel = ListModel.fromMap(listModel!.toJson(), reference: listModel!.reference);
    newListModel.starAvg = starAvgNum;
    _listModel.value = newListModel;
    isModified = true;
    return true;
  }

  void onClickHeartButton({required bool isContain}) {
    logger.d('onClick heart Icon');
    if (thisUserModel == null) {
      return Get.find<LoginController>().doLogin();
    }
    ListModel newListModel = ListModel.fromMap(publicListModel!.toJson(), reference: publicListModel!.reference);
    if (!isContain) {
      ///Like를 하지 않았을 때 like 하기
      newListModel.post = newListModel.post.copyWith(
          listOfLikes: {
        ...newListModel.post.listOfLikes,
        thisUserModel!.uid,
      }.toList());
    } else {
      ///Like 되어 있을 때 취소하기
      newListModel.post = newListModel.post.copyWith(
        listOfLikes: newListModel.post.listOfLikes.where((userId) => userId != thisUserModel!.uid).toList(),
      );
    }
    listNetworkRepository.likeList(listModel: publicListModel!, isContain: isContain, uid: thisUserModel!.uid);
    _listModel.value = newListModel;
    _publicListModel.value = newListModel;
    logger.i('heartList -> ${newListModel.post.listOfLikes}');
    isModified = true;
  }

  void onSelectPopUpMenu(PopUpMenu value) async {
    logger.d('selected value $value , ${value.info}');
    switch (value) {
      case PopUpMenu.share:
        showProgressbar(barrierDismissible: true);
        await KakaoShareManager().shareListKakao(listModel!);
        Get.until((route) => route is! PopupRoute); //팝업창 모두 끄기
        break;
      case PopUpMenu.modify:
        {
          ListModel? newListModel = await Get.toNamed(Routes.WriteList, arguments: listModel!) as ListModel?;
          if (newListModel != null) {
            isModified = true;
            _listModel.value = newListModel;
            logger.d('new ListModel => $listModel');
          }
        }
        break;
      case PopUpMenu.delete:
        {
          if (listModel!.writer.uid != thisUserModel?.uid) {
            return logger.e('만든 사람이 달라서 삭제하지 않았습니다\n ${listModel!.writer.uid} != thisUserModel?.uid');
          }
          bool? deleteConfirm = await Get.dialog(AlertDialog(
            content: Text('리스트를 정말로 삭제하시겠습니까\n삭제 후 복구는 불가능합니다.'),
            actions: [
              TextButton(onPressed: () => Get.back(result: true), child: Text('확인')),
              TextButton(onPressed: () => Get.back(result: false), child: Text('취소', style: TextStyle(color: Colors.grey))),
            ],
          ));
          if ((deleteConfirm ?? false) == false) {
            return;
          }
          await listNetworkRepository.deleteList(listModel: listModel!);
          await Get.find<ListController>().getListList();
          Get.back();
        }
        break;
      case PopUpMenu.report:
        logger.d('onClick report');
        openReportDialog(listModel!);
        break;
      case PopUpMenu.issue:
        break;
    }
  }
}
