// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckoutResult _$CheckoutResultFromJson(Map<String, dynamic> json) {
  return _CheckoutResult.fromJson(json);
}

/// @nodoc
mixin _$CheckoutResult {
  @JsonKey(fromJson: _intOrNull)
  int? get orderId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _nonEmpty)
  String? get paymentReference => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseStatus, toJson: _statusToJson)
  CheckoutStatus get status => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String get rawStatus => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromAny)
  double get totalAmount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _nonEmpty)
  String? get suregiftsOrderId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _nonEmpty)
  String? get failureReason => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _vouchersFromJson)
  List<Voucher> get vouchers => throw _privateConstructorUsedError;

  /// Serializes this CheckoutResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutResultCopyWith<CheckoutResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutResultCopyWith<$Res> {
  factory $CheckoutResultCopyWith(
          CheckoutResult value, $Res Function(CheckoutResult) then) =
      _$CheckoutResultCopyWithImpl<$Res, CheckoutResult>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _intOrNull) int? orderId,
      @JsonKey(fromJson: _nonEmpty) String? paymentReference,
      @JsonKey(fromJson: _parseStatus, toJson: _statusToJson)
      CheckoutStatus status,
      @JsonKey(includeFromJson: false, includeToJson: false) String rawStatus,
      @JsonKey(fromJson: _doubleFromAny) double totalAmount,
      String currency,
      @JsonKey(fromJson: _nonEmpty) String? suregiftsOrderId,
      @JsonKey(fromJson: _nonEmpty) String? failureReason,
      @JsonKey(fromJson: _vouchersFromJson) List<Voucher> vouchers});
}

/// @nodoc
class _$CheckoutResultCopyWithImpl<$Res, $Val extends CheckoutResult>
    implements $CheckoutResultCopyWith<$Res> {
  _$CheckoutResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? paymentReference = freezed,
    Object? status = null,
    Object? rawStatus = null,
    Object? totalAmount = null,
    Object? currency = null,
    Object? suregiftsOrderId = freezed,
    Object? failureReason = freezed,
    Object? vouchers = null,
  }) {
    return _then(_value.copyWith(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentReference: freezed == paymentReference
          ? _value.paymentReference
          : paymentReference // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CheckoutStatus,
      rawStatus: null == rawStatus
          ? _value.rawStatus
          : rawStatus // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      suregiftsOrderId: freezed == suregiftsOrderId
          ? _value.suregiftsOrderId
          : suregiftsOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      failureReason: freezed == failureReason
          ? _value.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
              as String?,
      vouchers: null == vouchers
          ? _value.vouchers
          : vouchers // ignore: cast_nullable_to_non_nullable
              as List<Voucher>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckoutResultImplCopyWith<$Res>
    implements $CheckoutResultCopyWith<$Res> {
  factory _$$CheckoutResultImplCopyWith(_$CheckoutResultImpl value,
          $Res Function(_$CheckoutResultImpl) then) =
      __$$CheckoutResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _intOrNull) int? orderId,
      @JsonKey(fromJson: _nonEmpty) String? paymentReference,
      @JsonKey(fromJson: _parseStatus, toJson: _statusToJson)
      CheckoutStatus status,
      @JsonKey(includeFromJson: false, includeToJson: false) String rawStatus,
      @JsonKey(fromJson: _doubleFromAny) double totalAmount,
      String currency,
      @JsonKey(fromJson: _nonEmpty) String? suregiftsOrderId,
      @JsonKey(fromJson: _nonEmpty) String? failureReason,
      @JsonKey(fromJson: _vouchersFromJson) List<Voucher> vouchers});
}

