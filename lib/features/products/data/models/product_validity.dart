import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_validity.freezed.dart';
part 'product_validity.g.dart';

enum ValidityUnit { day, month, year, unknown }

@freezed
class ProductValidity with _$ProductValidity {
  const ProductValidity._();

  const factory ProductValidity({
    @JsonKey(name: 'type') required String rawType,
    @JsonKey(fromJson: _intFromAny, toJson: _intToJson) required int value,
  }) = _ProductValidity;

  factory ProductValidity.fromJson(Map<String, dynamic> json) =>
      _$ProductValidityFromJson(json);

  ValidityUnit get unit => _unitFrom(rawType);

  String get label {
    if (value <= 0 || unit == ValidityUnit.unknown) {
      return rawType.isEmpty ? '—' : rawType;
    }
    final base = switch (unit) {
      ValidityUnit.day => 'day',
      ValidityUnit.month => 'month',
      ValidityUnit.year => 'year',
      ValidityUnit.unknown => rawType.toLowerCase(),
    };
    return '$value ${value == 1 ? base : '${base}s'}';
  }
}

ValidityUnit _unitFrom(String raw) {
  switch (raw.toUpperCase()) {
    case 'DAY':
    case 'DAYS':
      return ValidityUnit.day;
    case 'MONTH':
    case 'MONTHS':
      return ValidityUnit.month;
    case 'YEAR':
    case 'YEARS':
      return ValidityUnit.year;
    default:
      return ValidityUnit.unknown;
  }
}

int _intFromAny(Object? raw) {
  if (raw is num) return raw.toInt();
  return int.tryParse(raw?.toString() ?? '') ?? 0;
}

int _intToJson(int value) => value;
