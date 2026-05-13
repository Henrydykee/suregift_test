import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';

import '../../../features/auth/data/datasources/endpoint.dart';
import '../../../features/auth/presentation/pages/login/login_screen.dart';
import '../../di/di_config.dart';
import '../../managers/local_storage_service.dart';
import '../../platform/storage/secured_storage.dart';
import '../../platform/string_constants.dart';
import '../../utils/encryption_utils.dart';
import '../../utils/router.dart';
import 'network_config.dart';

/// Can be registered with [NetworkService].
///
/// Attaches the bearer token to every request except [skipToken] paths.
/// The stored token is AES-encrypted at rest; it is decrypted here before
/// being placed in the Authorization header.
/// On a 401 the local state is wiped and the user is sent to the login screen.
class NetworkInterceptor extends InterceptorsWrapper {
  NetworkConfig? networkConfigInterface;
  DeviceInfoPlugin? deviceInfo;

  static bool _loggingOut = false;

  NetworkInterceptor({this.networkConfigInterface, this.deviceInfo});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("➡️ [REQUEST] ${options.method} ${options.uri}");
    print("➡️ Body: ${options.data}");

    if (!skipToken(options.path)) {
      final raw =
          await inject<SecuredStorage>().get(key: SecureStorageStrings.TOKEN);

      if (raw is String && raw.isNotEmpty) {
        try {
          // Decrypt the stored token before attaching it to the request.
          final token = EncryptionUtils.decrypt(raw);
          options.headers['Authorization'] = 'Bearer $token';
        } catch (e) {
          print("⚠️ Token decryption failed: $e");
        }
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response != null) {
      print(
          "🔴 [RESPONSE] ${err.requestOptions.method} ${err.requestOptions.uri}");
      print("🔴 Status: ${err.response?.statusCode}");
      print("🔴 Data: ${err.response?.data}");
    }

    final status = err.response?.statusCode;
    final path = err.requestOptions.path;

    if (status == 401 && !skipToken(path)) {
      await _hardLogout();
      return handler.reject(err);
    }

    super.onError(err, handler);
  }

  Future<void> _hardLogout() async {
    if (_loggingOut) return;
    _loggingOut = true;
    try {
      await inject<SecuredStorage>().deleteAll();
      await inject<LocalStorageService>().clear();
      router.pushAndRemoveUntil(
        const LoginScreen(),
        (route) => false,
      );
    } catch (e) {
      print("Error during hard logout: $e");
    } finally {
      _loggingOut = false;
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        "🔵 [RESPONSE] ${response.requestOptions.method} ${response.requestOptions.uri}");
    print("🔵 Status: ${response.statusCode}");
    print("🔵   DATA: ${response.data}");
    super.onResponse(response, handler);
  }
}

bool skipToken(String path) {
  return [
    AuthenticationEndpoints.loginUser,
  ].any((e) => path.contains(e));
}
