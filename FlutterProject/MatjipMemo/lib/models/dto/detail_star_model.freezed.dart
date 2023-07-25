// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'detail_star_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DetailStarModel _$DetailStarModelFromJson(Map<String, dynamic> json) {
  return _DetailStarModel.fromJson(json);
}

/// @nodoc
mixin _$DetailStarModel {
  double get taste => throw _privateConstructorUsedError;
  double get service => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get atmosphere => throw _privateConstructorUsedError;
  double get waiting => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailStarModelCopyWith<DetailStarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStarModelCopyWith<$Res> {
  factory $DetailStarModelCopyWith(
          DetailStarModel value, $Res Function(DetailStarModel) then) =
      _$DetailStarModelCopyWithImpl<$Res, DetailStarModel>;
  @useResult
  $Res call(
      {double taste,
      double service,
      double price,
      double atmosphere,
      double waiting});
}

/// @nodoc
class _$DetailStarModelCopyWithImpl<$Res, $Val extends DetailStarModel>
    implements $DetailStarModelCopyWith<$Res> {
  _$DetailStarModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taste = null,
    Object? service = null,
    Object? price = null,
    Object? atmosphere = null,
    Object? waiting = null,
  }) {
    return _then(_value.copyWith(
      taste: null == taste
          ? _value.taste
          : taste // ignore: cast_nullable_to_non_nullable
              as double,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      atmosphere: null == atmosphere
          ? _value.atmosphere
          : atmosphere // ignore: cast_nullable_to_non_nullable
              as double,
      waiting: null == waiting
          ? _value.waiting
          : waiting // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetailStarModelCopyWith<$Res>
    implements $DetailStarModelCopyWith<$Res> {
  factory _$$_DetailStarModelCopyWith(
          _$_DetailStarModel value, $Res Function(_$_DetailStarModel) then) =
      __$$_DetailStarModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double taste,
      double service,
      double price,
      double atmosphere,
      double waiting});
}

/// @nodoc
class __$$_DetailStarModelCopyWithImpl<$Res>
    extends _$DetailStarModelCopyWithImpl<$Res, _$_DetailStarModel>
    implements _$$_DetailStarModelCopyWith<$Res> {
  __$$_DetailStarModelCopyWithImpl(
      _$_DetailStarModel _value, $Res Function(_$_DetailStarModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taste = null,
    Object? service = null,
    Object? price = null,
    Object? atmosphere = null,
    Object? waiting = null,
  }) {
    return _then(_$_DetailStarModel(
      taste: null == taste
          ? _value.taste
          : taste // ignore: cast_nullable_to_non_nullable
              as double,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      atmosphere: null == atmosphere
          ? _value.atmosphere
          : atmosphere // ignore: cast_nullable_to_non_nullable
              as double,
      waiting: null == waiting
          ? _value.waiting
          : waiting // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DetailStarModel extends _DetailStarModel {
  _$_DetailStarModel(
      {required this.taste,
      required this.service,
      required this.price,
      required this.atmosphere,
      required this.waiting})
      : super._();

  factory _$_DetailStarModel.fromJson(Map<String, dynamic> json) =>
      _$$_DetailStarModelFromJson(json);

  @override
  final double taste;
  @override
  final double service;
  @override
  final double price;
  @override
  final double atmosphere;
  @override
  final double waiting;

  @override
  String toString() {
    return 'DetailStarModel(taste: $taste, service: $service, price: $price, atmosphere: $atmosphere, waiting: $waiting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailStarModel &&
            (identical(other.taste, taste) || other.taste == taste) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.atmosphere, atmosphere) ||
                other.atmosphere == atmosphere) &&
            (identical(other.waiting, waiting) || other.waiting == waiting));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, taste, service, price, atmosphere, waiting);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailStarModelCopyWith<_$_DetailStarModel> get copyWith =>
      __$$_DetailStarModelCopyWithImpl<_$_DetailStarModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetailStarModelToJson(
      this,
    );
  }
}

abstract class _DetailStarModel extends DetailStarModel {
  factory _DetailStarModel(
      {required final double taste,
      required final double service,
      required final double price,
      required final double atmosphere,
      required final double waiting}) = _$_DetailStarModel;
  _DetailStarModel._() : super._();

  factory _DetailStarModel.fromJson(Map<String, dynamic> json) =
      _$_DetailStarModel.fromJson;

  @override
  double get taste;
  @override
  double get service;
  @override
  double get price;
  @override
  double get atmosphere;
  @override
  double get waiting;
  @override
  @JsonKey(ignore: true)
  _$$_DetailStarModelCopyWith<_$_DetailStarModel> get copyWith =>
      throw _privateConstructorUsedError;
}
