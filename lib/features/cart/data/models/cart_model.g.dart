// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      cartId: json['cartId'] == null ? 0 : _intFromAny(json['cartId']),
      items: json['items'] == null
          ? const <CartItem>[]
          : _itemsFromJson(json['items']),
      subtotal:
          json['subtotal'] == null ? 0.0 : _doubleFromAny(json['subtotal']),
      currency: json['currency'] as String? ?? '',
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'cartId': instance.cartId,
      'items': instance.items,
      'subtotal': instance.subtotal,
      'currency': instance.currency,
    };
