// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoucherImpl _$$VoucherImplFromJson(Map<String, dynamic> json) =>
    _$VoucherImpl(
      id: json['id'] == null ? 0 : _intFromAny(json['id']),
      orderId: _intOrNull(json['orderId']),
      productCode: json['productCode'] as String? ?? '',
      productName: json['productName'] as String? ?? '',
      productImageUrl: json['productImageUrl'] as String?,
      amount: json['amount'] == null ? 0.0 : _doubleFromAny(json['amount']),
      currency: json['currency'] as String? ?? 'NGN',
      voucherCode: json['voucherCode'] as String?,
      pin: json['pin'] as String?,
      serialNumber: json['serialNumber'] as String?,
      expiryDate: _dateFromAny(json['expiryDate']),
      suregiftsVoucherId: json['suregiftsVoucherId'] as String?,
      suregiftsOrderId: json['suregiftsOrderId'] as String?,
      createdAtUtc: _dateFromAny(json['createdAtUtc']),
      redemptionUrl: json['redemptionUrl'] as String?,
      redemptionInstructions: json['redemptionInstructions'] as String?,
      termsAndConditions: json['termsAndConditions'] as String?,
    );

Map<String, dynamic> _$$VoucherImplToJson(_$VoucherImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'productCode': instance.productCode,
      'productName': instance.productName,
      'productImageUrl': instance.productImageUrl,
      'amount': instance.amount,
      'currency': instance.currency,
      'voucherCode': instance.voucherCode,
      'pin': instance.pin,
      'serialNumber': instance.serialNumber,
      'expiryDate': _dateToJson(instance.expiryDate),
      'suregiftsVoucherId': instance.suregiftsVoucherId,
      'suregiftsOrderId': instance.suregiftsOrderId,
      'createdAtUtc': _dateToJson(instance.createdAtUtc),
      'redemptionUrl': instance.redemptionUrl,
      'redemptionInstructions': instance.redemptionInstructions,
      'termsAndConditions': instance.termsAndConditions,
    };
