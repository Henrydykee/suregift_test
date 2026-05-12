


import 'package:get_it/get_it.dart';
import 'package:suregift_test/core/di/core_di.dart';
import 'package:suregift_test/features/auth/domain/di/auth_injector.dart';
import 'package:suregift_test/features/cart/domain/di/cart_injector.dart';
import 'package:suregift_test/features/checkout/domain/di/checkout_injector.dart';
import 'package:suregift_test/features/products/domain/di/product_injector.dart';
import 'package:suregift_test/features/vouchers/domain/di/voucher_injector.dart';

GetIt inject = GetIt.instance;

/// Registration of service dependencies with service locator GetIt
///
/// Add any such dependency here
Future<void> initInjectors() async {
  await coreInjector();
  await authInjector();
  await productInjector();
  await cartInjector();
  await voucherInjector();
  await checkoutInjector();
}
