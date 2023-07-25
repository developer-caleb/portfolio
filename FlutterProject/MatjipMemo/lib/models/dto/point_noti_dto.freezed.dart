// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'point_noti_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PointNotiDTO _$PointNotiDTOFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'xp':
      return _PointNotiDTOXp.fromJson(json);
    case 'gold':
      return _PointNotiDTOGold.fromJson(json);
    case 'diamond':
      return _PointNotiDTODiamond.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'PointNotiDTO',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PointNotiDTO {
  String get uid => throw _privateConstructorUsedError;
  PointModel get point => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get routes => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get pointClass => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)
        xp,
    required TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)
        gold,
    required TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)
        diamond,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        xp,
    TResult? Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        gold,
    TResult? Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        diamond,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        xp,
    TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        gold,
    TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        diamond,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PointNotiDTOXp value) xp,
    required TResult Function(_PointNotiDTOGold value) gold,
    required TResult Function(_PointNotiDTODiamond value) diamond,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PointNotiDTOXp value)? xp,
    TResult? Function(_PointNotiDTOGold value)? gold,
    TResult? Function(_PointNotiDTODiamond value)? diamond,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PointNotiDTOXp value)? xp,
    TResult Function(_PointNotiDTOGold value)? gold,
    TResult Function(_PointNotiDTODiamond value)? diamond,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointNotiDTOCopyWith<PointNotiDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointNotiDTOCopyWith<$Res> {
  factory $PointNotiDTOCopyWith(
          PointNotiDTO value, $Res Function(PointNotiDTO) then) =
      _$PointNotiDTOCopyWithImpl<$Res, PointNotiDTO>;
  @useResult
  $Res call(
      {String uid,
      PointModel point,
      String description,
      String routes,
      String type,
      String pointClass});

  $PointModelCopyWith<$Res> get point;
}

