import 'package:suregift_test/features/cart/data/models/cart_model.dart';
import 'package:suregift_test/features/cart/data/models/cart_totals_model.dart';

abstract class CartRepository {
  Future<Cart> getCart();

  Future<void> addItem({
    required String productCode,
    required double amount,
    required int quantity,
  });

  Future<void> updateItem({
    required int cartItemId,
    required int quantity,
    double? amount,
  });

  Future<void> removeItem(int cartItemId);

  Future<CartTotals> getTotal();
}

