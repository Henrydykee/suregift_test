import 'package:dartz/dartz.dart';
import 'package:suregift_test/core/data/database/db_exceptions.dart';
import 'package:suregift_test/core/presentation/domain/ui_exceptions.dart';
import 'package:suregift_test/core/utils/error_helpers.dart';
import 'package:suregift_test/features/vouchers/data/models/voucher_model.dart';
import 'package:suregift_test/features/vouchers/domain/repositories/voucher_repository.dart';

class GetVouchersUseCase {
  final VoucherRepository _repository;
  GetVouchersUseCase(this._repository);

  Future<Either<UIError, List<Voucher>>> call() =>
      _guard(() => _repository.getVouchers(),
          fallbackMessage: 'Could not load vouchers. Please try again.');
}

class GetVoucherDetailUseCase {
  final VoucherRepository _repository;
  GetVoucherDetailUseCase(this._repository);

  Future<Either<UIError, Voucher>> call(int voucherId) => _guard(
        () => _repository.getVoucher(voucherId),
        fallbackMessage: 'Could not load voucher details.',
      );
}

Future<Either<UIError, T>> _guard<T>(
  Future<T> Function() run, {
  required String fallbackMessage,
}) async {
  try {
    final result = await run();
    return Right(result);
  } on NetworkFailure catch (failure) {
    return Left(getUIErrorFromUsecaseFailure(
      failure.message,
      failure,
      StackTrace.current,
    ));
  } catch (e, stackTrace) {
    return Left(
      getUIErrorFromUsecaseFailure(fallbackMessage, e, stackTrace),
    );
  }
}

