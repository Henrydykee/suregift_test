enum ValidityUnit { day, month, year, unknown }

class ProductValidity {
  final ValidityUnit unit;
  final int value;
  final String rawType;

  const ProductValidity({
    required this.unit,
    required this.value,
    required this.rawType,
  });

  factory ProductValidity.fromJson(Map<String, dynamic> json) {
    final type = json['type']?.toString() ?? '';
    final value = (json['value'] as num?)?.toInt() ?? 0;
    return ProductValidity(
      unit: _unitFrom(type),
      value: value,
      rawType: type,
    );
  }

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

