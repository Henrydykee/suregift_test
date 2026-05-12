import 'package:suregift_test/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> login(String email, String password);
  Future<void> logout();
  Future<UserModel?> getCachedUser();
  Future<bool> hasSession();
}

