import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';

import '../../../features/auth/data/datasources/endpoint.dart';
import '../../../features/auth/presentation/pages/login/login_screen.dart';
import '../../di/di_config.dart';
import '../../managers/local_storage_service.dart';
import '../../platform/storage/secured_storage.dart';
import '../../platform/string_constants.dart';
import '../../utils/router.dart';
import 'network_config.dart';

/// Can be registered with [NetworkService].
///
/// Attaches the bearer token to every request except [skipToken] paths,
/// and on a 401 wipes local state and forces a return to the login screen.
/// The VoucherHub assessment API issues a JWT without a refresh token, so
/// there is no silent-refresh path here — 401 means re-login.
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
      final authToken =
          await inject<SecuredStorage>().get(key: SecureStorageStrings.TOKEN);
      if (authToken is String && authToken.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $authToken';
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
