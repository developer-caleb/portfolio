// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventModel _$EventModelFromJson(Map<String, dynamic> json) {
  return _EventModel.fromJson(json);
}

/// @nodoc
mixin _$EventModel {
  @JsonKey(fromJson: Serializable.fromEvent)
  EventType get type => throw _privateConstructorUsedError;
  int get remains => throw _privateConstructorUsedError;
  int get earnedStamps => throw _privateConstructorUsedError;
  bool get isEnded => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  bool get isReceived => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventModelCopyWith<EventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventModelCopyWith<$Res> {
  factory $EventModelCopyWith(
          EventModel value, $Res Function(EventModel) then) =
      _$EventModelCopyWithImpl<$Res, EventModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: Serializable.fromEvent) EventType type,
      int remains,
      int earnedStamps,
      bool isEnded,
      bool isCompleted,
      bool isReceived});
}

/// @nodoc
class _$EventModelCopyWithImpl<$Res, $Val extends EventModel>
    implements $EventModelCopyWith<$Res> {
  _$EventModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? remains = null,
    Object? earnedStamps = null,
    Object? isEnded = null,
    Object? isCompleted = null,
    Object? isReceived = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventType,
      remains: null == remains
          ? _value.remains
          : remains // ignore: cast_nullable_to_non_nullable
              as int,
      earnedStamps: null == earnedStamps
          ? _value.earnedStamps
          : earnedStamps // ignore: cast_nullable_to_non_nullable
              as int,
      isEnded: null == isEnded
          ? _value.isEnded
          : isEnded // ignore: cast_nullable_to_non_nullable
              as bool,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isReceived: null == isReceived
          ? _value.isReceived
          : isReceived // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventModelCopyWith<$Res>
    implements $EventModelCopyWith<$Res> {
  factory _$$_EventModelCopyWith(
          _$_EventModel value, $Res Function(_$_EventModel) then) =
      __$$_EventModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: Serializable.fromEvent) EventType type,
      int remains,
      int earnedStamps,
      bool isEnded,
      bool isCompleted,
      bool isReceived});
}

/// @nodoc
class __$$_EventModelCopyWithImpl<$Res>
    extends _$EventModelCopyWithImpl<$Res, _$_EventModel>
    implements _$$_EventModelCopyWith<$Res> {
  __$$_EventModelCopyWithImpl(
      _$_EventModel _value, $Res Function(_$_EventModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? remains = null,
    Object? earnedStamps = null,
    Object? isEnded = null,
    Object? isCompleted = null,
    Object? isReceived = null,
  }) {
    return _then(_$_EventModel(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventType,
      remains: null == remains
          ? _value.remains
          : remains // ignore: cast_nullable_to_non_nullable
              as int,
      earnedStamps: null == earnedStamps
          ? _value.earnedStamps
          : earnedStamps // ignore: cast_nullable_to_non_nullable
              as int,
      isEnded: null == isEnded
          ? _value.isEnded
          : isEnded // ignore: cast_nullable_to_non_nullable
              as bool,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isReceived: null == isReceived
          ? _value.isReceived
          : isReceived // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventModel implements _EventModel {
  _$_EventModel(
      {@JsonKey(fromJson: Serializable.fromEvent) required this.type,
      required this.remains,
      required this.earnedStamps,
      required this.isEnded,
      required this.isCompleted,
      required this.isReceived});

  factory _$_EventModel.fromJson(Map<String, dynamic> json) =>
      _$$_EventModelFromJson(json);

  @override
  @JsonKey(fromJson: Serializable.fromEvent)
  final EventType type;
  @override
  final int remains;
  @override
  final int earnedStamps;
  @override
  final bool isEnded;
  @override
  final bool isCompleted;
  @override
  final bool isReceived;

  @override
  String toString() {
    return 'EventModel(type: $type, remains: $remains, earnedStamps: $earnedStamps, isEnded: $isEnded, isCompleted: $isCompleted, isReceived: $isReceived)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventModel &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.remains, remains) || other.remains == remains) &&
            (identical(other.earnedStamps, earnedStamps) ||
                other.earnedStamps == earnedStamps) &&
            (identical(other.isEnded, isEnded) || other.isEnded == isEnded) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.isReceived, isReceived) ||
                other.isReceived == isReceived));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, remains, earnedStamps,
      isEnded, isCompleted, isReceived);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventModelCopyWith<_$_EventModel> get copyWith =>
      __$$_EventModelCopyWithImpl<_$_EventModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventModelToJson(
      this,
    );
  }
}

abstract class _EventModel implements EventModel {
  factory _EventModel(
      {@JsonKey(fromJson: Serializable.fromEvent) required final EventType type,
      required final int remains,
      required final int earnedStamps,
      required final bool isEnded,
      required final bool isCompleted,
      required final bool isReceived}) = _$_EventModel;

  factory _EventModel.fromJson(Map<String, dynamic> json) =
      _$_EventModel.fromJson;

  @override
  @JsonKey(fromJson: Serializable.fromEvent)
  EventType get type;
  @override
  int get remains;
  @override
  int get earnedStamps;
  @override
  bool get isEnded;
  @override
  bool get isCompleted;
  @override
  bool get isReceived;
  @override
  @JsonKey(ignore: true)
  _$$_EventModelCopyWith<_$_EventModel> get copyWith =>
      throw _privateConstructorUsedError;
}
