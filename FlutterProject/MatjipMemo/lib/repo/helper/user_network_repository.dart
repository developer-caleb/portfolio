import 'dart:async';
import 'dart:io';

import 'package:algolia/algolia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:matjipmemo/constants/firestore_keys.dart';
import 'package:matjipmemo/constants/strings.dart';
import 'package:matjipmemo/data/repo/point_network_repository.dart';
import 'package:matjipmemo/models/firebase/collection_model.dart';
import 'package:matjipmemo/models/firebase/point_model.dart';
import 'package:matjipmemo/models/firebase/purchase_model.dart';
import 'package:matjipmemo/models/firebase/user_model.dart';
import 'package:matjipmemo/models/result_model.dart';
import 'package:matjipmemo/service/algolia_service.dart';
import 'package:matjipmemo/service/remote_config_service.dart';
import 'package:matjipmemo/tools/logger.dart';
import 'package:matjipmemo/tools/show_toast.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../models/dto/point_noti_dto.dart';
import '../../tools/enums.dart';
import 'helper/transformers.dart';

class UserNetworkRepository with Transformers {
  static final UserNetworkRepository _userNetworkRepository = UserNetworkRepository._internal();

  factory UserNetworkRepository() => _userNetworkRepository;

  UserNetworkRepository._internal();

  Future<void> attemptCreateOrUpdateUser({required String userUID, String? email, String? loginType, String token = ""}) async {
    final DocumentReference userRef = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(userUID);
    DocumentSnapshot userSnapshot = await userRef.get();
    if (!userSnapshot.exists) {
      return await userRef.set(UserModel.getMapForCreateUser(userUID, email ?? '', token: token));
    } else {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      //logger.d('package build version => ${packageInfo.buildNumber}');
      return await userRef.update({
        KEY_UPDATE: Timestamp.now(),
        KEY_LOGINTYPE: "null",
        KEY_TOKEN: token,
        KEY_NATIONAL_CODE: Get.locale?.countryCode ?? "KR",
        KEY_LANGUAGE_CODE: Get.locale?.languageCode ?? "ko",
        KEY_DEVICE: Platform.operatingSystem,
        KEY_PACKAGE: packageInfo.version
      });
    }
  }

  Stream<UserModel> getUserModelStream(String userUID) {
    return FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(userUID).snapshots().transform(toUser);
  }

  Future<UserModel> getUserModel(String userUID) async {
    final DocumentReference userRef = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(userUID);
    DocumentSnapshot userSnapshot = await userRef.get();
    return UserModel.fromSnapshot(userSnapshot);
  }

  Future<void> updateUser({required String userUid, required Map<String, dynamic> updateMap}) async {
    updateMap[KEY_UPDATE] = Timestamp.now();
    final DocumentReference userRef = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(userUid);
    final DocumentSnapshot userSnapshot = await userRef.get();
    if (userSnapshot.exists) {
      await userRef.update(updateMap);
    }
  }

  Future<void> updateUserIntroduce(String userUid, String introduceString) => updateUser(userUid: userUid, updateMap: {KEY_DESCRIPTION: introduceString});

  Future<void> updateUserCollectionList({required String userUid, required List<String> collectionList, required List<String> collectionNews}) =>
      updateUser(userUid: userUid, updateMap: {KEY_COLLECTION_LIST: collectionList, KEY_COLLECTION_NEW: collectionNews});

  Future<void> updateUserInquire(String userUid) => updateUser(userUid: userUid, updateMap: {KEY_HASINQUIREANSWER: false});

