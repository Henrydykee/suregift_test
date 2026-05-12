import 'package:suregift_test/features/products/data/models/product_validity.dart';

class Product {
  final String code;
  final String name;
  final String? imageUrl;
  final String description;
  final String currency;
  final double minValue;
  final double maxValue;
  final List<double> denominations;
  final List<String> redemptionDetails;
  final List<String> countries;
  final List<String> stores;
  final List<String> categories;
  final ProductValidity? validity;

  const Product({
    required this.code,
    required this.name,
    required this.description,
    required this.currency,
    required this.minValue,
    required this.maxValue,
    required this.denominations,
    required this.redemptionDetails,
    required this.countries,
    required this.stores,
    required this.categories,
    this.imageUrl,
    this.validity,
  });

  bool get isOpenAmount => denominations.isEmpty;

  double? get effectiveMaxValue {
    if (maxValue <= 0) return null;
    if (maxValue < minValue) return null;
    return maxValue;
  }

  String? get primaryCountry => countries.isEmpty ? null : countries.first;
  String? get primaryCategory => categories.isEmpty ? null : categories.first;

  factory Product.fromJson(Map<String, dynamic> json) {
    final validityRaw = json['validity'];
    return Product(
      code: json['code']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      imageUrl: json['imageUrl']?.toString(),
      description: json['description']?.toString() ?? '',
      currency: json['currency']?.toString() ?? '',
      minValue: _asDouble(json['minValue']),
      maxValue: _asDouble(json['maxValue']),
      denominations: _asDoubleList(json['denominations']),
      redemptionDetails: _asStringList(json['redemptionDetails']),
      countries: _asStringList(json['countries']),
      stores: _asStringList(json['stores']),
      categories: _asStringList(json['categories']),
      validity: validityRaw is Map<String, dynamic>
          ? ProductValidity.fromJson(validityRaw)
          : null,
    );
  }
}

double _asDouble(dynamic raw) {
  if (raw is num) return raw.toDouble();
  return double.tryParse(raw?.toString() ?? '') ?? 0.0;
}

List<double> _asDoubleList(dynamic raw) {
  if (raw is! List) return const [];
  final out = <double>[];
  for (final v in raw) {
    if (v is num) {
      out.add(v.toDouble());
    } else {
      final p = double.tryParse(v?.toString() ?? '');
      if (p != null) out.add(p);
    }
  }
  return out;
}

List<String> _asStringList(dynamic raw) {
  if (raw is! List) return const [];
  return raw
      .map((v) => v?.toString() ?? '')
      .where((s) => s.isNotEmpty)
      .toList(growable: false);
}

