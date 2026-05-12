import 'package:suregift_test/core/data/network/network_service.dart';
import 'package:suregift_test/core/data/network/network_service_response.dart';
import 'package:suregift_test/features/vouchers/data/datasources/endpoint.dart';
import 'package:suregift_test/features/vouchers/data/models/voucher_model.dart';

class VouchersRemoteDataSource {
  final NetworkService _networkService;

  VouchersRemoteDataSource(this._networkService);

  Future<List<Voucher>> getVouchers() async {
    final response = await _networkService.get(VoucherEndpoints.vouchers);
    final data = handleNetworkResponse(response);
    return _asList(data).map(Voucher.fromJson).toList(growable: false);
  }

  Future<Voucher> getVoucher(int voucherId) async {
    final response =
        await _networkService.get(VoucherEndpoints.voucherDetail(voucherId));
    final data = handleNetworkResponse(response);
    final json = _asMap(data);
    return Voucher.fromJson(json);
  }

  List<Map<String, dynamic>> _asList(dynamic data) {
    if (data is List) {
      return data.whereType<Map<String, dynamic>>().toList(growable: false);
    }
    if (data is Map<String, dynamic>) {
      final inner = data['data'] ?? data['items'] ?? data['results'];
      if (inner is List) {
        return inner.whereType<Map<String, dynamic>>().toList(growable: false);
      }
    }
    return const [];
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

