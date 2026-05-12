import 'package:dartz/dartz.dart';
import 'package:suregift_test/core/data/database/db_exceptions.dart';
import 'package:suregift_test/core/presentation/domain/ui_exceptions.dart';
import 'package:suregift_test/core/utils/error_helpers.dart';
import 'package:suregift_test/features/checkout/data/models/checkout_result_model.dart';
import 'package:suregift_test/features/checkout/domain/repositories/checkout_repository.dart';

class CheckoutUseCase {
  final CheckoutRepository _repository;

  CheckoutUseCase(this._repository);

  Future<Either<UIError, CheckoutResult>> call() async {
    try {
      final result = await _repository.checkout();
      return Right(result);
    } on NetworkFailure catch (failure) {
      return Left(
        getUIErrorFromUsecaseFailure(
          failure.message,
          failure,
          StackTrace.current,
        ),
      );
    } catch (e, stackTrace) {
      return Left(
        getUIErrorFromUsecaseFailure(
          'Checkout failed. Please try again.',
          e,
          stackTrace,
        ),
      );
    }
  }
}

