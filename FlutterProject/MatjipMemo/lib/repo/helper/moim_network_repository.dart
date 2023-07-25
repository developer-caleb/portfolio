import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:matjipmemo/constants/firestore_keys.dart';
import 'package:matjipmemo/controller/login_controller.dart';
import 'package:matjipmemo/models/firebase/board_model.dart';
import 'package:matjipmemo/models/firebase/comment_model.dart';
import 'package:matjipmemo/models/firebase/matjip_model.dart';
import 'package:matjipmemo/models/firebase/moim_chat_model.dart';
import 'package:matjipmemo/models/firebase/moim_model.dart';
import 'package:matjipmemo/models/firebase/user_model.dart';
import 'package:matjipmemo/tools/enums.dart';
import 'package:matjipmemo/tools/logger.dart';

import 'helper/transformers.dart';

class MoimNetworkRepository with Transformers {
  static final MoimNetworkRepository _moimNetworkRepository = MoimNetworkRepository._internal();

  factory MoimNetworkRepository() => _moimNetworkRepository;

  MoimNetworkRepository._internal();

  Future<DocumentReference> makeNewMoim(
    MoimModel moimModel,
  ) async {
    DocumentReference moimRef = FirebaseFirestore.instance.collection(COLLECTION_MOIMS).doc();
    DocumentReference userRef = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(moimModel.leaderUid);
    MoimModel inputModel = moimModel;
    inputModel.moimUid = moimRef.id;
    logger.d('makeNewMoim');
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(moimRef, moimModel.toJson(), SetOptions(merge: true));
      transaction.update(userRef, {
        KEY_MOIMS: FieldValue.arrayUnion([moimRef.id])
      });
    });
    Get.find<LoginController>().userModel?.moims.add(moimRef.id);
    return moimRef;
  }

  Future joinMoim(MoimModel moimModel, UserModel userModel) async {
    DocumentReference moimRef = FirebaseFirestore.instance.collection(COLLECTION_MOIMS).doc(moimModel.moimUid);
    DocumentReference userRef = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(userModel.uid);
    //모임에 있는 사람에게 알림 보내기 //메시지 보내게 되면 굳이 안올려도 될 듯?
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(moimRef, {KEY_MEMBERNUM: FieldValue.increment(1)});
      transaction.update(userRef, {
        KEY_MOIMS: FieldValue.arrayUnion([moimModel.moimUid])
      });
    });
    Get.find<LoginController>().userModel?.moims.add(moimModel.moimUid); //220502에 만듬
    logger.d('joinMoim');
    return;
  }

  Future quitMoim(MoimModel moimModel, UserModel userModel) async {
    DocumentReference moimRef = FirebaseFirestore.instance.collection(COLLECTION_MOIMS).doc(moimModel.moimUid);
    DocumentReference userRef = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(userModel.uid);
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(moimRef, {KEY_MEMBERNUM: FieldValue.increment(-1)});
      transaction.update(userRef, {
        KEY_MOIMS: FieldValue.arrayRemove([moimModel.moimUid])
      });
    });
    Get.find<LoginController>().userModel?.moims.remove(moimModel.moimUid);
    logger.d('quitMoim');
    return;
  }

  Future updateMoim(MoimModel moimModel, {String? moimUid}) async {
    DocumentReference moimRef = FirebaseFirestore.instance.collection(COLLECTION_MOIMS).doc(moimModel.moimUid);
    await moimRef.update(
      moimModel.toJson(),
    );
    return;
  }

  Future<List<MoimModel>> getMyMoimList(UserModel? userModel) async {
    if (userModel == null) {
      return [];
    }
    List<MoimModel> resultList = [];
    if (userModel.moims.isNotEmpty) {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(COLLECTION_MOIMS).where(KEY_MOIM_UID, whereIn: userModel.moims).get();
      for (var element in querySnapshot.docs) {
        resultList.add(MoimModel.fromSnapshot(element));
      }
    }
    logger.d('getMyMoimList -> ' + resultList.length.toString());
    return resultList;
  }

  Future<MoimModel?> getMoim({required String moim}) async {
    MoimModel? result;
    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance.collection(COLLECTION_MOIMS).doc(moim).get();
    if (docSnapshot.exists) {
      result = MoimModel.fromSnapshot(docSnapshot);
    }
    return result;
  }

  Future<List<MoimModel>> getMoimList(UserModel? userModel, {required QueryType queryType, int count = 15, DocumentReference? lastRef}) async {
    if (queryType == QueryType.my) {
      return getMyMoimList(userModel);
    }
    if (queryType == QueryType.unknown) {
      logger.e('queryType == QueryType.unknown');
      return [];
    }
    Query query = FirebaseFirestore.instance.collection(COLLECTION_MOIMS);
    query = query
        .orderBy(queryType == QueryType.recent ? KEY_CREATED : KEY_MEMBERNUM, descending: true)
        .where(KEY_DELETED, isEqualTo: false)
        .where(KEY_BANNED, isEqualTo: false)
        .where(KEY_USER_LOCATION_CODE, isEqualTo: Get.locale?.countryCode ?? 'US');
    if (lastRef != null) {
      query = query.startAfterDocument(await lastRef.get());
    }
    query = query.limit(count);
    QuerySnapshot querySnapshot = await query.get();
    // for (var element in querySnapshot.docs) {
    //   // if (userModel != null) {
    //   //   if (userModel.moims.contains(element.get(KEY_MOIM_UID))) {
    //   //     continue;
    /// 원래는 내가 있던 모임은 숨기기 하려고 했는데,
    /// 리스트를 너무 많이 가져와야하는 문제가 생겨버림
    //   //   }
    //   // }
    //   // logger.d('getMoimList $queryType -> ' + element.data().toString());
    //   resultList.add(MoimModel.fromSnapshot(element));
    // }
    logger.d('getMoimList $queryType -> ' + querySnapshot.docs.length.toString());
    return querySnapshot.docs.map((e) => MoimModel.fromSnapshot(e)).toList();
  }

  Future getAllMoimList() async {
    Query query = FirebaseFirestore.instance.collection(COLLECTION_MOIMS);
    query = query.orderBy(KEY_MEMBERNUM, descending: true).where(KEY_DELETED, isEqualTo: false).where(KEY_BANNED, isEqualTo: false).limit(30);
    QuerySnapshot querySnapshot = await query.get();
    return querySnapshot.docs.map((e) => MoimModel.fromSnapshot(e)).toList();
  }

  Future sendMoimChat({
    required MoimChatModel moimChatModel,
  }) async {
    DocumentReference chatRef = FirebaseFirestore.instance.collection(COLLECTION_MOIMS).doc(moimChatModel.moimUid).collection(COLLECTION_CHATS).doc();
    DocumentReference moimRef = FirebaseFirestore.instance.collection(COLLECTION_MOIMS).doc(moimChatModel.moimUid);
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(
        chatRef,
        moimChatModel.toJson(),
      );
      transaction.update(moimRef, {KEY_LAST_CHAT_ID: chatRef.id});
    });

    return;
  }

  Future<List<MoimChatModel>> getMoimChatList(MoimModel moimModel, {DocumentReference? lastRef}) async {
    logger.d('getMoimChatList 실행 ${lastRef == null}');
    List<MoimChatModel> resultList = [];
    Query moimQuery = FirebaseFirestore.instance.collection(COLLECTION_MOIMS).doc(moimModel.moimUid).collection(COLLECTION_CHATS).orderBy(KEY_CREATED, descending: true);
    if (lastRef != null) {
      moimQuery = moimQuery.endBeforeDocument(await lastRef.get());
    }
    QuerySnapshot querySnapshot = await moimQuery.limit(50).get();
    logger.d('getMoimChatList size-> ${querySnapshot.size}');
    for (var element in querySnapshot.docs) {
      logger.d('getMoimChatList -> ' + element.data().toString());
      resultList.add(MoimChatModel.fromSnapshot(element));
    }
    return resultList;
  }

  Future deleteMoim(MoimModel moimModel, UserModel userModel) async {
    DocumentReference moimRef = FirebaseFirestore.instance.collection(COLLECTION_MOIMS).doc(moimModel.moimUid);
    DocumentReference userRef = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(userModel.uid);
    //모든 유저 ref에서 삭제해야함...
    //QuerySnapshot userQuery =await FirebaseFirestore.instance.collection(COLLECTION_USERS).where(KEY_MOIMS, arrayContains: moimModel.moimUid).get();
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(moimRef, {KEY_DELETED: true});
      transaction.update(userRef, {
        KEY_MOIMS: FieldValue.arrayRemove([moimRef.id])
      });
    });
    /*DocumentReference userRef = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(moimModel.leaderUid);
    UserModel? usermodel = Get.find<LoginController>().userModel;
    userRef.set(usermodel!.toJson());
    print('삭제 완료');*/
    await Future.delayed(const Duration(milliseconds: 500));
    return;
  }

  Future<List<UserModel>> getMoimMemberList(MoimModel moimModel, UserModel? myUserModel) async {
    List<UserModel> resultList = [];
    CollectionReference userQuery = FirebaseFirestore.instance.collection(COLLECTION_USERS);

    //나 가져오기
    if (myUserModel != null) {
      if (myUserModel.moims.contains(moimModel.moimUid)) {
        resultList.add(myUserModel);
      }
    }
    //모임장 가져오기
    if (moimModel.leaderUid != myUserModel?.uid) {
      DocumentSnapshot leaderQuerySnapshot = await userQuery.doc(moimModel.leaderUid).get();
      resultList.add(UserModel.fromSnapshot(leaderQuerySnapshot));
    }
    //운영진 가져오기
    //일반회원 가져오기
    QuerySnapshot memberQuerySnapshot = await userQuery.where(KEY_MOIMS, arrayContains: moimModel.moimUid).limit(30).get();
    logger.d('getMoimMemberList size-> ${memberQuerySnapshot.size}');
    for (var element in memberQuerySnapshot.docs) {
      logger.d('getMoimMemberList -> ' + element.data().toString());
      UserModel userModel = UserModel.fromSnapshot(element);
      if (userModel.uid != moimModel.leaderUid && !moimModel.subLeaders.contains(userModel.uid) && !(myUserModel?.uid == userModel.uid)) {
        resultList.add(userModel);
      }
    }
    return resultList;
  }

  Stream<MoimModel> getMoimModelStream(
    String moimId,
  ) {
    return FirebaseFirestore.instance.collection(COLLECTION_MOIMS).doc(moimId).snapshots().transform(toMoim);
  }

  Future<MatjipModel> matjipLike({required MatjipModel matjipModel, required UserModel userModel, required MoimModel moimModel, required bool like //true -> like, false unlike
      }) async {
    logger.d('likeMatjipModel');
    DocumentReference matjipRef = FirebaseFirestore.instance.collection(COLLECTION_MOIMS).doc(moimModel.moimUid).collection(COLLECTION_MATJIP).doc(matjipModel.matjipId);
    DocumentSnapshot matjipSnapshot = await matjipRef.get();
    if (matjipSnapshot.exists) {
      if (like) {
        await matjipRef.update({
          KEY_LISTOFLIKES: FieldValue.arrayUnion([userModel.uid]),
          KEY_COUNTLIKES: FieldValue.increment(1)
        });
      } else {
        await matjipRef.update({
          KEY_LISTOFLIKES: FieldValue.arrayRemove([userModel.uid]),
          KEY_COUNTLIKES: FieldValue.increment(-1)
        });
      }
      DocumentSnapshot newBoardSnapshot = await matjipRef.get();
      return MatjipModel.fromSnapshot(newBoardSnapshot);
    } else {
      return matjipModel;
    }
  }

  Future<CommentModel?> createNewCommentWithBoard(String text, {required BoardModel boardModel, required UserModel userModel, ParentsComment? parentsComment}) async {
    DocumentReference boardRef = FirebaseFirestore.instance.collection(COLLECTION_MOIMS).doc(boardModel.moimUid).collection(COLLECTION_BOARDS).doc(boardModel.boardId);
    if (parentsComment != null) {
      boardRef = boardRef.collection(COLLECTION_COMMENTS).doc(parentsComment.commentUid);
    }
    DocumentReference commentRef = boardRef.collection(COLLECTION_COMMENTS).doc();
    Map<String, dynamic> commentData = CommentModel.addNewComment(commentRef.id, userModel: userModel, text: text);
    DocumentSnapshot boardSnapshot = await boardRef.get();
    if (!boardSnapshot.exists) {
      return null;
    }
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(commentRef, commentData);
      transaction.update(boardRef, {
        KEY_LISTOFCOMMENT: FieldValue.arrayUnion([commentRef.id])
      });
    });
    return CommentModel.fromJson(commentData, reference: commentRef);
  }

  //Deprecated 22.12.01 CommentRepository에서 해결!
  /* Future<CommentModel?> createNewCommentWithMatjip(String text,
      {required MatjipModel matjipModel,
      required UserModel userModel,
      required MoimModel moimModel,
      ParentsComment? parentsComment}) async {
    DocumentReference boardRef = FirebaseFirestore.instance
        .collection(COLLECTION_MOIMS)
        .doc(moimModel.moimUid)
        .collection(COLLECTION_MATJIP)
        .doc(matjipModel.matjipId);
    if (parentsComment != null) {
      boardRef = boardRef
          .collection(COLLECTION_COMMENTS)
          .doc(parentsComment.commentUid);
    }
    DocumentReference commentRef =
        boardRef.collection(COLLECTION_COMMENTS).doc();
    Map<String, dynamic> commentData = CommentModel.addNewComment(
      commentRef.id,
      userModel: userModel,
      text: text,
    );
    DocumentSnapshot boardSnapshot = await boardRef.get();
    if (!boardSnapshot.exists) {
      return null;
    }
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(commentRef, commentData);
      transaction.update(boardRef, {
        KEY_LISTOFCOMMENT: FieldValue.arrayUnion([commentRef.id])
      });
    });
    return CommentModel.fromMap(commentData);
  }*/

  Future deleteBoardComment({required BoardModel boardModel, required CommentModel commentModel, ParentsComment? parentsComent}) async {
    DocumentReference boardRef = FirebaseFirestore.instance.collection(COLLECTION_MOIMS).doc(boardModel.moimUid).collection(COLLECTION_BOARDS).doc(boardModel.boardId);
    if (parentsComent != null) {
      boardRef = boardRef.collection(COLLECTION_COMMENTS).doc(parentsComent.commentUid);
    }
    DocumentReference commentRef = boardRef.collection(COLLECTION_COMMENTS).doc(commentModel.commentId);

    DocumentSnapshot commentSnapshot = await commentRef.get();
    if (!commentSnapshot.exists) {
      return null;
    }
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.delete(commentRef);
      transaction.update(boardRef, {
        KEY_LISTOFCOMMENT: FieldValue.arrayRemove([commentRef.id])
      });
    });

    return;
  }

  Future deleteMatjipComment({required MatjipModel matjipModel, required MoimModel moimModel, required CommentModel commentModel, ParentsComment? parentsComment}) async {
    DocumentReference matjipRef = FirebaseFirestore.instance.collection(COLLECTION_MOIMS).doc(moimModel.moimUid).collection(COLLECTION_MATJIP).doc(matjipModel.matjipId);
    if (parentsComment != null) {
      matjipRef = matjipRef.collection(COLLECTION_COMMENTS).doc(parentsComment.commentUid);
    }
    DocumentReference commentRef = matjipRef.collection(COLLECTION_COMMENTS).doc(commentModel.commentId);

    DocumentSnapshot commentSnapshot = await commentRef.get();
    if (!commentSnapshot.exists) {
      return null;
    }
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.delete(commentRef);
      transaction.update(matjipRef, {
        KEY_LISTOFCOMMENT: FieldValue.arrayRemove([commentRef.id])
      });
    });

    return;
  }

  Future<List<CommentModel>> loadBoardCoCommentList({required CommentModel boardCommentModel, required BoardModel boardModel}) async {
    logger.d("read CoComent List() loaded!^^");
    List<CommentModel> resultList = [];
    //최신 200개 가져오기
    var query = FirebaseFirestore.instance
        .collection(COLLECTION_MOIMS)
        .doc(boardModel.moimUid)
        .collection(COLLECTION_BOARDS)
        .doc(boardModel.boardId)
        .collection(COLLECTION_COMMENTS)
        .doc(boardCommentModel.commentId)
        .collection(COLLECTION_COMMENTS)
        .orderBy(KEY_BUNDLE_ID, descending: true);

    await query.limit(200).get().then((QuerySnapshot querySnapshot) {
      logger.d("comment 갯수 ${querySnapshot.size}");
      for (int i = 0; i < querySnapshot.size; i++) {
        //logger.d("read Notifications List doc ->" + CommentModel.fromSnapshot(querySnapshot.docs[i]).toString());
        resultList.add(CommentModel.fromSnapshot(querySnapshot.docs[i]));
      }
    });
    return resultList;
  }

  Future<List<CommentModel>> loadMatjipCoCommentList({required CommentModel matjipCommentModel, required MoimModel moimModel}) async {
    logger.d("read CoComent List() loaded!^^");
    List<CommentModel> resultList = [];
    //최신 200개 가져오기
    var query = matjipCommentModel.docRef.collection(COLLECTION_COMMENTS).orderBy(KEY_BUNDLE_ID, descending: true);
    await query.limit(200).get().then((QuerySnapshot querySnapshot) {
      logger.d("comment 갯수 ${querySnapshot.size}");
      for (int i = 0; i < querySnapshot.size; i++) {
        resultList.add(CommentModel.fromSnapshot(querySnapshot.docs[i]));
      }
    });
    return resultList;
  }

  Future<List<CommentModel>> getBoardCommentList(
    BoardModel boardModel,
  ) async {
    List<CommentModel> commentList = [];
    QuerySnapshot commentSnapshot = await FirebaseFirestore.instance
        .collection(COLLECTION_MOIMS)
        .doc(boardModel.moimUid)
        .collection(COLLECTION_BOARDS)
        .doc(boardModel.boardId)
        .collection(COLLECTION_COMMENTS)
        .orderBy(KEY_CREATED, descending: true)
        .get();
    for (var element in commentSnapshot.docs) {
      commentList.add(CommentModel.fromSnapshot(element));
    }
    return commentList;
  }

  Future<List<CommentModel>> getMatjipCommentList(MatjipModel matjipModel, {required MoimModel moimModel}) async {
    List<CommentModel> commentList = [];
    QuerySnapshot commentSnapshot = await FirebaseFirestore.instance
        .collection(COLLECTION_MOIMS)
        .doc(moimModel.moimUid)
        .collection(COLLECTION_MATJIP)
        .doc(matjipModel.matjipId)
        .collection(COLLECTION_COMMENTS)
        .orderBy(KEY_CREATED, descending: true)
        .get();
    for (var element in commentSnapshot.docs) {
      commentList.add(CommentModel.fromSnapshot(element));
    }
    return commentList;
  }

  Future<List<MatjipModel>> getMoimMatjipList(MoimModel moimModel) async {
    List<MatjipModel> matjipLIst = [];
    QuerySnapshot matjipSnapshot =
        await FirebaseFirestore.instance.collection(COLLECTION_MOIMS).doc(moimModel.moimUid).collection(COLLECTION_MATJIP).orderBy(KEY_CREATED, descending: true).limit(70).get();
    logger.d('getMoimMatjipList size -> ${matjipSnapshot.size}');
    for (var element in matjipSnapshot.docs) {
      matjipLIst.add(MatjipModel.fromSnapshot(element));
    }
    return matjipLIst;
  }

  Future deleteMoimMatjip({required MatjipModel matjipModel, required MoimModel moimModel}) async {
    if (matjipModel.reference == null || moimModel.reference == null) {
      return logger.e('오류 : reference 없음 ${matjipModel.reference}, ${moimModel.reference}');
    }
    DocumentReference matjipRef = FirebaseFirestore.instance.collection(COLLECTION_MATJIP).doc(matjipModel.matjipId);
    DocumentReference moimMatjipRef = matjipModel.reference!;
    DocumentSnapshot matjipSnapshot = await matjipRef.get();
    DocumentSnapshot moimMatjipSnapshot = await moimMatjipRef.get();
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      if (matjipSnapshot.exists) {
        transaction.update(matjipRef, {
          KEY_SHARED_MOIM: FieldValue.arrayRemove([moimModel.moimUid])
        });
      }
      if (moimMatjipSnapshot.exists) {
        transaction.delete(moimMatjipRef);
      }
    });

    return;
  }

  Future uploadMoimMatjip({required List<MatjipModel> matjipList, required MoimModel moimModel}) async {
    DocumentReference moimRef = FirebaseFirestore.instance.collection(COLLECTION_MOIMS).doc(moimModel.moimUid);
    CollectionReference collectionRef = FirebaseFirestore.instance.collection(COLLECTION_MOIMS).doc(moimModel.moimUid).collection(COLLECTION_MATJIP);
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(moimRef, {KEY_MATJIP_COUNT: FieldValue.increment(matjipList.length)});
      for (MatjipModel element in matjipList) {
        transaction.set(collectionRef.doc(element.matjipId), element.toNewPost().toJson());
        transaction.update(element.reference!, {
          KEY_SHARED_MOIM: FieldValue.arrayUnion([moimModel.moimUid])
        });
      }
    });
    //transaction 실행
    //subcollection에 추가하기
    //matjip SharedMoim 에  추가하기
    return;
  }
}

MoimNetworkRepository moimNetworkRepository = MoimNetworkRepository();
