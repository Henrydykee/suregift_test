import 'package:dartz/dartz.dart';
import 'package:suregift_test/core/data/database/db_exceptions.dart';
import 'package:suregift_test/core/presentation/domain/ui_exceptions.dart';
import 'package:suregift_test/core/utils/error_helpers.dart';
import 'package:suregift_test/features/cart/data/models/cart_model.dart';
import 'package:suregift_test/features/cart/data/models/cart_totals_model.dart';
import 'package:suregift_test/features/cart/domain/repositories/cart_repository.dart';

class GetCartUseCase {
  final CartRepository _repository;
  GetCartUseCase(this._repository);

  Future<Either<UIError, Cart>> call() => _guard(
        () => _repository.getCart(),
        fallbackMessage: 'Could not load your cart.',
      );
}

class AddCartItemUseCase {
  final CartRepository _repository;
  AddCartItemUseCase(this._repository);

  Future<Either<UIError, void>> call({
    required String productCode,
    required double amount,
    required int quantity,
  }) =>
      _guard(
        () => _repository.addItem(
          productCode: productCode,
          amount: amount,
          quantity: quantity,
        ),
        fallbackMessage: 'Could not add item to cart.',
      );
}

class UpdateCartItemUseCase {
  final CartRepository _repository;
  UpdateCartItemUseCase(this._repository);

  Future<Either<UIError, void>> call({
    required int cartItemId,
    required int quantity,
    double? amount,
  }) =>
      _guard(
        () => _repository.updateItem(
          cartItemId: cartItemId,
          quantity: quantity,
          amount: amount,
        ),
        fallbackMessage: 'Could not update the cart item.',
      );
}

class RemoveCartItemUseCase {
  final CartRepository _repository;
  RemoveCartItemUseCase(this._repository);

  Future<Either<UIError, void>> call(int cartItemId) => _guard(
        () => _repository.removeItem(cartItemId),
        fallbackMessage: 'Could not remove the item.',
      );
}

class GetCartTotalUseCase {
  final CartRepository _repository;
  GetCartTotalUseCase(this._repository);

  Future<Either<UIError, CartTotals>> call() => _guard(
        () => _repository.getTotal(),
        fallbackMessage: 'Could not calculate the total.',
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

