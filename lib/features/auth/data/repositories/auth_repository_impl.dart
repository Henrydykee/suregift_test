import 'package:suregift_test/core/managers/local_storage_service.dart';
import 'package:suregift_test/core/platform/storage/secured_storage.dart';
import 'package:suregift_test/core/platform/string_constants.dart';
import 'package:suregift_test/features/auth/data/models/user_model.dart';
import 'package:suregift_test/features/auth/domain/repositories/auth_repository.dart';
import 'package:suregift_test/core/utils/data/guarded_datasource_calls.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final SecuredStorage securedStorage;
  final LocalStorageService localStorageService;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.securedStorage,
    required this.localStorageService,
  });

  @override
  Future<UserModel> login(String email, String password) async {
    final payload = await guardedApiCall<Map<String, dynamic>>(
      () => remoteDataSource.login(email, password),
      source: 'AuthRepositoryImpl.login',
    );

    final token = payload['accessToken'] as String?;
    if (token == null || token.isEmpty) {
      throw StateError('Login response missing accessToken');
    }
    await securedStorage.add(key: SecureStorageStrings.TOKEN, value: token);

    final expiresAt = payload['expiresAtUtc'] as String?;
    if (expiresAt != null && expiresAt.isNotEmpty) {
      await securedStorage.add(
        key: SecureStorageStrings.TOKEN_EXPIRES_AT,
        value: expiresAt,
      );
    }

    final userJson = payload['user'];
    if (userJson is Map<String, dynamic>) {
      await localStorageService.setJson(SPref.USER_DATA, userJson);
      return UserModel.fromJson(userJson);
    }

    return UserModel(id: 0, email: email, firstName: '', lastName: '');
  }

  @override
  Future<void> logout() async {
    await securedStorage.deleteAll();
    await localStorageService.clear();
  }

  @override
  Future<UserModel?> getCachedUser() async {
    final json = localStorageService.getJson(SPref.USER_DATA);
    if (json == null) return null;
    return UserModel.fromJson(json);
  }

  @override
  Future<bool> hasSession() async {
    final token = await securedStorage.get(key: SecureStorageStrings.TOKEN);
    return token is String && token.isNotEmpty;
  }
}

