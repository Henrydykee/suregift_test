// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voucher_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Voucher _$VoucherFromJson(Map<String, dynamic> json) {
  return _Voucher.fromJson(json);
}

/// @nodoc
mixin _$Voucher {
  @JsonKey(fromJson: _intFromAny)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _intOrNull)
  int? get orderId => throw _privateConstructorUsedError;
  String get productCode => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String? get productImageUrl => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromAny)
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String? get voucherCode => throw _privateConstructorUsedError;
  String? get pin => throw _privateConstructorUsedError;
  String? get serialNumber => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateFromAny, toJson: _dateToJson)
  DateTime? get expiryDate => throw _privateConstructorUsedError;
  String? get suregiftsVoucherId => throw _privateConstructorUsedError;
  String? get suregiftsOrderId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateFromAny, toJson: _dateToJson)
  DateTime? get createdAtUtc => throw _privateConstructorUsedError;
  String? get redemptionUrl => throw _privateConstructorUsedError;
  String? get redemptionInstructions => throw _privateConstructorUsedError;
  String? get termsAndConditions => throw _privateConstructorUsedError;

  /// Serializes this Voucher to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Voucher
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoucherCopyWith<Voucher> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoucherCopyWith<$Res> {
  factory $VoucherCopyWith(Voucher value, $Res Function(Voucher) then) =
      _$VoucherCopyWithImpl<$Res, Voucher>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _intFromAny) int id,
      @JsonKey(fromJson: _intOrNull) int? orderId,
      String productCode,
      String productName,
      String? productImageUrl,
      @JsonKey(fromJson: _doubleFromAny) double amount,
      String currency,
      String? voucherCode,
      String? pin,
      String? serialNumber,
      @JsonKey(fromJson: _dateFromAny, toJson: _dateToJson)
      DateTime? expiryDate,
      String? suregiftsVoucherId,
      String? suregiftsOrderId,
      @JsonKey(fromJson: _dateFromAny, toJson: _dateToJson)
      DateTime? createdAtUtc,
      String? redemptionUrl,
      String? redemptionInstructions,
      String? termsAndConditions});
}

/// @nodoc
class _$VoucherCopyWithImpl<$Res, $Val extends Voucher>
    implements $VoucherCopyWith<$Res> {
  _$VoucherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Voucher
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = freezed,
    Object? productCode = null,
    Object? productName = null,
    Object? productImageUrl = freezed,
    Object? amount = null,
    Object? currency = null,
    Object? voucherCode = freezed,
    Object? pin = freezed,
    Object? serialNumber = freezed,
    Object? expiryDate = freezed,
    Object? suregiftsVoucherId = freezed,
    Object? suregiftsOrderId = freezed,
    Object? createdAtUtc = freezed,
    Object? redemptionUrl = freezed,
    Object? redemptionInstructions = freezed,
    Object? termsAndConditions = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      voucherCode: freezed == voucherCode
          ? _value.voucherCode
          : voucherCode // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      suregiftsVoucherId: freezed == suregiftsVoucherId
          ? _value.suregiftsVoucherId
          : suregiftsVoucherId // ignore: cast_nullable_to_non_nullable
              as String?,
      suregiftsOrderId: freezed == suregiftsOrderId
          ? _value.suregiftsOrderId
          : suregiftsOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAtUtc: freezed == createdAtUtc
          ? _value.createdAtUtc
          : createdAtUtc // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      redemptionUrl: freezed == redemptionUrl
          ? _value.redemptionUrl
          : redemptionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      redemptionInstructions: freezed == redemptionInstructions
          ? _value.redemptionInstructions
          : redemptionInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      termsAndConditions: freezed == termsAndConditions
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoucherImplCopyWith<$Res> implements $VoucherCopyWith<$Res> {
  factory _$$VoucherImplCopyWith(
          _$VoucherImpl value, $Res Function(_$VoucherImpl) then) =
      __$$VoucherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _intFromAny) int id,
      @JsonKey(fromJson: _intOrNull) int? orderId,
      String productCode,
      String productName,
      String? productImageUrl,
      @JsonKey(fromJson: _doubleFromAny) double amount,
      String currency,
      String? voucherCode,
      String? pin,
      String? serialNumber,
      @JsonKey(fromJson: _dateFromAny, toJson: _dateToJson)
      DateTime? expiryDate,
      String? suregiftsVoucherId,
      String? suregiftsOrderId,
      @JsonKey(fromJson: _dateFromAny, toJson: _dateToJson)
      DateTime? createdAtUtc,
      String? redemptionUrl,
      String? redemptionInstructions,
      String? termsAndConditions});
}

