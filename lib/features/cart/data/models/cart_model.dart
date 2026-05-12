import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:suregift_test/features/cart/data/models/cart_item_model.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
class Cart with _$Cart {
  const Cart._();

  const factory Cart({
    @JsonKey(fromJson: _intFromAny) @Default(0) int cartId,
    @JsonKey(fromJson: _itemsFromJson)
    @Default(<CartItem>[])
    List<CartItem> items,
    @JsonKey(fromJson: _doubleFromAny) @Default(0.0) double subtotal,
    @Default('') String currency,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  static Cart parse(Map<String, dynamic> json) {
    final base = Cart.fromJson(json);
    final rawSubtotal = json['subtotal'];
    final hasSubtotal = (rawSubtotal is num) ||
        (double.tryParse(rawSubtotal?.toString() ?? '') != null);
    if (hasSubtotal || base.items.isEmpty) return base;
    final summed = base.items.fold<double>(0, (s, i) => s + i.subtotal);
    return base.copyWith(subtotal: summed);
  }

  static const Cart empty = Cart(
    cartId: 0,
    items: <CartItem>[],
    subtotal: 0,
    currency: '',
  );

  bool get isEmpty => items.isEmpty;

  int get totalItemCount =>
      items.fold<int>(0, (sum, item) => sum + item.quantity);
}

int _intFromAny(Object? raw) {
  if (raw is num) return raw.toInt();
  return int.tryParse(raw?.toString() ?? '') ?? 0;
}

double _doubleFromAny(Object? raw) {
  if (raw is num) return raw.toDouble();
  return double.tryParse(raw?.toString() ?? '') ?? 0.0;
}

List<CartItem> _itemsFromJson(Object? raw) {
  if (raw is! List) return const <CartItem>[];
  return raw
      .whereType<Map<String, dynamic>>()
      .map(CartItem.fromJson)
      .toList(growable: false);
}
