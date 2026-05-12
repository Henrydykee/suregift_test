import 'package:suregift_test/core/data/network/network_service.dart';
import 'package:suregift_test/features/auth/data/datasources/endpoint.dart';
import 'package:suregift_test/core/data/network/network_service_response.dart';

class AuthRemoteDataSource {
  final NetworkService _networkService;

  AuthRemoteDataSource(this._networkService);

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _networkService.post(
      AuthenticationEndpoints.loginUser,
      body: {
        'email': email,
        'password': password,
      },
    );
    final rawData = handleNetworkResponse(response);
    if (rawData is Map<String, dynamic>) {
      if (rawData.containsKey('data') && rawData['data'] is Map<String, dynamic>) {
        return rawData['data'] as Map<String, dynamic>;
      }
      return rawData;
    }
    return {};
  }
}