/// @nodoc
class __$$VoucherImplCopyWithImpl<$Res>
    extends _$VoucherCopyWithImpl<$Res, _$VoucherImpl>
    implements _$$VoucherImplCopyWith<$Res> {
  __$$VoucherImplCopyWithImpl(
      _$VoucherImpl _value, $Res Function(_$VoucherImpl) _then)
      : super(_value, _then);

  /// Create a copy of Voucher
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = freezed,
    Object? productCode = null,
    Object? productName = null,
    Object? productImageUrl = freezed,
    Object? amount = null,
    Object? currency = null,
    Object? voucherCode = freezed,
    Object? pin = freezed,
    Object? serialNumber = freezed,
    Object? expiryDate = freezed,
    Object? suregiftsVoucherId = freezed,
    Object? suregiftsOrderId = freezed,
    Object? createdAtUtc = freezed,
    Object? redemptionUrl = freezed,
    Object? redemptionInstructions = freezed,
    Object? termsAndConditions = freezed,
  }) {
    return _then(_$VoucherImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      voucherCode: freezed == voucherCode
          ? _value.voucherCode
          : voucherCode // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      suregiftsVoucherId: freezed == suregiftsVoucherId
          ? _value.suregiftsVoucherId
          : suregiftsVoucherId // ignore: cast_nullable_to_non_nullable
              as String?,
      suregiftsOrderId: freezed == suregiftsOrderId
          ? _value.suregiftsOrderId
          : suregiftsOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAtUtc: freezed == createdAtUtc
          ? _value.createdAtUtc
          : createdAtUtc // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      redemptionUrl: freezed == redemptionUrl
          ? _value.redemptionUrl
          : redemptionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      redemptionInstructions: freezed == redemptionInstructions
          ? _value.redemptionInstructions
          : redemptionInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      termsAndConditions: freezed == termsAndConditions
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoucherImpl extends _Voucher {
  const _$VoucherImpl(
      {@JsonKey(fromJson: _intFromAny) this.id = 0,
      @JsonKey(fromJson: _intOrNull) this.orderId,
      this.productCode = '',
      this.productName = '',
      this.productImageUrl,
      @JsonKey(fromJson: _doubleFromAny) this.amount = 0.0,
      this.currency = 'NGN',
      this.voucherCode,
      this.pin,
      this.serialNumber,
      @JsonKey(fromJson: _dateFromAny, toJson: _dateToJson) this.expiryDate,
      this.suregiftsVoucherId,
      this.suregiftsOrderId,
      @JsonKey(fromJson: _dateFromAny, toJson: _dateToJson) this.createdAtUtc,
      this.redemptionUrl,
      this.redemptionInstructions,
      this.termsAndConditions})
      : super._();

  factory _$VoucherImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoucherImplFromJson(json);

  @override
  @JsonKey(fromJson: _intFromAny)
  final int id;
  @override
  @JsonKey(fromJson: _intOrNull)
  final int? orderId;
  @override
  @JsonKey()
  final String productCode;
  @override
  @JsonKey()
  final String productName;
  @override
  final String? productImageUrl;
  @override
  @JsonKey(fromJson: _doubleFromAny)
  final double amount;
  @override
  @JsonKey()
  final String currency;
  @override
  final String? voucherCode;
  @override
  final String? pin;
  @override
  final String? serialNumber;
  @override
  @JsonKey(fromJson: _dateFromAny, toJson: _dateToJson)
  final DateTime? expiryDate;
  @override
  final String? suregiftsVoucherId;
  @override
  final String? suregiftsOrderId;
  @override
  @JsonKey(fromJson: _dateFromAny, toJson: _dateToJson)
  final DateTime? createdAtUtc;
  @override
  final String? redemptionUrl;
  @override
  final String? redemptionInstructions;
  @override
  final String? termsAndConditions;

  @override
  String toString() {
    return 'Voucher(id: $id, orderId: $orderId, productCode: $productCode, productName: $productName, productImageUrl: $productImageUrl, amount: $amount, currency: $currency, voucherCode: $voucherCode, pin: $pin, serialNumber: $serialNumber, expiryDate: $expiryDate, suregiftsVoucherId: $suregiftsVoucherId, suregiftsOrderId: $suregiftsOrderId, createdAtUtc: $createdAtUtc, redemptionUrl: $redemptionUrl, redemptionInstructions: $redemptionInstructions, termsAndConditions: $termsAndConditions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoucherImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.productCode, productCode) ||
                other.productCode == productCode) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImageUrl, productImageUrl) ||
                other.productImageUrl == productImageUrl) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.voucherCode, voucherCode) ||
                other.voucherCode == voucherCode) &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.suregiftsVoucherId, suregiftsVoucherId) ||
                other.suregiftsVoucherId == suregiftsVoucherId) &&
            (identical(other.suregiftsOrderId, suregiftsOrderId) ||
                other.suregiftsOrderId == suregiftsOrderId) &&
            (identical(other.createdAtUtc, createdAtUtc) ||
                other.createdAtUtc == createdAtUtc) &&
            (identical(other.redemptionUrl, redemptionUrl) ||
                other.redemptionUrl == redemptionUrl) &&
            (identical(other.redemptionInstructions, redemptionInstructions) ||
                other.redemptionInstructions == redemptionInstructions) &&
            (identical(other.termsAndConditions, termsAndConditions) ||
                other.termsAndConditions == termsAndConditions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      orderId,
      productCode,
      productName,
      productImageUrl,
      amount,
      currency,
      voucherCode,
      pin,
      serialNumber,
      expiryDate,
      suregiftsVoucherId,
      suregiftsOrderId,
      createdAtUtc,
      redemptionUrl,
      redemptionInstructions,
      termsAndConditions);

  /// Create a copy of Voucher
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoucherImplCopyWith<_$VoucherImpl> get copyWith =>
      __$$VoucherImplCopyWithImpl<_$VoucherImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoucherImplToJson(
      this,
    );
  }
}

