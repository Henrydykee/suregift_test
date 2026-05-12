class CartTotals {
  final double subtotal;
  final double? fees;
  final double? tax;
  final double total;
  final String currency;

  const CartTotals({
    required this.subtotal,
    required this.total,
    required this.currency,
    this.fees,
    this.tax,
  });

  factory CartTotals.fromJson(Map<String, dynamic> json) {
    final subtotal = _asDouble(json['subtotal']);
    final fees = _asDoubleOrNull(json['fees'] ?? json['fee']);
    final tax = _asDoubleOrNull(json['tax']);
    final total = _asDoubleOrNull(json['total']) ??
        (subtotal + (fees ?? 0) + (tax ?? 0));

    return CartTotals(
      subtotal: subtotal,
      fees: fees,
      tax: tax,
      total: total,
      currency: json['currency']?.toString() ?? '',
    );
  }
}

double _asDouble(dynamic raw) {
  if (raw is num) return raw.toDouble();
  return double.tryParse(raw?.toString() ?? '') ?? 0.0;
}

double? _asDoubleOrNull(dynamic raw) {
  if (raw == null) return null;
  if (raw is num) return raw.toDouble();
  return double.tryParse(raw.toString());
}

