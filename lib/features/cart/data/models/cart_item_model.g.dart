// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      id: json['id'] == null ? 0 : _intFromAny(json['id']),
      productCode: json['productCode'] as String? ?? '',
      productName: json['productName'] as String? ?? '',
      productImageUrl: _nonEmpty(json['productImageUrl']),
      unitPrice:
          json['unitPrice'] == null ? 0.0 : _doubleFromAny(json['unitPrice']),
      currency: json['currency'] as String? ?? '',
      quantity: json['quantity'] == null ? 0 : _intFromAny(json['quantity']),
      subtotal:
          json['subtotal'] == null ? 0.0 : _doubleFromAny(json['subtotal']),
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productCode': instance.productCode,
      'productName': instance.productName,
      'productImageUrl': instance.productImageUrl,
      'unitPrice': instance.unitPrice,
      'currency': instance.currency,
      'quantity': instance.quantity,
      'subtotal': instance.subtotal,
    };
