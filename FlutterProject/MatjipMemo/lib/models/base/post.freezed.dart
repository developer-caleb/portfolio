// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  @JsonKey(name: KEY_LISTOFLIKES)
  List<dynamic> get listOfLikes => throw _privateConstructorUsedError;
  @JsonKey(name: KEY_LISTOFCOMMENT)
  List<dynamic> get listOfComment => throw _privateConstructorUsedError;
  @JsonKey(name: KEY_COUNTLIKES)
  int get countLikes => throw _privateConstructorUsedError;
  @JsonKey(name: KEY_COUNTCOMMENTS)
  int get countComments => throw _privateConstructorUsedError;
  @JsonKey(name: KEY_INVISIBLE)
  bool get invisible => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {@JsonKey(name: KEY_LISTOFLIKES) List<dynamic> listOfLikes,
      @JsonKey(name: KEY_LISTOFCOMMENT) List<dynamic> listOfComment,
      @JsonKey(name: KEY_COUNTLIKES) int countLikes,
      @JsonKey(name: KEY_COUNTCOMMENTS) int countComments,
      @JsonKey(name: KEY_INVISIBLE) bool invisible});
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listOfLikes = null,
    Object? listOfComment = null,
    Object? countLikes = null,
    Object? countComments = null,
    Object? invisible = null,
  }) {
    return _then(_value.copyWith(
      listOfLikes: null == listOfLikes
          ? _value.listOfLikes
          : listOfLikes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      listOfComment: null == listOfComment
          ? _value.listOfComment
          : listOfComment // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      countLikes: null == countLikes
          ? _value.countLikes
          : countLikes // ignore: cast_nullable_to_non_nullable
              as int,
      countComments: null == countComments
          ? _value.countComments
          : countComments // ignore: cast_nullable_to_non_nullable
              as int,
      invisible: null == invisible
          ? _value.invisible
          : invisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$_PostCopyWith(_$_Post value, $Res Function(_$_Post) then) =
      __$$_PostCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: KEY_LISTOFLIKES) List<dynamic> listOfLikes,
      @JsonKey(name: KEY_LISTOFCOMMENT) List<dynamic> listOfComment,
      @JsonKey(name: KEY_COUNTLIKES) int countLikes,
      @JsonKey(name: KEY_COUNTCOMMENTS) int countComments,
      @JsonKey(name: KEY_INVISIBLE) bool invisible});
}

/// @nodoc
class __$$_PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res, _$_Post>
    implements _$$_PostCopyWith<$Res> {
  __$$_PostCopyWithImpl(_$_Post _value, $Res Function(_$_Post) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listOfLikes = null,
    Object? listOfComment = null,
    Object? countLikes = null,
    Object? countComments = null,
    Object? invisible = null,
  }) {
    return _then(_$_Post(
      listOfLikes: null == listOfLikes
          ? _value._listOfLikes
          : listOfLikes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      listOfComment: null == listOfComment
          ? _value._listOfComment
          : listOfComment // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      countLikes: null == countLikes
          ? _value.countLikes
          : countLikes // ignore: cast_nullable_to_non_nullable
              as int,
      countComments: null == countComments
          ? _value.countComments
          : countComments // ignore: cast_nullable_to_non_nullable
              as int,
      invisible: null == invisible
          ? _value.invisible
          : invisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Post extends _Post {
  _$_Post(
      {@JsonKey(name: KEY_LISTOFLIKES)
          final List<dynamic> listOfLikes = const [],
      @JsonKey(name: KEY_LISTOFCOMMENT)
          final List<dynamic> listOfComment = const [],
      @JsonKey(name: KEY_COUNTLIKES)
          this.countLikes = 0,
      @JsonKey(name: KEY_COUNTCOMMENTS)
          this.countComments = 0,
      @JsonKey(name: KEY_INVISIBLE)
          this.invisible = false})
      : _listOfLikes = listOfLikes,
        _listOfComment = listOfComment,
        super._();

  factory _$_Post.fromJson(Map<String, dynamic> json) => _$$_PostFromJson(json);

  final List<dynamic> _listOfLikes;
  @override
  @JsonKey(name: KEY_LISTOFLIKES)
  List<dynamic> get listOfLikes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfLikes);
  }

  final List<dynamic> _listOfComment;
  @override
  @JsonKey(name: KEY_LISTOFCOMMENT)
  List<dynamic> get listOfComment {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfComment);
  }

  @override
  @JsonKey(name: KEY_COUNTLIKES)
  final int countLikes;
  @override
  @JsonKey(name: KEY_COUNTCOMMENTS)
  final int countComments;
  @override
  @JsonKey(name: KEY_INVISIBLE)
  final bool invisible;

  @override
  String toString() {
    return 'Post(listOfLikes: $listOfLikes, listOfComment: $listOfComment, countLikes: $countLikes, countComments: $countComments, invisible: $invisible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Post &&
            const DeepCollectionEquality()
                .equals(other._listOfLikes, _listOfLikes) &&
            const DeepCollectionEquality()
                .equals(other._listOfComment, _listOfComment) &&
            (identical(other.countLikes, countLikes) ||
                other.countLikes == countLikes) &&
            (identical(other.countComments, countComments) ||
                other.countComments == countComments) &&
            (identical(other.invisible, invisible) ||
                other.invisible == invisible));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_listOfLikes),
      const DeepCollectionEquality().hash(_listOfComment),
      countLikes,
      countComments,
      invisible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostCopyWith<_$_Post> get copyWith =>
      __$$_PostCopyWithImpl<_$_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostToJson(
      this,
    );
  }
}

abstract class _Post extends Post {
  factory _Post(
      {@JsonKey(name: KEY_LISTOFLIKES) final List<dynamic> listOfLikes,
      @JsonKey(name: KEY_LISTOFCOMMENT) final List<dynamic> listOfComment,
      @JsonKey(name: KEY_COUNTLIKES) final int countLikes,
      @JsonKey(name: KEY_COUNTCOMMENTS) final int countComments,
      @JsonKey(name: KEY_INVISIBLE) final bool invisible}) = _$_Post;
  _Post._() : super._();

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  @JsonKey(name: KEY_LISTOFLIKES)
  List<dynamic> get listOfLikes;
  @override
  @JsonKey(name: KEY_LISTOFCOMMENT)
  List<dynamic> get listOfComment;
  @override
  @JsonKey(name: KEY_COUNTLIKES)
  int get countLikes;
  @override
  @JsonKey(name: KEY_COUNTCOMMENTS)
  int get countComments;
  @override
  @JsonKey(name: KEY_INVISIBLE)
  bool get invisible;
  @override
  @JsonKey(ignore: true)
  _$$_PostCopyWith<_$_Post> get copyWith => throw _privateConstructorUsedError;
}