  Future<void> updateAllPosts({
    required String userUid,
    required Map<String, dynamic> updateUserMap,
    required Map<String, dynamic> updatePostMap,
    bool isAllChange = true,
    int? limit,
  }) async {
    logger.d('updateAllPosts');
    updatePostMap[KEY_UPDATE] = Timestamp.now();
    final DocumentReference userRef = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(userUid);
    final DocumentSnapshot userSnapshot = await userRef.get();
    if (!userSnapshot.exists) {
      return logger.e('userSnapshot is not exists!');
    } else {
      //맛집 쿼리
      Query postQuery = FirebaseFirestore.instance.collectionGroup(COLLECTION_MATJIP).where(KEY_MAKERUID, isEqualTo: userUid).orderBy(KEY_CREATED, descending: true);
      if (limit != null) {
        postQuery = postQuery.limit(limit);
      }
      QuerySnapshot postSnapshot = await postQuery.get();
      logger.d('postSnapshot ${postSnapshot.docs.length}');
      return FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
        transaction.update(userRef, updateUserMap);
        if (postSnapshot.docs.isNotEmpty) {
          for (var doc in postSnapshot.docs) {
            transaction.update(doc.reference, updatePostMap);
          }
          logger.d('게시판 모두 변경');
        }
      });
    }
  }

  Future<void> updateAllPostsProfileWithCollection({
    required String userUid,
    required CollectionModel collectionModel,
  }) =>
      updateAllPosts(
        userUid: userUid,
        limit: 500,
        updateUserMap: {KEY_USERIMG: collectionModel.thumbUrl, KEY_IS_IMG_CIRCLE: false, KEY_BACKGROUND_COLOR: collectionModel.backgroundColor ?? 4294967295},
        updatePostMap: {KEY_WRITERIMG: collectionModel.thumbUrl, KEY_IS_WRITER_IMG_CIRCLE: false, KEY_WRITER_BACKGROUND_COLOR: collectionModel.backgroundColor ?? 4294967295},
      );

  Future<void> updateAllPostsProfileImage(String userUid, String postImg) => updateAllPosts(
      userUid: userUid,
      updateUserMap: {KEY_USERIMG: postImg, KEY_IS_IMG_CIRCLE: true, KEY_BACKGROUND_COLOR: 4294967295},
      updatePostMap: {KEY_WRITERIMG: postImg, KEY_IS_WRITER_IMG_CIRCLE: true, KEY_WRITER_BACKGROUND_COLOR: 4294967295});

  Future<void> updateAllPostsPrivate(String userUid, bool isPrivate) async {
    updateAllPosts(userUid: userUid, updateUserMap: {KEY_PRIVATE: isPrivate}, updatePostMap: {KEY_WRITERPRIVATE: isPrivate});
  }

  Future<ResultModel> updateUserNicknameAndAllChange(String userUid, String nickname) async {
    var result = ResultModel();
    final DocumentReference userRef = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(userUid);
    final DocumentSnapshot userSnapshot = await userRef.get();
    //이부분을 await으로 안해서 false가 되는 듯?
    await FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      var result = await checkNickname(nickname);
      if (!result.success) return result;
      if (userSnapshot.exists) {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(COLLECTION_USERS).where(KEY_NICKNAME, isEqualTo: nickname).get();
        if (querySnapshot.size == 0) {
          transaction.update(userRef, {KEY_NICKNAME: nickname});
          //게시판 쿼리 시작
          QuerySnapshot boardQuerySnapshot = await FirebaseFirestore.instance.collectionGroup(COLLECTION_MATJIP).where(KEY_MAKERUID, isEqualTo: userUid).get();
          if (boardQuerySnapshot.docs.isNotEmpty) {
            for (var document2 in boardQuerySnapshot.docs) {
              logger.d('document-> ' + document2.data().toString());
              transaction.update(document2.reference, {KEY_MAKERNAME: nickname});
            }
            logger.d('게시판 모두 변경');
          }

          result.success = true;
        } else {
          result.errorMsg = '중복된 닉네임이 존재합니다.'.tr;
          result.success = false;
          return result;
        }
      } else {
        result.errorMsg = '유저 정보가 없습니다.\n잠시 후 다시 시도해주세요.'.tr;
        result.success = false;
        return result;
      }
    }, timeout: const Duration(seconds: 5));
    return result;
  }

