import 'package:suregift_test/features/products/data/models/product_model.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts({int limit, int skip});
  Future<Product> getProduct(String code);
}

