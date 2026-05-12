import 'package:dartz/dartz.dart';
import 'package:suregift_test/core/data/database/db_exceptions.dart';
import 'package:suregift_test/core/presentation/domain/ui_exceptions.dart';
import 'package:suregift_test/core/utils/error_helpers.dart';
import 'package:suregift_test/features/products/data/models/product_model.dart';
import 'package:suregift_test/features/products/domain/repositories/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository _repository;
  GetProductsUseCase(this._repository);

  Future<Either<UIError, List<Product>>> call({
    int limit = 100,
    int skip = 0,
  }) =>
      _guard(
        () => _repository.getProducts(limit: limit, skip: skip),
        fallbackMessage: 'Could not load gift cards. Please try again.',
      );
}

class GetProductDetailUseCase {
  final ProductRepository _repository;
  GetProductDetailUseCase(this._repository);

  Future<Either<UIError, Product>> call(String code) => _guard(
        () => _repository.getProduct(code),
        fallbackMessage: 'Could not load product details.',
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

