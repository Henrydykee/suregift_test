import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/cache/cache_service.dart';
import '../data/memory/cache_helpers.dart';
import '../data/network/network_config.dart';
import '../data/network/network_interceptor.dart';
import '../data/network/network_service.dart';
import '../data/network/network_service_impl.dart';
import '../managers/local_storage_service.dart';
import '../platform/storage/secure_storage_impl.dart';
import '../platform/storage/secured_storage.dart';
import 'di_config.dart';

Future<void> coreInjector() async {
  inject.registerSingleton<SecuredStorage>(SecuredStorageImpl());
  inject.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
  inject.registerSingleton<LocalStorageService>(await LocalStorageService.getInstance());
  inject.registerLazySingleton<CacheService>(
    () => CacheService(inject<LocalStorageService>()),
  );
 // inject.registerSingleton<DeviceManager>(DeviceManager.instance);
  inject.registerSingleton<DeviceInfoPlugin>(DeviceInfoPlugin());
  inject.registerFactory<NetworkInterceptor>(() => NetworkInterceptor(networkConfigInterface: inject(), deviceInfo:  inject()));
  inject.registerFactory<NetworkConfig>(() => NetworkConfigImpl());
  inject.registerLazySingleton<NetworkService>(() => NetworkServiceImpl(networkConfiguration: inject(), interceptor: inject()),
  );
  inject.registerLazySingleton<InMemory>(() => InMemory.instance);
}