abstract class _Voucher extends Voucher {
  const factory _Voucher(
      {@JsonKey(fromJson: _intFromAny) final int id,
      @JsonKey(fromJson: _intOrNull) final int? orderId,
      final String productCode,
      final String productName,
      final String? productImageUrl,
      @JsonKey(fromJson: _doubleFromAny) final double amount,
      final String currency,
      final String? voucherCode,
      final String? pin,
      final String? serialNumber,
      @JsonKey(fromJson: _dateFromAny, toJson: _dateToJson)
      final DateTime? expiryDate,
      final String? suregiftsVoucherId,
      final String? suregiftsOrderId,
      @JsonKey(fromJson: _dateFromAny, toJson: _dateToJson)
      final DateTime? createdAtUtc,
      final String? redemptionUrl,
      final String? redemptionInstructions,
      final String? termsAndConditions}) = _$VoucherImpl;
  const _Voucher._() : super._();

  factory _Voucher.fromJson(Map<String, dynamic> json) = _$VoucherImpl.fromJson;

  @override
  @JsonKey(fromJson: _intFromAny)
  int get id;
  @override
  @JsonKey(fromJson: _intOrNull)
  int? get orderId;
  @override
  String get productCode;
  @override
  String get productName;
  @override
  String? get productImageUrl;
  @override
  @JsonKey(fromJson: _doubleFromAny)
  double get amount;
  @override
  String get currency;
  @override
  String? get voucherCode;
  @override
  String? get pin;
  @override
  String? get serialNumber;
  @override
  @JsonKey(fromJson: _dateFromAny, toJson: _dateToJson)
  DateTime? get expiryDate;
  @override
  String? get suregiftsVoucherId;
  @override
  String? get suregiftsOrderId;
  @override
  @JsonKey(fromJson: _dateFromAny, toJson: _dateToJson)
  DateTime? get createdAtUtc;
  @override
  String? get redemptionUrl;
  @override
  String? get redemptionInstructions;
  @override
  String? get termsAndConditions;

  /// Create a copy of Voucher
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoucherImplCopyWith<_$VoucherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
