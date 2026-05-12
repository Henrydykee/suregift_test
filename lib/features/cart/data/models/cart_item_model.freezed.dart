// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return _CartItem.fromJson(json);
}

/// @nodoc
mixin _$CartItem {
  @JsonKey(fromJson: _intFromAny)
  int get id => throw _privateConstructorUsedError;
  String get productCode => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _nonEmpty)
  String? get productImageUrl => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromAny)
  double get unitPrice => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intFromAny)
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromAny)
  double get subtotal => throw _privateConstructorUsedError;

  /// Serializes this CartItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _intFromAny) int id,
      String productCode,
      String productName,
      @JsonKey(fromJson: _nonEmpty) String? productImageUrl,
      @JsonKey(fromJson: _doubleFromAny) double unitPrice,
      String currency,
      @JsonKey(fromJson: _intFromAny) int quantity,
      @JsonKey(fromJson: _doubleFromAny) double subtotal});
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productCode = null,
    Object? productName = null,
    Object? productImageUrl = freezed,
    Object? unitPrice = null,
    Object? currency = null,
    Object? quantity = null,
    Object? subtotal = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productCode: null == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImageUrl: freezed == productImageUrl
          ? _value.productImageUrl
          : productImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
          _$CartItemImpl value, $Res Function(_$CartItemImpl) then) =
      __$$CartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _intFromAny) int id,
      String productCode,
      String productName,
      @JsonKey(fromJson: _nonEmpty) String? productImageUrl,
      @JsonKey(fromJson: _doubleFromAny) double unitPrice,
      String currency,
      @JsonKey(fromJson: _intFromAny) int quantity,
      @JsonKey(fromJson: _doubleFromAny) double subtotal});
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
      _$CartItemImpl _value, $Res Function(_$CartItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productCode = null,
    Object? productName = null,
    Object? productImageUrl = freezed,
    Object? unitPrice = null,
    Object? currency = null,
    Object? quantity = null,
    Object? subtotal = null,
  }) {
    return _then(_$CartItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productCode: null == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImageUrl: freezed == productImageUrl
          ? _value.productImageUrl
          : productImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemImpl implements _CartItem {
  const _$CartItemImpl(
      {@JsonKey(fromJson: _intFromAny) this.id = 0,
      this.productCode = '',
      this.productName = '',
      @JsonKey(fromJson: _nonEmpty) this.productImageUrl,
      @JsonKey(fromJson: _doubleFromAny) this.unitPrice = 0.0,
      this.currency = '',
      @JsonKey(fromJson: _intFromAny) this.quantity = 0,
      @JsonKey(fromJson: _doubleFromAny) this.subtotal = 0.0});

  factory _$CartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemImplFromJson(json);

  @override
  @JsonKey(fromJson: _intFromAny)
  final int id;
  @override
  @JsonKey()
  final String productCode;
  @override
  @JsonKey()
  final String productName;
  @override
  @JsonKey(fromJson: _nonEmpty)
  final String? productImageUrl;
  @override
  @JsonKey(fromJson: _doubleFromAny)
  final double unitPrice;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey(fromJson: _intFromAny)
  final int quantity;
  @override
  @JsonKey(fromJson: _doubleFromAny)
  final double subtotal;

  @override
  String toString() {
    return 'CartItem(id: $id, productCode: $productCode, productName: $productName, productImageUrl: $productImageUrl, unitPrice: $unitPrice, currency: $currency, quantity: $quantity, subtotal: $subtotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productCode, productCode) ||
                other.productCode == productCode) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImageUrl, productImageUrl) ||
                other.productImageUrl == productImageUrl) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, productCode, productName,
      productImageUrl, unitPrice, currency, quantity, subtotal);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemImplToJson(
      this,
    );
  }
}

abstract class _CartItem implements CartItem {
  const factory _CartItem(
          {@JsonKey(fromJson: _intFromAny) final int id,
          final String productCode,
          final String productName,
          @JsonKey(fromJson: _nonEmpty) final String? productImageUrl,
          @JsonKey(fromJson: _doubleFromAny) final double unitPrice,
          final String currency,
          @JsonKey(fromJson: _intFromAny) final int quantity,
          @JsonKey(fromJson: _doubleFromAny) final double subtotal}) =
      _$CartItemImpl;

  factory _CartItem.fromJson(Map<String, dynamic> json) =
      _$CartItemImpl.fromJson;

  @override
  @JsonKey(fromJson: _intFromAny)
  int get id;
  @override
  String get productCode;
  @override
  String get productName;
  @override
  @JsonKey(fromJson: _nonEmpty)
  String? get productImageUrl;
  @override
  @JsonKey(fromJson: _doubleFromAny)
  double get unitPrice;
  @override
  String get currency;
  @override
  @JsonKey(fromJson: _intFromAny)
  int get quantity;
  @override
  @JsonKey(fromJson: _doubleFromAny)
  double get subtotal;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
