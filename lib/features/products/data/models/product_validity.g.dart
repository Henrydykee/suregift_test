// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_validity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductValidityImpl _$$ProductValidityImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductValidityImpl(
      rawType: json['type'] as String,
      value: _intFromAny(json['value']),
    );

Map<String, dynamic> _$$ProductValidityImplToJson(
        _$ProductValidityImpl instance) =>
    <String, dynamic>{
      'type': instance.rawType,
      'value': _intToJson(instance.value),
    };
