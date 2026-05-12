import 'package:suregift_test/core/data/network/network_service.dart';
import 'package:suregift_test/core/di/di_config.dart';
import 'package:suregift_test/features/cart/data/datasources/cart_remote_datasource.dart';
import 'package:suregift_test/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:suregift_test/features/cart/domain/repositories/cart_repository.dart';
import 'package:suregift_test/features/cart/domain/usecases/cart_usecases.dart';
import 'package:suregift_test/features/cart/presentation/state/cart_provider.dart';

Future<void> cartInjector() async {
  inject.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSource(inject<NetworkService>()),
  );

  inject.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(remoteDataSource: inject<CartRemoteDataSource>()),
  );

  inject.registerLazySingleton<GetCartUseCase>(
    () => GetCartUseCase(inject<CartRepository>()),
  );
  inject.registerLazySingleton<AddCartItemUseCase>(
    () => AddCartItemUseCase(inject<CartRepository>()),
  );
  inject.registerLazySingleton<UpdateCartItemUseCase>(
    () => UpdateCartItemUseCase(inject<CartRepository>()),
  );
  inject.registerLazySingleton<RemoveCartItemUseCase>(
    () => RemoveCartItemUseCase(inject<CartRepository>()),
  );
  inject.registerLazySingleton<GetCartTotalUseCase>(
    () => GetCartTotalUseCase(inject<CartRepository>()),
  );

  inject.registerLazySingleton<CartProvider>(
    () => CartProvider(
      getCart: inject<GetCartUseCase>(),
      addItem: inject<AddCartItemUseCase>(),
      updateItem: inject<UpdateCartItemUseCase>(),
      removeItem: inject<RemoveCartItemUseCase>(),
      getTotal: inject<GetCartTotalUseCase>(),
    ),
  );
}

