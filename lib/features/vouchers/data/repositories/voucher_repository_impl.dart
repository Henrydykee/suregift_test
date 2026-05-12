import 'package:suregift_test/core/utils/data/guarded_datasource_calls.dart';
import 'package:suregift_test/features/vouchers/data/datasources/vouchers_remote_datasource.dart';
import 'package:suregift_test/features/vouchers/data/models/voucher_model.dart';
import 'package:suregift_test/features/vouchers/domain/repositories/voucher_repository.dart';

class VoucherRepositoryImpl implements VoucherRepository {
  final VouchersRemoteDataSource remoteDataSource;

  VoucherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Voucher>> getVouchers() => guardedApiCall<List<Voucher>>(
        () => remoteDataSource.getVouchers(),
        source: 'VoucherRepositoryImpl.getVouchers',
      );

  @override
  Future<Voucher> getVoucher(int voucherId) => guardedApiCall<Voucher>(
        () => remoteDataSource.getVoucher(voucherId),
        source: 'VoucherRepositoryImpl.getVoucher',
      );
}

