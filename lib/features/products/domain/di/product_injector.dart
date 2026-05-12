import 'package:suregift_test/core/data/network/network_service.dart';
import 'package:suregift_test/core/di/di_config.dart';
import 'package:suregift_test/features/products/data/datasources/products_remote_datasource.dart';
import 'package:suregift_test/features/products/data/repositories/product_repository_impl.dart';
import 'package:suregift_test/features/products/domain/repositories/product_repository.dart';
import 'package:suregift_test/features/products/domain/usecases/product_usecases.dart';
import 'package:suregift_test/features/products/presentation/state/products_provider.dart';

Future<void> productInjector() async {
  inject.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSource(inject<NetworkService>()),
  );

  inject.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDataSource: inject<ProductsRemoteDataSource>(),
    ),
  );

  inject.registerLazySingleton<GetProductsUseCase>(
    () => GetProductsUseCase(inject<ProductRepository>()),
  );
  inject.registerLazySingleton<GetProductDetailUseCase>(
    () => GetProductDetailUseCase(inject<ProductRepository>()),
  );

  inject.registerLazySingleton<ProductsProvider>(
    () => ProductsProvider(
      getProducts: inject<GetProductsUseCase>(),
      getProductDetail: inject<GetProductDetailUseCase>(),
    ),
  );
}

