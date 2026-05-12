import 'package:suregift_test/core/utils/data/guarded_datasource_calls.dart';
import 'package:suregift_test/features/products/data/datasources/products_remote_datasource.dart';
import 'package:suregift_test/features/products/data/models/product_model.dart';
import 'package:suregift_test/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductsRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Product>> getProducts({int limit = 100, int skip = 0}) =>
      guardedApiCall<List<Product>>(
        () => remoteDataSource.getProducts(limit: limit, skip: skip),
        source: 'ProductRepositoryImpl.getProducts',
      );

  @override
  Future<Product> getProduct(String code) => guardedApiCall<Product>(
        () => remoteDataSource.getProduct(code),
        source: 'ProductRepositoryImpl.getProduct',
      );
}

