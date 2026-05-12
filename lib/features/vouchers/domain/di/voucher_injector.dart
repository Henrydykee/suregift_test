import 'package:suregift_test/core/data/cache/cache_service.dart';
import 'package:suregift_test/core/data/network/network_service.dart';
import 'package:suregift_test/core/di/di_config.dart';
import 'package:suregift_test/features/vouchers/data/datasources/vouchers_remote_datasource.dart';
import 'package:suregift_test/features/vouchers/data/repositories/voucher_repository_impl.dart';
import 'package:suregift_test/features/vouchers/domain/repositories/voucher_repository.dart';
import 'package:suregift_test/features/vouchers/domain/usecases/voucher_usecases.dart';
import 'package:suregift_test/features/vouchers/presentation/state/vouchers_provider.dart';

Future<void> voucherInjector() async {
  inject.registerLazySingleton<VouchersRemoteDataSource>(
    () => VouchersRemoteDataSource(inject<NetworkService>()),
  );

  inject.registerLazySingleton<VoucherRepository>(
    () => VoucherRepositoryImpl(
      remoteDataSource: inject<VouchersRemoteDataSource>(),
    ),
  );

  inject.registerLazySingleton<GetVouchersUseCase>(
    () => GetVouchersUseCase(inject<VoucherRepository>()),
  );
  inject.registerLazySingleton<GetVoucherDetailUseCase>(
    () => GetVoucherDetailUseCase(inject<VoucherRepository>()),
  );

  inject.registerLazySingleton<VouchersProvider>(
    () => VouchersProvider(
      getVouchers: inject<GetVouchersUseCase>(),
      getVoucher: inject<GetVoucherDetailUseCase>(),
      cache: inject<CacheService>(),
    ),
  );
}

