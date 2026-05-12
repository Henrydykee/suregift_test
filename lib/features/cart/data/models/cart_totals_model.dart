import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_totals_model.freezed.dart';
part 'cart_totals_model.g.dart';

@freezed
class CartTotals with _$CartTotals {
  const CartTotals._();

  const factory CartTotals({
    @JsonKey(fromJson: _doubleFromAny) @Default(0.0) double subtotal,
    @JsonKey(fromJson: _doubleOrNull) double? fees,
    @JsonKey(fromJson: _doubleOrNull) double? tax,
    @JsonKey(fromJson: _doubleFromAny) @Default(0.0) double total,
    @Default('') String currency,
  }) = _CartTotals;

  factory CartTotals.fromJson(Map<String, dynamic> json) =>
      _$CartTotalsFromJson(json);

  static CartTotals parse(Map<String, dynamic> json) {
    final base = CartTotals.fromJson(json);
    final fallbackFees = base.fees ?? _doubleOrNull(json['fee']);
    final rawTotal = json['total'];
    final hasTotal = (rawTotal is num) ||
        (double.tryParse(rawTotal?.toString() ?? '') != null);
    final computedTotal = hasTotal
        ? base.total
        : base.subtotal + (fallbackFees ?? 0) + (base.tax ?? 0);

    if (fallbackFees == base.fees && computedTotal == base.total) {
      return base;
    }
    return base.copyWith(fees: fallbackFees, total: computedTotal);
  }
}

double _doubleFromAny(Object? raw) {
  if (raw is num) return raw.toDouble();
  return double.tryParse(raw?.toString() ?? '') ?? 0.0;
}

double? _doubleOrNull(Object? raw) {
  if (raw == null) return null;
  if (raw is num) return raw.toDouble();
  return double.tryParse(raw.toString());
}
