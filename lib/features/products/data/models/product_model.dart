import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:suregift_test/features/products/data/models/product_validity.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class Product with _$Product {
  const Product._();

  const factory Product({
    @Default('') String code,
    @Default('') String name,
    String? imageUrl,
    @Default('') String description,
    @Default('') String currency,
    @JsonKey(fromJson: _doubleFromAny) @Default(0.0) double minValue,
    @JsonKey(fromJson: _doubleFromAny) @Default(0.0) double maxValue,
    @JsonKey(fromJson: _doubleList) @Default(<double>[]) List<double> denominations,
    @JsonKey(fromJson: _stringList) @Default(<String>[]) List<String> redemptionDetails,
    @JsonKey(fromJson: _stringList) @Default(<String>[]) List<String> countries,
    @JsonKey(fromJson: _stringList) @Default(<String>[]) List<String> stores,
    @JsonKey(fromJson: _stringList) @Default(<String>[]) List<String> categories,
    ProductValidity? validity,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  bool get isOpenAmount => denominations.isEmpty;

  double? get effectiveMaxValue {
    if (maxValue <= 0) return null;
    if (maxValue < minValue) return null;
    return maxValue;
  }

  String? get primaryCountry => countries.isEmpty ? null : countries.first;

  String? get primaryCategory => categories.isEmpty ? null : categories.first;
}

double _doubleFromAny(Object? raw) {
  if (raw is num) return raw.toDouble();
  return double.tryParse(raw?.toString() ?? '') ?? 0.0;
}

List<double> _doubleList(Object? raw) {
  if (raw is! List) return const <double>[];
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

List<String> _stringList(Object? raw) {
  if (raw is! List) return const <String>[];
  return raw
      .map((v) => v?.toString() ?? '')
      .where((s) => s.isNotEmpty)
      .toList(growable: false);
}
