class CartItem {
  final int id;
  final String productCode;
  final String productName;
  final String? productImageUrl;

  final double unitPrice;
  final String currency;
  final int quantity;
  final double subtotal;

  const CartItem({
    required this.id,
    required this.productCode,
    required this.productName,
    required this.unitPrice,
    required this.currency,
    required this.quantity,
    required this.subtotal,
    this.productImageUrl,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    final unit = _asDouble(json['unitPrice']);
    final qty = (json['quantity'] as num?)?.toInt() ?? 0;
    return CartItem(
      id: (json['id'] as num?)?.toInt() ?? 0,
      productCode: json['productCode']?.toString() ?? '',
      productName: json['productName']?.toString() ?? '',
      productImageUrl: _nonEmpty(json['productImageUrl']),
      unitPrice: unit,
      currency: json['currency']?.toString() ?? '',
      quantity: qty,
      subtotal: _asDouble(json['subtotal'], fallback: unit * qty),
    );
  }
}

double _asDouble(dynamic raw, {double fallback = 0.0}) {
  if (raw is num) return raw.toDouble();
  return double.tryParse(raw?.toString() ?? '') ?? fallback;
}

String? _nonEmpty(dynamic raw) {
  final s = raw?.toString();
  if (s == null || s.isEmpty) return null;
  return s;
}

