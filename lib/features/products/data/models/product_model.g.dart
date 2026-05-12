// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? '',
      imageUrl: json['imageUrl'] as String?,
      description: json['description'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      minValue:
          json['minValue'] == null ? 0.0 : _doubleFromAny(json['minValue']),
      maxValue:
          json['maxValue'] == null ? 0.0 : _doubleFromAny(json['maxValue']),
      denominations: json['denominations'] == null
          ? const <double>[]
          : _doubleList(json['denominations']),
      redemptionDetails: json['redemptionDetails'] == null
          ? const <String>[]
          : _stringList(json['redemptionDetails']),
      countries: json['countries'] == null
          ? const <String>[]
          : _stringList(json['countries']),
      stores: json['stores'] == null
          ? const <String>[]
          : _stringList(json['stores']),
      categories: json['categories'] == null
          ? const <String>[]
          : _stringList(json['categories']),
      validity: json['validity'] == null
          ? null
          : ProductValidity.fromJson(json['validity'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'currency': instance.currency,
      'minValue': instance.minValue,
      'maxValue': instance.maxValue,
      'denominations': instance.denominations,
      'redemptionDetails': instance.redemptionDetails,
      'countries': instance.countries,
      'stores': instance.stores,
      'categories': instance.categories,
      'validity': instance.validity,
    };