/// @nodoc
class _$PointNotiDTOCopyWithImpl<$Res, $Val extends PointNotiDTO>
    implements $PointNotiDTOCopyWith<$Res> {
  _$PointNotiDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? point = null,
    Object? description = null,
    Object? routes = null,
    Object? type = null,
    Object? pointClass = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as PointModel,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      routes: null == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      pointClass: null == pointClass
          ? _value.pointClass
          : pointClass // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PointModelCopyWith<$Res> get point {
    return $PointModelCopyWith<$Res>(_value.point, (value) {
      return _then(_value.copyWith(point: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PointNotiDTOXpCopyWith<$Res>
    implements $PointNotiDTOCopyWith<$Res> {
  factory _$$_PointNotiDTOXpCopyWith(
          _$_PointNotiDTOXp value, $Res Function(_$_PointNotiDTOXp) then) =
      __$$_PointNotiDTOXpCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      PointModel point,
      String description,
      String routes,
      String type,
      String pointClass});

  @override
  $PointModelCopyWith<$Res> get point;
}

/// @nodoc
class __$$_PointNotiDTOXpCopyWithImpl<$Res>
    extends _$PointNotiDTOCopyWithImpl<$Res, _$_PointNotiDTOXp>
    implements _$$_PointNotiDTOXpCopyWith<$Res> {
  __$$_PointNotiDTOXpCopyWithImpl(
      _$_PointNotiDTOXp _value, $Res Function(_$_PointNotiDTOXp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? point = null,
    Object? description = null,
    Object? routes = null,
    Object? type = null,
    Object? pointClass = null,
  }) {
    return _then(_$_PointNotiDTOXp(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as PointModel,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      routes: null == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      pointClass: null == pointClass
          ? _value.pointClass
          : pointClass // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PointNotiDTOXp implements _PointNotiDTOXp {
  _$_PointNotiDTOXp(
      {required this.uid,
      required this.point,
      required this.description,
      required this.routes,
      required this.type,
      this.pointClass = 'xp',
      final String? $type})
      : $type = $type ?? 'xp';

  factory _$_PointNotiDTOXp.fromJson(Map<String, dynamic> json) =>
      _$$_PointNotiDTOXpFromJson(json);

  @override
  final String uid;
  @override
  final PointModel point;
  @override
  final String description;
  @override
  final String routes;
  @override
  final String type;
  @override
  @JsonKey()
  final String pointClass;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PointNotiDTO.xp(uid: $uid, point: $point, description: $description, routes: $routes, type: $type, pointClass: $pointClass)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PointNotiDTOXp &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.routes, routes) || other.routes == routes) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.pointClass, pointClass) ||
                other.pointClass == pointClass));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, point, description, routes, type, pointClass);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PointNotiDTOXpCopyWith<_$_PointNotiDTOXp> get copyWith =>
      __$$_PointNotiDTOXpCopyWithImpl<_$_PointNotiDTOXp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)
        xp,
    required TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)
        gold,
    required TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)
        diamond,
  }) {
    return xp(uid, point, description, routes, type, pointClass);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        xp,
    TResult? Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        gold,
    TResult? Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        diamond,
  }) {
    return xp?.call(uid, point, description, routes, type, pointClass);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        xp,
    TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        gold,
    TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        diamond,
    required TResult orElse(),
  }) {
    if (xp != null) {
      return xp(uid, point, description, routes, type, pointClass);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PointNotiDTOXp value) xp,
    required TResult Function(_PointNotiDTOGold value) gold,
    required TResult Function(_PointNotiDTODiamond value) diamond,
  }) {
    return xp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PointNotiDTOXp value)? xp,
    TResult? Function(_PointNotiDTOGold value)? gold,
    TResult? Function(_PointNotiDTODiamond value)? diamond,
  }) {
    return xp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PointNotiDTOXp value)? xp,
    TResult Function(_PointNotiDTOGold value)? gold,
    TResult Function(_PointNotiDTODiamond value)? diamond,
    required TResult orElse(),
  }) {
    if (xp != null) {
      return xp(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_PointNotiDTOXpToJson(
      this,
    );
  }
}

abstract class _PointNotiDTOXp implements PointNotiDTO {
  factory _PointNotiDTOXp(
      {required final String uid,
      required final PointModel point,
      required final String description,
      required final String routes,
      required final String type,
      final String pointClass}) = _$_PointNotiDTOXp;

  factory _PointNotiDTOXp.fromJson(Map<String, dynamic> json) =
      _$_PointNotiDTOXp.fromJson;

  @override
  String get uid;
  @override
  PointModel get point;
  @override
  String get description;
  @override
  String get routes;
  @override
  String get type;
  @override
  String get pointClass;
  @override
  @JsonKey(ignore: true)
  _$$_PointNotiDTOXpCopyWith<_$_PointNotiDTOXp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PointNotiDTOGoldCopyWith<$Res>
    implements $PointNotiDTOCopyWith<$Res> {
  factory _$$_PointNotiDTOGoldCopyWith(
          _$_PointNotiDTOGold value, $Res Function(_$_PointNotiDTOGold) then) =
      __$$_PointNotiDTOGoldCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      PointModel point,
      String description,
      String routes,
      String type,
      String pointClass});

  @override
  $PointModelCopyWith<$Res> get point;
}

