import 'package:suregift_test/features/cart/data/models/cart_item_model.dart';

class Cart {
  final int cartId;
  final List<CartItem> items;
  final double subtotal;
  final String currency;

  const Cart({
    required this.cartId,
    required this.items,
    required this.subtotal,
    required this.currency,
  });

  static const Cart empty = Cart(
    cartId: 0,
    items: [],
    subtotal: 0,
    currency: '',
  );

  bool get isEmpty => items.isEmpty;
  int get totalItemCount =>
      items.fold<int>(0, (sum, item) => sum + item.quantity);

  factory Cart.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'];
    final items = rawItems is List
        ? rawItems
            .whereType<Map<String, dynamic>>()
            .map(CartItem.fromJson)
            .toList(growable: false)
        : const <CartItem>[];

    final subtotalRaw = json['subtotal'];
    final subtotal = subtotalRaw is num
        ? subtotalRaw.toDouble()
        : double.tryParse(subtotalRaw?.toString() ?? '') ??
            items.fold<double>(0, (s, i) => s + i.subtotal);

    return Cart(
      cartId: (json['cartId'] as num?)?.toInt() ?? 0,
      items: items,
      subtotal: subtotal,
      currency: json['currency']?.toString() ?? '',
    );
  }
}

