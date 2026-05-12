import 'package:suregift_test/core/di/di_config.dart';
import 'package:suregift_test/core/platform/storage/secured_storage.dart';
import 'package:suregift_test/core/managers/local_storage_service.dart';
import 'package:suregift_test/core/data/network/network_service.dart';
import '../repositories/auth_repository.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../usecases/login_usecase.dart';
import '../../presentation/state/auth_provider.dart';

Future<void> authInjector() async {
  inject.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(inject<NetworkService>()));

  inject.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: inject<AuthRemoteDataSource>(),
      securedStorage: inject<SecuredStorage>(),
      localStorageService: inject<LocalStorageService>(),
    ),
  );

  inject.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(inject<AuthRepository>()));

  inject.registerLazySingleton<RestoreSessionUseCase>(
      () => RestoreSessionUseCase(inject<AuthRepository>()));

  inject.registerLazySingleton<AuthenticationProvider>(
    () => AuthenticationProvider(
      loginUseCase: inject<LoginUseCase>(),
      restoreSession: inject<RestoreSessionUseCase>(),
    ),
  );
}

