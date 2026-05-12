import 'package:suregift_test/core/data/network/network_service.dart';
import 'package:suregift_test/core/data/network/network_service_response.dart';
import 'package:suregift_test/features/checkout/data/datasources/endpoint.dart';
import 'package:suregift_test/features/checkout/data/models/checkout_result_model.dart';

class CheckoutRemoteDataSource {
  final NetworkService _networkService;

  CheckoutRemoteDataSource(this._networkService);

  Future<CheckoutResult> checkout() async {
    final response = await _networkService.post(CheckoutEndpoints.checkout);
    final data = handleNetworkResponse(response);
    final json = _asMap(data);
    return CheckoutResult.parse(json);
  }

  Map<String, dynamic> _asMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      final inner = data['data'];
      if (inner is Map<String, dynamic>) return inner;
      return data;
    }
    return const {};
  }
}

