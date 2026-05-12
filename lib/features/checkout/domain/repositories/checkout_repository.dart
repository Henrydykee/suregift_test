import 'package:suregift_test/features/checkout/data/models/checkout_result_model.dart';

abstract class CheckoutRepository {
  Future<CheckoutResult> checkout();
}