/// @nodoc
class __$$_PointNotiDTOGoldCopyWithImpl<$Res>
    extends _$PointNotiDTOCopyWithImpl<$Res, _$_PointNotiDTOGold>
    implements _$$_PointNotiDTOGoldCopyWith<$Res> {
  __$$_PointNotiDTOGoldCopyWithImpl(
      _$_PointNotiDTOGold _value, $Res Function(_$_PointNotiDTOGold) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? point = null,
    Object? description = null,
    Object? routes = null,
    Object? type = null,
    Object? pointClass = null,
  }) {
    return _then(_$_PointNotiDTOGold(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as PointModel,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      routes: null == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      pointClass: null == pointClass
          ? _value.pointClass
          : pointClass // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PointNotiDTOGold implements _PointNotiDTOGold {
  _$_PointNotiDTOGold(
      {required this.uid,
      required this.point,
      required this.description,
      required this.routes,
      required this.type,
      this.pointClass = 'gold',
      final String? $type})
      : $type = $type ?? 'gold';

  factory _$_PointNotiDTOGold.fromJson(Map<String, dynamic> json) =>
      _$$_PointNotiDTOGoldFromJson(json);

  @override
  final String uid;
  @override
  final PointModel point;
  @override
  final String description;
  @override
  final String routes;
  @override
  final String type;
  @override
  @JsonKey()
  final String pointClass;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PointNotiDTO.gold(uid: $uid, point: $point, description: $description, routes: $routes, type: $type, pointClass: $pointClass)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PointNotiDTOGold &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.routes, routes) || other.routes == routes) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.pointClass, pointClass) ||
                other.pointClass == pointClass));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, point, description, routes, type, pointClass);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PointNotiDTOGoldCopyWith<_$_PointNotiDTOGold> get copyWith =>
      __$$_PointNotiDTOGoldCopyWithImpl<_$_PointNotiDTOGold>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)
        xp,
    required TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)
        gold,
    required TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)
        diamond,
  }) {
    return gold(uid, point, description, routes, type, pointClass);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        xp,
    TResult? Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        gold,
    TResult? Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        diamond,
  }) {
    return gold?.call(uid, point, description, routes, type, pointClass);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        xp,
    TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        gold,
    TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        diamond,
    required TResult orElse(),
  }) {
    if (gold != null) {
      return gold(uid, point, description, routes, type, pointClass);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PointNotiDTOXp value) xp,
    required TResult Function(_PointNotiDTOGold value) gold,
    required TResult Function(_PointNotiDTODiamond value) diamond,
  }) {
    return gold(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PointNotiDTOXp value)? xp,
    TResult? Function(_PointNotiDTOGold value)? gold,
    TResult? Function(_PointNotiDTODiamond value)? diamond,
  }) {
    return gold?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PointNotiDTOXp value)? xp,
    TResult Function(_PointNotiDTOGold value)? gold,
    TResult Function(_PointNotiDTODiamond value)? diamond,
    required TResult orElse(),
  }) {
    if (gold != null) {
      return gold(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_PointNotiDTOGoldToJson(
      this,
    );
  }
}

abstract class _PointNotiDTOGold implements PointNotiDTO {
  factory _PointNotiDTOGold(
      {required final String uid,
      required final PointModel point,
      required final String description,
      required final String routes,
      required final String type,
      final String pointClass}) = _$_PointNotiDTOGold;

  factory _PointNotiDTOGold.fromJson(Map<String, dynamic> json) =
      _$_PointNotiDTOGold.fromJson;

  @override
  String get uid;
  @override
  PointModel get point;
  @override
  String get description;
  @override
  String get routes;
  @override
  String get type;
  @override
  String get pointClass;
  @override
  @JsonKey(ignore: true)
  _$$_PointNotiDTOGoldCopyWith<_$_PointNotiDTOGold> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PointNotiDTODiamondCopyWith<$Res>
    implements $PointNotiDTOCopyWith<$Res> {
  factory _$$_PointNotiDTODiamondCopyWith(_$_PointNotiDTODiamond value,
          $Res Function(_$_PointNotiDTODiamond) then) =
      __$$_PointNotiDTODiamondCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      PointModel point,
      String description,
      String routes,
      String type,
      String pointClass});

  @override
  $PointModelCopyWith<$Res> get point;
}

