import 'package:suregift_test/core/data/network/network_service.dart';
import 'package:suregift_test/core/data/network/network_service_response.dart';
import 'package:suregift_test/features/products/data/datasources/endpoint.dart';
import 'package:suregift_test/features/products/data/models/product_model.dart';

class ProductsRemoteDataSource {
  final NetworkService _networkService;

  ProductsRemoteDataSource(this._networkService);

  Future<List<Product>> getProducts({int limit = 100, int skip = 0}) async {
    final response = await _networkService.get(
      ProductEndpoints.products,
      queryParameters: {
        'limit': limit,
        'skip': skip,
      },
    );
    final data = handleNetworkResponse(response);
    return _asList(data).map(Product.fromJson).toList(growable: false);
  }

  Future<Product> getProduct(String code) async {
    final response =
        await _networkService.get(ProductEndpoints.productDetail(code));
    final data = handleNetworkResponse(response);
    final json = _asMap(data);
    return Product.fromJson(json);
  }

  List<Map<String, dynamic>> _asList(dynamic data) {
    if (data is List) {
      return data.whereType<Map<String, dynamic>>().toList(growable: false);
    }
    if (data is Map<String, dynamic>) {
      final inner = data['data'] ?? data['items'] ?? data['results'];
      if (inner is List) {
        return inner.whereType<Map<String, dynamic>>().toList(growable: false);
      }
    }
    return const [];
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

