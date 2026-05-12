import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:suregift_test/features/auth/presentation/state/auth_provider.dart';
import 'package:suregift_test/features/cart/presentation/state/cart_provider.dart';
import 'package:suregift_test/features/products/presentation/state/products_provider.dart';
import 'package:suregift_test/features/vouchers/presentation/state/vouchers_provider.dart';

import '../../di/di_config.dart';

class ProviderInitializer {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider<AuthenticationProvider>.value(
      value: inject<AuthenticationProvider>(),
    ),
    ChangeNotifierProvider<ProductsProvider>.value(
      value: inject<ProductsProvider>(),
    ),
    ChangeNotifierProvider<CartProvider>.value(
      value: inject<CartProvider>(),
    ),
    ChangeNotifierProvider<VouchersProvider>.value(
      value: inject<VouchersProvider>(),
    ),
  ];
}
