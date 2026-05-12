import 'package:dartz/dartz.dart';
import 'package:suregift_test/core/data/database/db_exceptions.dart';
import 'package:suregift_test/core/presentation/domain/ui_exceptions.dart';
import 'package:suregift_test/core/utils/error_helpers.dart';
import 'package:suregift_test/features/auth/data/models/user_model.dart';
import 'package:suregift_test/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<Either<UIError, UserModel>> call(
      String email, String password) async {
    try {
      final user = await _repository.login(email, password);
      return Right(user);
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
          'Login failed. Please try again.',
          e,
          stackTrace,
        ),
      );
    }
  }
}

class RestoreSessionUseCase {
  final AuthRepository _repository;

  RestoreSessionUseCase(this._repository);

  Future<UserModel?> call() async {
    if (!await _repository.hasSession()) return null;
    return _repository.getCachedUser();
  }
}

