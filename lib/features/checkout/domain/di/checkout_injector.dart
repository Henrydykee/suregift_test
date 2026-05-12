import 'package:suregift_test/core/data/network/network_service.dart';
import 'package:suregift_test/core/di/di_config.dart';
import 'package:suregift_test/features/checkout/data/datasources/checkout_remote_datasource.dart';
import 'package:suregift_test/features/checkout/data/repositories/checkout_repository_impl.dart';
import 'package:suregift_test/features/checkout/domain/repositories/checkout_repository.dart';
import 'package:suregift_test/features/checkout/domain/usecases/checkout_usecase.dart';
import 'package:suregift_test/features/checkout/presentation/state/checkout_provider.dart';

Future<void> checkoutInjector() async {
  inject.registerLazySingleton<CheckoutRemoteDataSource>(
    () => CheckoutRemoteDataSource(inject<NetworkService>()),
  );

  inject.registerLazySingleton<CheckoutRepository>(
    () => CheckoutRepositoryImpl(
      remoteDataSource: inject<CheckoutRemoteDataSource>(),
    ),
  );

  inject.registerLazySingleton<CheckoutUseCase>(
    () => CheckoutUseCase(inject<CheckoutRepository>()),
  );

  inject.registerFactory<CheckoutProvider>(
    () => CheckoutProvider(checkout: inject<CheckoutUseCase>()),
  );
}