/*  Future<void> updateUserProfilePrivateAccountAndAllChange(
      String userUid, bool isPrivate) async {
    final DocumentReference userRef =
        FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(userUid);
    final DocumentSnapshot userSnapshot = await userRef.get();
    if (userSnapshot.exists) {
      return FirebaseFirestore.instance
          .runTransaction((Transaction transaction) async {
        await userRef.update({KEY_PRIVATE: isPrivate});
        //게시판 쿼리 시작
        QuerySnapshot boardQuerySnapshot = await FirebaseFirestore.instance
            .collectionGroup(COLLECTION_MATJIP)
            .where(KEY_MAKERUID, isEqualTo: userUid)
            .get();
        if (boardQuerySnapshot.docs.isNotEmpty) {
          for (var doc in boardQuerySnapshot.docs) {
            logger.d('document-> ' + doc.data().toString());
            transaction.update(doc.reference, {KEY_WRITERPRIVATE: isPrivate});
          }
          logger.d('게시판 모두 변경');
        } else {
          logger.d('해당 uid의 게시물 없음, 유저정보만 변경');
        }
        //게시판 쿼리 종료
      });
    }
  }*/

  ///22.11.30 updateAllPostsProfileImage로 대체 됨
  /*  Future<void> updateUserProfileIMGAndAllChange(
      String userUid, String postImg) async {
    final DocumentReference userRef =
        FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(userUid);
    final DocumentSnapshot userSnapshot = await userRef.get();
    if (userSnapshot.exists) {
      return FirebaseFirestore.instance
          .runTransaction((Transaction transaction) async {
        await userRef.update({KEY_USERIMG: postImg});
        //게시판 쿼리 시작
        QuerySnapshot postSnapshot = await FirebaseFirestore.instance
            .collectionGroup(COLLECTION_MATJIP)
            .where(KEY_MAKERUID, isEqualTo: userUid)
            .orderBy(KEY_CREATED, descending: true)
            .limit(100)
            .get();
        if (postSnapshot.docs.isNotEmpty) {
          for (var doc in postSnapshot.docs) {
            logger.d('document-> ' + doc.data().toString());
            transaction.update(doc.reference, {KEY_WRITERIMG: postImg});
          }
          logger.d('게시판 모두 변경');
        } else {
          logger.d('해당 uid의 게시물 없음, 유저정보만 변경');
        }
        //게시판 쿼리 종료
      });
    }
  }*/

  Future<ResultModel> checkNickname(
    String nickname,
  ) async {
    ResultModel result = ResultModel();
    result.success = false;
    await FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(COLLECTION_USERS).where(KEY_NICKNAME, isEqualTo: nickname).get();
      if (querySnapshot.size == 0) {
        result.success = true;
      } else {
        result.success = false;
        result.errorMsg = '중복된 닉네임이 존재합니다.'.tr;
        logger.e(result.errorMsg);
      }
    }, timeout: const Duration(seconds: 5));
    return result;
  }

  Future<bool> updateInitialUserDataWithNickname(
    String userUid,
    String nickname, {
    Map<String, dynamic>? userMap,
  }) async {
    String errorMSG = "";
    bool result = false;
    userMap ??= {};
    userMap[KEY_NICKNAME] = nickname;
    userMap[KEY_USERTYPE] = MEMBER;
    userMap[KEY_UPDATE] = Timestamp.now();
    final DocumentReference userRef = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(userUid);
    final DocumentSnapshot userSnapshot = await userRef.get();
    //이부분을 await으로 안해서 false가 되는 듯?
    await FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      if (userSnapshot.exists) {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(COLLECTION_USERS).where(KEY_NICKNAME, isEqualTo: nickname).get();
        if (querySnapshot.size == 0) {
          transaction.update(userRef, userMap!);
          result = true;
        } else {
          errorMSG = '중복된 닉네임이 존재합니다.'.tr;
          logger.e(errorMSG);
          showToast(errorMSG);
        }
      } else {
        errorMSG = '유저 정보가 없습니다.\n잠시 후 다시 시도해주세요.'.tr;
        logger.e(errorMSG);
      }
    }, timeout: const Duration(seconds: 5));
    return result;
  }

  Future setFollowUser(String followerUid, String followingUid) async {
    //followerUid 당하는 사람 //followingUid 클릭한 사람
    logger.d("setFollowUser");
    DocumentReference followerUserRef = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(followerUid);
    DocumentReference followingUserRef = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(followingUid);
    DocumentSnapshot followerSnapshot = await followerUserRef.get();
    DocumentSnapshot followingSnapshot = await followingUserRef.get();
    if ((!followerSnapshot.exists) || (!followingSnapshot.exists)) {
      showToast("유저가 존재하지 않습니다.".tr);
      return;
    }
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(followerUserRef, {
        KEY_FOLLOWER: FieldValue.arrayUnion([followingUid])
      });
      transaction.update(followingUserRef, {
        KEY_FOLLOWING: FieldValue.arrayUnion([followerUid])
      });
      return;
    });
  }

  Future cancelFollowUser(String followerUid, String followingUid) async {
    logger.d("cancelFollowUser");
    DocumentReference followerUserRef = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(followerUid);
    DocumentReference followingUserRef = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(followingUid);
    DocumentSnapshot followerSnapshot = await followerUserRef.get();
    DocumentSnapshot followingSnapshot = await followingUserRef.get();
    if ((!followerSnapshot.exists) || (!followingSnapshot.exists)) {
      showToast("유저가 존재하지 않습니다.".tr);
      return;
    }
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(followerUserRef, {
        KEY_FOLLOWER: FieldValue.arrayRemove([followingUid])
      });
      transaction.update(followingUserRef, {
        KEY_FOLLOWING: FieldValue.arrayRemove([followerUid])
      });
      return;
    });
  }

  Future<List<UserModel>> getFollowings(
    UserModel userModel,
  ) async {
    List<UserModel> resultList = [];
    logger.d("getFollowings");
    if (userModel.following.isEmpty) {
      return [];
    }
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(userModel.uid).get();
    if (!userSnapshot.exists) {
      return [];
    }
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(COLLECTION_USERS).where(KEY_FOLLOWER, arrayContains: userModel.uid).limit(50).get();
    logger.d(querySnapshot.size);
    for (var element in querySnapshot.docs) {
      resultList.add(UserModel.fromSnapshot(element));
    }
    return resultList;
  }

  Future<List<UserModel>> getFollowers(UserModel userModel) async {
    List<UserModel> resultList = [];
    logger.d("getFollowers");
    if (userModel.follower.isEmpty) {
      return [];
    }
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(userModel.uid).get();
    if (!userSnapshot.exists) {
      return [];
    }
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(COLLECTION_USERS).where(KEY_FOLLOWING, arrayContains: userModel.uid).limit(50).get();
    logger.d(querySnapshot.size);
    for (var element in querySnapshot.docs) {
      resultList.add(UserModel.fromSnapshot(element));
    }
    return resultList;
  }

  Future<List<UserModel>> getUserList(UserModel userModel) async {
    List<UserModel> resultList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(COLLECTION_USERS).where(KEY_PRIVATE, isEqualTo: false).where(KEY_UID, isNotEqualTo: userModel.uid).limit(50).get();
    for (var element in querySnapshot.docs) {
      if (element.get(KEY_UID) == userModel.uid) continue;
      resultList.add(UserModel.fromSnapshot(element));
    }
    resultList.sort((a, b) => b.follower.length.compareTo(a.follower.length));
    return resultList;
  }

  Future<String?> findUserWithNickname(String searchText) async {
    logger.d("findUserWithNickname");
    QuerySnapshot userSnapshot = await FirebaseFirestore.instance.collection(COLLECTION_USERS).where(KEY_NICKNAME, isEqualTo: searchText).get();
    if (userSnapshot.docs.isNotEmpty) {
      return userSnapshot.docs.first.id;
    } else {
      return null;
    }
  }

  Future inAppPurchase({required UserModel userModel, required PurchaseDetails purchaseDetails}) async {
    try {
      int count = int.parse(purchaseDetails.productID.split('_')[1]);
      DocumentReference purchaseRef = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(userModel.uid).collection(COLLECTION_PURCHASE).doc();
      PurchaseModel newPurchaseModel = PurchaseModel.newPurchase(userModel: userModel, purchaseDetails: purchaseDetails, docRef: purchaseRef);
      await purchaseRef.set(newPurchaseModel.toJson());
      pointNetworkRepository.sendPointHistory(pointNotiDTO: PointNotiDTO.gold(uid: userModel.uid, point: PointModel(gold: count), description: '골드 구매', routes: '', type: PointType.buyGold.name));
      //충전했으면 transaction으로 user점수도 올려주고,
      //point_history도 올려주고!
      showToast('${purchaseDetails.productID} 구매가 완료 되었습니다.');
    } catch (e) {
      showToast('오류가 발생하였습니다.');
    }

    return;
  }

  Future blockUser(UserModel myUserModel, String otherUserUid) async {
    DocumentReference myUserRef = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(myUserModel.uid);
    DocumentSnapshot myUserSnapshot = await myUserRef.get();
    DocumentReference otherUserRef = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(otherUserUid);
    DocumentSnapshot otherUserSnapshot = await otherUserRef.get();
    if (myUserSnapshot.exists && otherUserSnapshot.exists) {
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        myUserRef.update({
          KEY_BLOCKINGUSERS: FieldValue.arrayUnion([otherUserUid])
        });
        otherUserRef.update({
          KEY_BLOCKEDUSERS: FieldValue.arrayUnion([myUserModel.uid])
        });
      });
    } else {
      showToast('존재하지 않는 사용자입니다.\n관리자에 문의하세요 code:104'.tr);
      return;
    }
  }

  Future<List<UserModel>> queryUserList(
    String queryText,
  ) async {
    AlgoliaQuery query = AlgoliaService.algolia.instance.index('USER').query(queryText);
    // Perform multiple facetFilters
    logger.d('query Text -> $queryText');

    AlgoliaQuerySnapshot snap = await query.getObjects();
    List<AlgoliaObjectSnapshot> hits = snap.hits;
    List<UserModel> items = [];
    for (var element in hits) {
      UserModel userModel = UserModel.fromAlgolia(
        element.data,
      );
      logger.d('element object id -> ${element.objectID}, ${userModel.nickname}');
      items.add(userModel);
    }
    logger.d(snap.toString());
    return items;
  }

  Future setInterest({required UserModel userModel, required List<String> tagList}) async {
    await FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(userModel.uid).update({KEY_INTEREST_TAGS: tagList});
  }

  Future withdrawId({
    required UserModel userModel,
  }) async {
    DocumentReference userRef = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(userModel.uid);
    DocumentReference withdrawalRef = FirebaseFirestore.instance.collection(COLLECTION_WITHDRAWALS).doc(userModel.uid);
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      withdrawalRef.set(userModel.toJson(isDetail: true));
      userRef.delete();
      /* var newModel = userModel;newModel.deleted = true;
      userRef.update(newModel.toJson());*/
    });
    return;
  }

  Future givePointLinkMatjip({required String makerUid}) async {
    ///포인트만 올려주는 함수임, 제대로 하려면 Noti랑 History 함께 만들어야 함
    PointModel? givePoint = Get.find<RemoteConfigService>().points.linkMatjip;
    logger.d('givePoint : $givePoint');
    DocumentReference userRef = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(makerUid);
    DocumentSnapshot userSnapShot = await userRef.get();
    if (!userSnapShot.exists) {
      return logger.e('유저가 없습니다.');
    }
    userRef.update({
      KEY_UPDATE: Timestamp.now(),
      KEY_EXPERIENCE_POINT: FieldValue.increment(givePoint?.xp ?? 0),
      KEY_GOLD_POINT: FieldValue.increment(givePoint?.gold ?? 0),
      KEY_DIAMOND_POINT: FieldValue.increment(givePoint?.diamond ?? 0),
    });
    return;
  }

  Future recordSaveTime({required String uid, required int saveTime}) async {
    DocumentReference userRef = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(uid);
    DocumentSnapshot userSnapShot = await userRef.get();
    if (!userSnapShot.exists) {
      return logger.e('유저가 없습니다.');
    }
    userRef.update({KEY_UPDATE: Timestamp.now(), KEY_LAST_TIME_DB_SAVE: saveTime});
    return;
  }
}

UserNetworkRepository userNetworkRepository = UserNetworkRepository();