/// @nodoc
class __$$_PointNotiDTODiamondCopyWithImpl<$Res>
    extends _$PointNotiDTOCopyWithImpl<$Res, _$_PointNotiDTODiamond>
    implements _$$_PointNotiDTODiamondCopyWith<$Res> {
  __$$_PointNotiDTODiamondCopyWithImpl(_$_PointNotiDTODiamond _value,
      $Res Function(_$_PointNotiDTODiamond) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? point = null,
    Object? description = null,
    Object? routes = null,
    Object? type = null,
    Object? pointClass = null,
  }) {
    return _then(_$_PointNotiDTODiamond(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as PointModel,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      routes: null == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      pointClass: null == pointClass
          ? _value.pointClass
          : pointClass // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PointNotiDTODiamond implements _PointNotiDTODiamond {
  _$_PointNotiDTODiamond(
      {required this.uid,
      required this.point,
      required this.description,
      required this.routes,
      required this.type,
      this.pointClass = 'gold',
      final String? $type})
      : $type = $type ?? 'diamond';

  factory _$_PointNotiDTODiamond.fromJson(Map<String, dynamic> json) =>
      _$$_PointNotiDTODiamondFromJson(json);

  @override
  final String uid;
  @override
  final PointModel point;
  @override
  final String description;
  @override
  final String routes;
  @override
  final String type;
  @override
  @JsonKey()
  final String pointClass;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PointNotiDTO.diamond(uid: $uid, point: $point, description: $description, routes: $routes, type: $type, pointClass: $pointClass)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PointNotiDTODiamond &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.routes, routes) || other.routes == routes) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.pointClass, pointClass) ||
                other.pointClass == pointClass));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, point, description, routes, type, pointClass);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PointNotiDTODiamondCopyWith<_$_PointNotiDTODiamond> get copyWith =>
      __$$_PointNotiDTODiamondCopyWithImpl<_$_PointNotiDTODiamond>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)
        xp,
    required TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)
        gold,
    required TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)
        diamond,
  }) {
    return diamond(uid, point, description, routes, type, pointClass);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        xp,
    TResult? Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        gold,
    TResult? Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        diamond,
  }) {
    return diamond?.call(uid, point, description, routes, type, pointClass);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        xp,
    TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        gold,
    TResult Function(String uid, PointModel point, String description,
            String routes, String type, String pointClass)?
        diamond,
    required TResult orElse(),
  }) {
    if (diamond != null) {
      return diamond(uid, point, description, routes, type, pointClass);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PointNotiDTOXp value) xp,
    required TResult Function(_PointNotiDTOGold value) gold,
    required TResult Function(_PointNotiDTODiamond value) diamond,
  }) {
    return diamond(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PointNotiDTOXp value)? xp,
    TResult? Function(_PointNotiDTOGold value)? gold,
    TResult? Function(_PointNotiDTODiamond value)? diamond,
  }) {
    return diamond?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PointNotiDTOXp value)? xp,
    TResult Function(_PointNotiDTOGold value)? gold,
    TResult Function(_PointNotiDTODiamond value)? diamond,
    required TResult orElse(),
  }) {
    if (diamond != null) {
      return diamond(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_PointNotiDTODiamondToJson(
      this,
    );
  }
}

abstract class _PointNotiDTODiamond implements PointNotiDTO {
  factory _PointNotiDTODiamond(
      {required final String uid,
      required final PointModel point,
      required final String description,
      required final String routes,
      required final String type,
      final String pointClass}) = _$_PointNotiDTODiamond;

  factory _PointNotiDTODiamond.fromJson(Map<String, dynamic> json) =
      _$_PointNotiDTODiamond.fromJson;

  @override
  String get uid;
  @override
  PointModel get point;
  @override
  String get description;
  @override
  String get routes;
  @override
  String get type;
  @override
  String get pointClass;
  @override
  @JsonKey(ignore: true)
  _$$_PointNotiDTODiamondCopyWith<_$_PointNotiDTODiamond> get copyWith =>
      throw _privateConstructorUsedError;
}
