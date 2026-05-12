// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_validity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductValidity _$ProductValidityFromJson(Map<String, dynamic> json) {
  return _ProductValidity.fromJson(json);
}

/// @nodoc
mixin _$ProductValidity {
  @JsonKey(name: 'type')
  String get rawType => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromAny, toJson: _intToJson)
  int get value => throw _privateConstructorUsedError;

  /// Serializes this ProductValidity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductValidity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductValidityCopyWith<ProductValidity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductValidityCopyWith<$Res> {
  factory $ProductValidityCopyWith(
          ProductValidity value, $Res Function(ProductValidity) then) =
      _$ProductValidityCopyWithImpl<$Res, ProductValidity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'type') String rawType,
      @JsonKey(fromJson: _intFromAny, toJson: _intToJson) int value});
}

/// @nodoc
class _$ProductValidityCopyWithImpl<$Res, $Val extends ProductValidity>
    implements $ProductValidityCopyWith<$Res> {
  _$ProductValidityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductValidity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawType = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      rawType: null == rawType
          ? _value.rawType
          : rawType // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductValidityImplCopyWith<$Res>
    implements $ProductValidityCopyWith<$Res> {
  factory _$$ProductValidityImplCopyWith(_$ProductValidityImpl value,
          $Res Function(_$ProductValidityImpl) then) =
      __$$ProductValidityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type') String rawType,
      @JsonKey(fromJson: _intFromAny, toJson: _intToJson) int value});
}

/// @nodoc
class __$$ProductValidityImplCopyWithImpl<$Res>
    extends _$ProductValidityCopyWithImpl<$Res, _$ProductValidityImpl>
    implements _$$ProductValidityImplCopyWith<$Res> {
  __$$ProductValidityImplCopyWithImpl(
      _$ProductValidityImpl _value, $Res Function(_$ProductValidityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductValidity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawType = null,
    Object? value = null,
  }) {
    return _then(_$ProductValidityImpl(
      rawType: null == rawType
          ? _value.rawType
          : rawType // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductValidityImpl extends _ProductValidity {
  const _$ProductValidityImpl(
      {@JsonKey(name: 'type') required this.rawType,
      @JsonKey(fromJson: _intFromAny, toJson: _intToJson) required this.value})
      : super._();

  factory _$ProductValidityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductValidityImplFromJson(json);

  @override
  @JsonKey(name: 'type')
  final String rawType;
  @override
  @JsonKey(fromJson: _intFromAny, toJson: _intToJson)
  final int value;

  @override
  String toString() {
    return 'ProductValidity(rawType: $rawType, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductValidityImpl &&
            (identical(other.rawType, rawType) || other.rawType == rawType) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rawType, value);

  /// Create a copy of ProductValidity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductValidityImplCopyWith<_$ProductValidityImpl> get copyWith =>
      __$$ProductValidityImplCopyWithImpl<_$ProductValidityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductValidityImplToJson(
      this,
    );
  }
}

abstract class _ProductValidity extends ProductValidity {
  const factory _ProductValidity(
      {@JsonKey(name: 'type') required final String rawType,
      @JsonKey(fromJson: _intFromAny, toJson: _intToJson)
      required final int value}) = _$ProductValidityImpl;
  const _ProductValidity._() : super._();

  factory _ProductValidity.fromJson(Map<String, dynamic> json) =
      _$ProductValidityImpl.fromJson;

  @override
  @JsonKey(name: 'type')
  String get rawType;
  @override
  @JsonKey(fromJson: _intFromAny, toJson: _intToJson)
  int get value;

  /// Create a copy of ProductValidity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductValidityImplCopyWith<_$ProductValidityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
