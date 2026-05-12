import 'package:flutter/material.dart';
import 'package:suregift_test/core/di/di_config.dart';
import 'package:suregift_test/features/auth/data/models/user_model.dart';
import 'package:suregift_test/features/auth/domain/repositories/auth_repository.dart';
import 'package:suregift_test/features/auth/domain/usecases/login_usecase.dart';

class AuthenticationProvider extends ChangeNotifier {
  final LoginUseCase _loginUseCase;
  final RestoreSessionUseCase _restoreSession;

  AuthenticationProvider({
    required LoginUseCase loginUseCase,
    required RestoreSessionUseCase restoreSession,
  })  : _loginUseCase = loginUseCase,
        _restoreSession = restoreSession;

  UserModel? _user;
  UserModel? get user => _user;

  bool _loading = false;
  bool get loading => _loading;

  String? _error;
  String? get error => _error;

  bool get isAuthenticated => _user != null;

  Future<bool> restoreSession() async {
    final cached = await _restoreSession();
    if (cached == null) {
      _user = null;
      return false;
    }
    _user = cached;
    notifyListeners();
    return true;
  }

  Future<bool> login(String email, String password) async {
    _loading = true;
    _error = null;
    notifyListeners();

    final result = await _loginUseCase(email, password);
    bool success = false;
    result.fold(
      (failure) => _error = failure.message,
      (user) {
        _user = user;
        success = true;
      },
    );

    _loading = false;
    notifyListeners();
    return success;
  }

  Future<void> logout() async {
    await inject<AuthRepository>().logout();
    _user = null;
    _error = null;
    notifyListeners();
  }
}

