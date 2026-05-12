import 'package:flutter/foundation.dart';
import 'package:suregift_test/features/checkout/data/models/checkout_result_model.dart';
import 'package:suregift_test/features/checkout/domain/usecases/checkout_usecase.dart';

class CheckoutProvider extends ChangeNotifier {
  final CheckoutUseCase _checkout;

  CheckoutProvider({required CheckoutUseCase checkout}) : _checkout = checkout;

  CheckoutResult? _result;
  CheckoutResult? get result => _result;

  bool _loading = false;
  bool get loading => _loading;

  String? _error;
  String? get error => _error;

  Future<void> run() async {
    if (_loading) return;
    _loading = true;
    _error = null;
    _result = null;
    notifyListeners();

    final outcome = await _checkout();
    outcome.fold(
      (err) => _error = err.message,
      (data) => _result = data,
    );

    _loading = false;
    notifyListeners();
  }
}

