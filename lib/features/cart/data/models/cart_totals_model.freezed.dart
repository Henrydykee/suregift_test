// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_totals_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartTotals _$CartTotalsFromJson(Map<String, dynamic> json) {
  return _CartTotals.fromJson(json);
}

/// @nodoc
mixin _$CartTotals {
  @JsonKey(fromJson: _doubleFromAny)
  double get subtotal => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleOrNull)
  double? get fees => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleOrNull)
  double? get tax => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromAny)
  double get total => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  /// Serializes this CartTotals to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartTotals
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartTotalsCopyWith<CartTotals> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartTotalsCopyWith<$Res> {
  factory $CartTotalsCopyWith(
          CartTotals value, $Res Function(CartTotals) then) =
      _$CartTotalsCopyWithImpl<$Res, CartTotals>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _doubleFromAny) double subtotal,
      @JsonKey(fromJson: _doubleOrNull) double? fees,
      @JsonKey(fromJson: _doubleOrNull) double? tax,
      @JsonKey(fromJson: _doubleFromAny) double total,
      String currency});
}

/// @nodoc
class _$CartTotalsCopyWithImpl<$Res, $Val extends CartTotals>
    implements $CartTotalsCopyWith<$Res> {
  _$CartTotalsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartTotals
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subtotal = null,
    Object? fees = freezed,
    Object? tax = freezed,
    Object? total = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      fees: freezed == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartTotalsImplCopyWith<$Res>
    implements $CartTotalsCopyWith<$Res> {
  factory _$$CartTotalsImplCopyWith(
          _$CartTotalsImpl value, $Res Function(_$CartTotalsImpl) then) =
      __$$CartTotalsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _doubleFromAny) double subtotal,
      @JsonKey(fromJson: _doubleOrNull) double? fees,
      @JsonKey(fromJson: _doubleOrNull) double? tax,
      @JsonKey(fromJson: _doubleFromAny) double total,
      String currency});
}

/// @nodoc
class __$$CartTotalsImplCopyWithImpl<$Res>
    extends _$CartTotalsCopyWithImpl<$Res, _$CartTotalsImpl>
    implements _$$CartTotalsImplCopyWith<$Res> {
  __$$CartTotalsImplCopyWithImpl(
      _$CartTotalsImpl _value, $Res Function(_$CartTotalsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartTotals
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subtotal = null,
    Object? fees = freezed,
    Object? tax = freezed,
    Object? total = null,
    Object? currency = null,
  }) {
    return _then(_$CartTotalsImpl(
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      fees: freezed == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartTotalsImpl extends _CartTotals {
  const _$CartTotalsImpl(
      {@JsonKey(fromJson: _doubleFromAny) this.subtotal = 0.0,
      @JsonKey(fromJson: _doubleOrNull) this.fees,
      @JsonKey(fromJson: _doubleOrNull) this.tax,
      @JsonKey(fromJson: _doubleFromAny) this.total = 0.0,
      this.currency = ''})
      : super._();

  factory _$CartTotalsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartTotalsImplFromJson(json);

  @override
  @JsonKey(fromJson: _doubleFromAny)
  final double subtotal;
  @override
  @JsonKey(fromJson: _doubleOrNull)
  final double? fees;
  @override
  @JsonKey(fromJson: _doubleOrNull)
  final double? tax;
  @override
  @JsonKey(fromJson: _doubleFromAny)
  final double total;
  @override
  @JsonKey()
  final String currency;

  @override
  String toString() {
    return 'CartTotals(subtotal: $subtotal, fees: $fees, tax: $tax, total: $total, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartTotalsImpl &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.fees, fees) || other.fees == fees) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, subtotal, fees, tax, total, currency);

  /// Create a copy of CartTotals
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartTotalsImplCopyWith<_$CartTotalsImpl> get copyWith =>
      __$$CartTotalsImplCopyWithImpl<_$CartTotalsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartTotalsImplToJson(
      this,
    );
  }
}

abstract class _CartTotals extends CartTotals {
  const factory _CartTotals(
      {@JsonKey(fromJson: _doubleFromAny) final double subtotal,
      @JsonKey(fromJson: _doubleOrNull) final double? fees,
      @JsonKey(fromJson: _doubleOrNull) final double? tax,
      @JsonKey(fromJson: _doubleFromAny) final double total,
      final String currency}) = _$CartTotalsImpl;
  const _CartTotals._() : super._();

  factory _CartTotals.fromJson(Map<String, dynamic> json) =
      _$CartTotalsImpl.fromJson;

  @override
  @JsonKey(fromJson: _doubleFromAny)
  double get subtotal;
  @override
  @JsonKey(fromJson: _doubleOrNull)
  double? get fees;
  @override
  @JsonKey(fromJson: _doubleOrNull)
  double? get tax;
  @override
  @JsonKey(fromJson: _doubleFromAny)
  double get total;
  @override
  String get currency;

  /// Create a copy of CartTotals
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartTotalsImplCopyWith<_$CartTotalsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
