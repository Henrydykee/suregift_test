import 'package:suregift_test/core/utils/data/guarded_datasource_calls.dart';
import 'package:suregift_test/features/cart/data/datasources/cart_remote_datasource.dart';
import 'package:suregift_test/features/cart/data/models/cart_model.dart';
import 'package:suregift_test/features/cart/data/models/cart_totals_model.dart';
import 'package:suregift_test/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;

  CartRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Cart> getCart() => guardedApiCall<Cart>(
        () => remoteDataSource.getCart(),
        source: 'CartRepositoryImpl.getCart',
      );

  @override
  Future<void> addItem({
    required String productCode,
    required double amount,
    required int quantity,
  }) =>
      guardedApiCall<void>(
        () => remoteDataSource.addItem(
          productCode: productCode,
          amount: amount,
          quantity: quantity,
        ),
        source: 'CartRepositoryImpl.addItem',
      );

  @override
  Future<void> updateItem({
    required int cartItemId,
    required int quantity,
    double? amount,
  }) =>
      guardedApiCall<void>(
        () => remoteDataSource.updateItem(
          cartItemId: cartItemId,
          quantity: quantity,
          amount: amount,
        ),
        source: 'CartRepositoryImpl.updateItem',
      );

  @override
  Future<void> removeItem(int cartItemId) => guardedApiCall<void>(
        () => remoteDataSource.removeItem(cartItemId),
        source: 'CartRepositoryImpl.removeItem',
      );

  @override
  Future<CartTotals> getTotal() => guardedApiCall<CartTotals>(
        () => remoteDataSource.getTotal(),
        source: 'CartRepositoryImpl.getTotal',
      );
}

