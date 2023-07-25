import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matjipmemo/constants/firestore_keys.dart';
import 'package:matjipmemo/models/base/post.dart';
import 'package:matjipmemo/models/base/writer.dart';
import 'package:matjipmemo/models/firebase/moim_model.dart';
import 'package:matjipmemo/models/firebase/user_model.dart';

//
class BoardModel {
  Timestamp created;
  Timestamp update;
  Writer writer;
  Post post;
  String boardType;
  String contents;
  String moimUid;
  String title;
  List<dynamic> imageUrls; //일단 활성화 시킨 후에 수정하자
  List<dynamic> listOfLikes;
  List<dynamic> listOfComment;
  String boardId = '';
  int boardIdx = 0;
  bool delete = false; //이거는 앱 내에서만 작동시키는 거..! // 다른 것에서 불러오거나 만들지 말기,
  DocumentReference reference;

  BoardModel({
    required this.created,
    required this.update,
    required this.boardType,
    required this.contents,
    required this.moimUid,
    required this.title,
    required this.imageUrls,
    required this.listOfLikes,
    required this.listOfComment,
    required this.boardId,
    required this.boardIdx,
    required this.delete,
    required this.writer,
    required this.post,
    required this.reference,
  });

  BoardModel.fromMap(Map<String, dynamic> map, {required this.reference})
      : created = map[KEY_CREATED],
        update = map[KEY_UPDATE],
        boardType = map[SUBKEY_BOARD_TYPE],
        title = map[KEY_TITLE],
        contents = map[KEY_CONTENTS],
        listOfLikes = map[KEY_LISTOFLIKES] ?? [],
        imageUrls = map[KEY_IMGURL] ?? [],
        moimUid = map[KEY_MOIM_UID],
        //already constructed!
        listOfComment = map[KEY_LISTOFCOMMENT] ?? [],
        writer = Writer.fromJson(map),
        post = Post.fromJson(map),
        boardId = map[KEY_BOARD_ID],
        boardIdx = map[KEY_BOARD_IDX];

  BoardModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>, //원래 snapshot!.data() 인데 오류떠서 바꿈
            reference: snapshot.reference);

  BoardModel copyWith({
    Timestamp? created,
    Timestamp? update,
    String? boardType,
    String? contents,
    String? makerUid,
    String? moimUid,
    String? title,
    String? writerImg,
    List<dynamic>? imageUrls, //일단 활성화 시킨 후에 수정하자
    List<dynamic>? listOfLikes,
    List<dynamic>? listOfComment,
    String? makerName,
    String? boardId,
    int? boardIdx,
    bool? delete, //이거는 앱 내에서만 작동시키는 거..! // 다른 것에서 불러오거나 만들지 말기,
    Writer? writer,
    Post? post,
  }) {
    return BoardModel(
      created: created ?? this.created,
      update: update ?? this.update,
      boardType: boardType ?? this.boardType,
      contents: contents ?? this.contents,
      moimUid: moimUid ?? this.moimUid,
      title: title ?? this.title,
      imageUrls: imageUrls ?? this.imageUrls,
      listOfLikes: listOfLikes ?? this.listOfLikes,
      listOfComment: listOfComment ?? this.listOfComment,
      boardId: boardId ?? this.boardId,
      boardIdx: boardIdx ?? this.boardIdx,
      delete: delete ?? this.delete,
      writer: writer ?? this.writer,
      post: post ?? this.post,
      reference: reference,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map[KEY_CREATED] = created;
    map[KEY_UPDATE] = update;
    map[SUBKEY_BOARD_TYPE] = boardType;
    map[KEY_TITLE] = title;
    map[KEY_CONTENTS] = contents;
    map[KEY_LISTOFLIKES] = listOfLikes;
    map[KEY_IMGURLS] = imageUrls;
    map[KEY_MOIM_UID] = moimUid;
    map[KEY_LISTOFCOMMENT] = listOfComment;
    map[KEY_BOARD_ID] = boardId;
    map[KEY_BOARD_IDX] = boardIdx;
    map.addAll(writer.toJson());
    map.addAll(post.toJson());
    return map;
  }

  factory BoardModel.newForMoim({required UserModel writerUser, required MoimModel moimModel, required String boardType, required num boardIdx, required String title, required String contents}) {
    Timestamp nowTime = Timestamp.now();
    Map<String, dynamic> map = {};
    DocumentReference boardRef = FirebaseFirestore.instance.collection(COLLECTION_MOIMS).doc(moimModel.moimUid).collection(COLLECTION_BOARDS).doc();
    map[KEY_CREATED] = nowTime;
    map[KEY_UPDATE] = nowTime;
    map[SUBKEY_BOARD_TYPE] = boardType;
    map[KEY_BOARD_IDX] = boardIdx;
    map[KEY_TITLE] = title;
    map[KEY_CONTENTS] = contents;
    map[KEY_LISTOFLIKES] = [];
    map[KEY_IMGURLS] = [];
    map[KEY_MOIM_UID] = moimModel.moimUid;
    map[KEY_LISTOFCOMMENT] = [];
    map[KEY_BOARD_ID] = boardRef.id;
    map.addAll(writerUser.toWriter().toJson());

    return BoardModel.fromMap(map, reference: boardRef);
  }

  @override
  String toString() {
    return 'BoardModel{update: $update, moimUid: $moimUid, imageUrls: $imageUrls, reference: $reference}';
  }

/*  @override
  String toString() {
    return 'BoardModel{writer: $writer, post: $post, contents: $contents, boardIdx: $boardIdx}';
  }*/
}
