// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'volume_model_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VolumeModelRes _$VolumeModelResFromJson(Map<String, dynamic> json) {
  return _VolumeModelRes.fromJson(json);
}

/// @nodoc
mixin _$VolumeModelRes {
  int? get diaryVolumeSeq => throw _privateConstructorUsedError;
  int? get creatorSeq => throw _privateConstructorUsedError;
  List<Member>? get memberList => throw _privateConstructorUsedError;
  Map<String, Object?>? get groupingWriteDate =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VolumeModelResCopyWith<VolumeModelRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VolumeModelResCopyWith<$Res> {
  factory $VolumeModelResCopyWith(
          VolumeModelRes value, $Res Function(VolumeModelRes) then) =
      _$VolumeModelResCopyWithImpl<$Res>;
  $Res call(
      {int? diaryVolumeSeq,
      int? creatorSeq,
      List<Member>? memberList,
      Map<String, Object?>? groupingWriteDate});
}

/// @nodoc
class _$VolumeModelResCopyWithImpl<$Res>
    implements $VolumeModelResCopyWith<$Res> {
  _$VolumeModelResCopyWithImpl(this._value, this._then);

  final VolumeModelRes _value;
  // ignore: unused_field
  final $Res Function(VolumeModelRes) _then;

  @override
  $Res call({
    Object? diaryVolumeSeq = freezed,
    Object? creatorSeq = freezed,
    Object? memberList = freezed,
    Object? groupingWriteDate = freezed,
  }) {
    return _then(_value.copyWith(
      diaryVolumeSeq: diaryVolumeSeq == freezed
          ? _value.diaryVolumeSeq
          : diaryVolumeSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      creatorSeq: creatorSeq == freezed
          ? _value.creatorSeq
          : creatorSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      memberList: memberList == freezed
          ? _value.memberList
          : memberList // ignore: cast_nullable_to_non_nullable
              as List<Member>?,
      groupingWriteDate: groupingWriteDate == freezed
          ? _value.groupingWriteDate
          : groupingWriteDate // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
    ));
  }
}

/// @nodoc
abstract class _$$_VolumeModelResCopyWith<$Res>
    implements $VolumeModelResCopyWith<$Res> {
  factory _$$_VolumeModelResCopyWith(
          _$_VolumeModelRes value, $Res Function(_$_VolumeModelRes) then) =
      __$$_VolumeModelResCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? diaryVolumeSeq,
      int? creatorSeq,
      List<Member>? memberList,
      Map<String, Object?>? groupingWriteDate});
}

