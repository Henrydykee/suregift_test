// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckoutResultImpl _$$CheckoutResultImplFromJson(Map<String, dynamic> json) =>
    _$CheckoutResultImpl(
      orderId: _intOrNull(json['orderId']),
      paymentReference: _nonEmpty(json['paymentReference']),
      status: json['status'] == null
          ? CheckoutStatus.unknown
          : _parseStatus(json['status']),
      totalAmount: json['totalAmount'] == null
          ? 0.0
          : _doubleFromAny(json['totalAmount']),
      currency: json['currency'] as String? ?? 'NGN',
      suregiftsOrderId: _nonEmpty(json['suregiftsOrderId']),
      failureReason: _nonEmpty(json['failureReason']),
      vouchers: json['vouchers'] == null
          ? const <Voucher>[]
          : _vouchersFromJson(json['vouchers']),
    );

Map<String, dynamic> _$$CheckoutResultImplToJson(
        _$CheckoutResultImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'paymentReference': instance.paymentReference,
      'status': _statusToJson(instance.status),
      'totalAmount': instance.totalAmount,
      'currency': instance.currency,
      'suregiftsOrderId': instance.suregiftsOrderId,
      'failureReason': instance.failureReason,
      'vouchers': instance.vouchers,
    };
