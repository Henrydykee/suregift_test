import 'package:suregift_test/core/data/network/network_service.dart';
import 'package:suregift_test/core/data/network/network_service_response.dart';
import 'package:suregift_test/features/cart/data/datasources/endpoint.dart';
import 'package:suregift_test/features/cart/data/models/cart_model.dart';
import 'package:suregift_test/features/cart/data/models/cart_totals_model.dart';

class CartRemoteDataSource {
  final NetworkService _networkService;

  CartRemoteDataSource(this._networkService);

  Future<Cart> getCart() async {
    final response = await _networkService.get(CartEndpoints.cart);
    return Cart.fromJson(_asMap(handleNetworkResponse(response)));
  }

  Future<void> addItem({
    required String productCode,
    required double amount,
    required int quantity,
  }) async {
    final response = await _networkService.post(
      CartEndpoints.items,
      body: {
        'productCode': productCode,
        'amount': amount,
        'quantity': quantity,
      },
    );
    handleNetworkResponse(response);
  }

  Future<void> updateItem({
    required int cartItemId,
    required int quantity,
    double? amount,
  }) async {
    final response = await _networkService.put(
      CartEndpoints.itemById(cartItemId),
      body: {
        'cartItemId': cartItemId,
        'quantity': quantity,
        if (amount != null) 'amount': amount,
      },
    );
    handleNetworkResponse(response);
  }

  Future<void> removeItem(int cartItemId) async {
    final response =
        await _networkService.delete(CartEndpoints.itemById(cartItemId));
    handleNetworkResponse(response);
  }

  Future<CartTotals> getTotal() async {
    final response = await _networkService.get(CartEndpoints.total);
    return CartTotals.fromJson(_asMap(handleNetworkResponse(response)));
  }

  Map<String, dynamic> _asMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      final inner = data['data'];
      if (inner is Map<String, dynamic>) return inner;
      return data;
    }
    return const {};
  }
}

