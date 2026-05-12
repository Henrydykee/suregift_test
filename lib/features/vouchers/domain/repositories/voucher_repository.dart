import 'package:suregift_test/features/vouchers/data/models/voucher_model.dart';

abstract class VoucherRepository {
  Future<List<Voucher>> getVouchers();
  Future<Voucher> getVoucher(int voucherId);
}