/// @nodoc
class __$$_VolumeModelResCopyWithImpl<$Res>
    extends _$VolumeModelResCopyWithImpl<$Res>
    implements _$$_VolumeModelResCopyWith<$Res> {
  __$$_VolumeModelResCopyWithImpl(
      _$_VolumeModelRes _value, $Res Function(_$_VolumeModelRes) _then)
      : super(_value, (v) => _then(v as _$_VolumeModelRes));

  @override
  _$_VolumeModelRes get _value => super._value as _$_VolumeModelRes;

  @override
  $Res call({
    Object? diaryVolumeSeq = freezed,
    Object? creatorSeq = freezed,
    Object? memberList = freezed,
    Object? groupingWriteDate = freezed,
  }) {
    return _then(_$_VolumeModelRes(
      diaryVolumeSeq: diaryVolumeSeq == freezed
          ? _value.diaryVolumeSeq
          : diaryVolumeSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      creatorSeq: creatorSeq == freezed
          ? _value.creatorSeq
          : creatorSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      memberList: memberList == freezed
          ? _value._memberList
          : memberList // ignore: cast_nullable_to_non_nullable
              as List<Member>?,
      groupingWriteDate: groupingWriteDate == freezed
          ? _value._groupingWriteDate
          : groupingWriteDate // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VolumeModelRes implements _VolumeModelRes {
  const _$_VolumeModelRes(
      {this.diaryVolumeSeq,
      this.creatorSeq,
      final List<Member>? memberList,
      final Map<String, Object?>? groupingWriteDate})
      : _memberList = memberList,
        _groupingWriteDate = groupingWriteDate;

  factory _$_VolumeModelRes.fromJson(Map<String, dynamic> json) =>
      _$$_VolumeModelResFromJson(json);

  @override
  final int? diaryVolumeSeq;
  @override
  final int? creatorSeq;
  final List<Member>? _memberList;
  @override
  List<Member>? get memberList {
    final value = _memberList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, Object?>? _groupingWriteDate;
  @override
  Map<String, Object?>? get groupingWriteDate {
    final value = _groupingWriteDate;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'VolumeModelRes(diaryVolumeSeq: $diaryVolumeSeq, creatorSeq: $creatorSeq, memberList: $memberList, groupingWriteDate: $groupingWriteDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VolumeModelRes &&
            const DeepCollectionEquality()
                .equals(other.diaryVolumeSeq, diaryVolumeSeq) &&
            const DeepCollectionEquality()
                .equals(other.creatorSeq, creatorSeq) &&
            const DeepCollectionEquality()
                .equals(other._memberList, _memberList) &&
            const DeepCollectionEquality()
                .equals(other._groupingWriteDate, _groupingWriteDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(diaryVolumeSeq),
      const DeepCollectionEquality().hash(creatorSeq),
      const DeepCollectionEquality().hash(_memberList),
      const DeepCollectionEquality().hash(_groupingWriteDate));

  @JsonKey(ignore: true)
  @override
  _$$_VolumeModelResCopyWith<_$_VolumeModelRes> get copyWith =>
      __$$_VolumeModelResCopyWithImpl<_$_VolumeModelRes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VolumeModelResToJson(this);
  }
}

abstract class _VolumeModelRes implements VolumeModelRes {
  const factory _VolumeModelRes(
      {final int? diaryVolumeSeq,
      final int? creatorSeq,
      final List<Member>? memberList,
      final Map<String, Object?>? groupingWriteDate}) = _$_VolumeModelRes;

  factory _VolumeModelRes.fromJson(Map<String, dynamic> json) =
      _$_VolumeModelRes.fromJson;

  @override
  int? get diaryVolumeSeq => throw _privateConstructorUsedError;
  @override
  int? get creatorSeq => throw _privateConstructorUsedError;
  @override
  List<Member>? get memberList => throw _privateConstructorUsedError;
  @override
  Map<String, Object?>? get groupingWriteDate =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_VolumeModelResCopyWith<_$_VolumeModelRes> get copyWith =>
      throw _privateConstructorUsedError;
}

Member _$MemberFromJson(Map<String, dynamic> json) {
  return _Member.fromJson(json);
}

/// @nodoc
mixin _$Member {
  int? get userSeq => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberCopyWith<Member> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberCopyWith<$Res> {
  factory $MemberCopyWith(Member value, $Res Function(Member) then) =
      _$MemberCopyWithImpl<$Res>;
  $Res call({int? userSeq, String? role});
}

/// @nodoc
class _$MemberCopyWithImpl<$Res> implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._value, this._then);

  final Member _value;
  // ignore: unused_field
  final $Res Function(Member) _then;

  @override
  $Res call({
    Object? userSeq = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      userSeq: userSeq == freezed
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_MemberCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$$_MemberCopyWith(_$_Member value, $Res Function(_$_Member) then) =
      __$$_MemberCopyWithImpl<$Res>;
  @override
  $Res call({int? userSeq, String? role});
}

/// @nodoc
class __$$_MemberCopyWithImpl<$Res> extends _$MemberCopyWithImpl<$Res>
    implements _$$_MemberCopyWith<$Res> {
  __$$_MemberCopyWithImpl(_$_Member _value, $Res Function(_$_Member) _then)
      : super(_value, (v) => _then(v as _$_Member));

  @override
  _$_Member get _value => super._value as _$_Member;

  @override
  $Res call({
    Object? userSeq = freezed,
    Object? role = freezed,
  }) {
    return _then(_$_Member(
      userSeq: userSeq == freezed
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Member implements _Member {
  const _$_Member({this.userSeq, this.role});

  factory _$_Member.fromJson(Map<String, dynamic> json) =>
      _$$_MemberFromJson(json);

  @override
  final int? userSeq;
  @override
  final String? role;

  @override
  String toString() {
    return 'Member(userSeq: $userSeq, role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Member &&
            const DeepCollectionEquality().equals(other.userSeq, userSeq) &&
            const DeepCollectionEquality().equals(other.role, role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userSeq),
      const DeepCollectionEquality().hash(role));

  @JsonKey(ignore: true)
  @override
  _$$_MemberCopyWith<_$_Member> get copyWith =>
      __$$_MemberCopyWithImpl<_$_Member>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemberToJson(this);
  }
}

abstract class _Member implements Member {
  const factory _Member({final int? userSeq, final String? role}) = _$_Member;

  factory _Member.fromJson(Map<String, dynamic> json) = _$_Member.fromJson;

  @override
  int? get userSeq => throw _privateConstructorUsedError;
  @override
  String? get role => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MemberCopyWith<_$_Member> get copyWith =>
      throw _privateConstructorUsedError;
}
