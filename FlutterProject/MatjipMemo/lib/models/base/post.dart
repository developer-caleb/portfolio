import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:matjipmemo/constants/firestore_keys.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  Post._();
  factory Post({
    @Default([]) @JsonKey(name: KEY_LISTOFLIKES) List<dynamic> listOfLikes,
    @Default([]) @JsonKey(name: KEY_LISTOFCOMMENT) List<dynamic> listOfComment,
    @Default(0) @JsonKey(name: KEY_COUNTLIKES) int countLikes,
    @Default(0) @JsonKey(name: KEY_COUNTCOMMENTS) int countComments,
    @Default(false) @JsonKey(name: KEY_INVISIBLE) bool invisible,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