/// @nodoc
class __$$CheckoutResultImplCopyWithImpl<$Res>
    extends _$CheckoutResultCopyWithImpl<$Res, _$CheckoutResultImpl>
    implements _$$CheckoutResultImplCopyWith<$Res> {
  __$$CheckoutResultImplCopyWithImpl(
      _$CheckoutResultImpl _value, $Res Function(_$CheckoutResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? paymentReference = freezed,
    Object? status = null,
    Object? rawStatus = null,
    Object? totalAmount = null,
    Object? currency = null,
    Object? suregiftsOrderId = freezed,
    Object? failureReason = freezed,
    Object? vouchers = null,
  }) {
    return _then(_$CheckoutResultImpl(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentReference: freezed == paymentReference
          ? _value.paymentReference
          : paymentReference // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CheckoutStatus,
      rawStatus: null == rawStatus
          ? _value.rawStatus
          : rawStatus // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      suregiftsOrderId: freezed == suregiftsOrderId
          ? _value.suregiftsOrderId
          : suregiftsOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      failureReason: freezed == failureReason
          ? _value.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
              as String?,
      vouchers: null == vouchers
          ? _value._vouchers
          : vouchers // ignore: cast_nullable_to_non_nullable
              as List<Voucher>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckoutResultImpl extends _CheckoutResult {
  const _$CheckoutResultImpl(
      {@JsonKey(fromJson: _intOrNull) this.orderId,
      @JsonKey(fromJson: _nonEmpty) this.paymentReference,
      @JsonKey(fromJson: _parseStatus, toJson: _statusToJson)
      this.status = CheckoutStatus.unknown,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.rawStatus = '',
      @JsonKey(fromJson: _doubleFromAny) this.totalAmount = 0.0,
      this.currency = 'NGN',
      @JsonKey(fromJson: _nonEmpty) this.suregiftsOrderId,
      @JsonKey(fromJson: _nonEmpty) this.failureReason,
      @JsonKey(fromJson: _vouchersFromJson)
      final List<Voucher> vouchers = const <Voucher>[]})
      : _vouchers = vouchers,
        super._();

  factory _$CheckoutResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckoutResultImplFromJson(json);

  @override
  @JsonKey(fromJson: _intOrNull)
  final int? orderId;
  @override
  @JsonKey(fromJson: _nonEmpty)
  final String? paymentReference;
  @override
  @JsonKey(fromJson: _parseStatus, toJson: _statusToJson)
  final CheckoutStatus status;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String rawStatus;
  @override
  @JsonKey(fromJson: _doubleFromAny)
  final double totalAmount;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey(fromJson: _nonEmpty)
  final String? suregiftsOrderId;
  @override
  @JsonKey(fromJson: _nonEmpty)
  final String? failureReason;
  final List<Voucher> _vouchers;
  @override
  @JsonKey(fromJson: _vouchersFromJson)
  List<Voucher> get vouchers {
    if (_vouchers is EqualUnmodifiableListView) return _vouchers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vouchers);
  }

  @override
  String toString() {
    return 'CheckoutResult(orderId: $orderId, paymentReference: $paymentReference, status: $status, rawStatus: $rawStatus, totalAmount: $totalAmount, currency: $currency, suregiftsOrderId: $suregiftsOrderId, failureReason: $failureReason, vouchers: $vouchers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutResultImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.paymentReference, paymentReference) ||
                other.paymentReference == paymentReference) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.rawStatus, rawStatus) ||
                other.rawStatus == rawStatus) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.suregiftsOrderId, suregiftsOrderId) ||
                other.suregiftsOrderId == suregiftsOrderId) &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason) &&
            const DeepCollectionEquality().equals(other._vouchers, _vouchers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderId,
      paymentReference,
      status,
      rawStatus,
      totalAmount,
      currency,
      suregiftsOrderId,
      failureReason,
      const DeepCollectionEquality().hash(_vouchers));

  /// Create a copy of CheckoutResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutResultImplCopyWith<_$CheckoutResultImpl> get copyWith =>
      __$$CheckoutResultImplCopyWithImpl<_$CheckoutResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckoutResultImplToJson(
      this,
    );
  }
}

abstract class _CheckoutResult extends CheckoutResult {
  const factory _CheckoutResult(
          {@JsonKey(fromJson: _intOrNull) final int? orderId,
          @JsonKey(fromJson: _nonEmpty) final String? paymentReference,
          @JsonKey(fromJson: _parseStatus, toJson: _statusToJson)
          final CheckoutStatus status,
          @JsonKey(includeFromJson: false, includeToJson: false)
          final String rawStatus,
          @JsonKey(fromJson: _doubleFromAny) final double totalAmount,
          final String currency,
          @JsonKey(fromJson: _nonEmpty) final String? suregiftsOrderId,
          @JsonKey(fromJson: _nonEmpty) final String? failureReason,
          @JsonKey(fromJson: _vouchersFromJson) final List<Voucher> vouchers}) =
      _$CheckoutResultImpl;
  const _CheckoutResult._() : super._();

  factory _CheckoutResult.fromJson(Map<String, dynamic> json) =
      _$CheckoutResultImpl.fromJson;

  @override
  @JsonKey(fromJson: _intOrNull)
  int? get orderId;
  @override
  @JsonKey(fromJson: _nonEmpty)
  String? get paymentReference;
  @override
  @JsonKey(fromJson: _parseStatus, toJson: _statusToJson)
  CheckoutStatus get status;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String get rawStatus;
  @override
  @JsonKey(fromJson: _doubleFromAny)
  double get totalAmount;
  @override
  String get currency;
  @override
  @JsonKey(fromJson: _nonEmpty)
  String? get suregiftsOrderId;
  @override
  @JsonKey(fromJson: _nonEmpty)
  String? get failureReason;
  @override
  @JsonKey(fromJson: _vouchersFromJson)
  List<Voucher> get vouchers;

  /// Create a copy of CheckoutResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutResultImplCopyWith<_$CheckoutResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
