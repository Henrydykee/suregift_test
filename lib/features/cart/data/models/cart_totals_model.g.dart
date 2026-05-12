// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_totals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartTotalsImpl _$$CartTotalsImplFromJson(Map<String, dynamic> json) =>
    _$CartTotalsImpl(
      subtotal:
          json['subtotal'] == null ? 0.0 : _doubleFromAny(json['subtotal']),
      fees: _doubleOrNull(json['fees']),
      tax: _doubleOrNull(json['tax']),
      total: json['total'] == null ? 0.0 : _doubleFromAny(json['total']),
      currency: json['currency'] as String? ?? '',
    );

Map<String, dynamic> _$$CartTotalsImplToJson(_$CartTotalsImpl instance) =>
    <String, dynamic>{
      'subtotal': instance.subtotal,
      'fees': instance.fees,
      'tax': instance.tax,
      'total': instance.total,
      'currency': instance.currency,
    };
