import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/core/presentation/widgets/app_empty_state.dart';
import 'package:suregift_test/core/presentation/widgets/app_error_state.dart';
import 'package:suregift_test/core/presentation/widgets/app_primary_app_bar.dart';
import 'package:suregift_test/core/presentation/widgets/app_shimmer.dart';
import 'package:suregift_test/core/presentation/state/provider_state.dart';
import 'package:suregift_test/features/cart/data/models/cart_item_model.dart';
import 'package:suregift_test/features/cart/presentation/state/cart_provider.dart';
import 'package:suregift_test/features/cart/presentation/widgets/cart_item_row.dart';
import 'package:suregift_test/features/cart/presentation/widgets/cart_summary_panel.dart';
import 'package:suregift_test/features/checkout/presentation/pages/checkout_result_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with ProviderState<void> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CartProvider>().loadCart();
    });
    subscribeToConnectionState(() {
      if (!hasInternetConnection() || !mounted) return;
      final provider = context.read<CartProvider>();
      if (provider.showingCachedCart || provider.error != null) {
        provider.loadCart(forceRefresh: true);
      }
    });
  }

  @override
  void dispose() {
    cancelConnectionStateSubscription();
    super.dispose();
  }

  Future<void> _refresh() =>
      context.read<CartProvider>().loadCart(forceRefresh: true);

  Future<void> _confirmClear() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Clear cart?'),
        content: const Text(
          "This removes every item from your cart. You can't undo this.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton.tonal(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    final error = await context.read<CartProvider>().clearCart();
    if (!mounted) return;
    Fluttertoast.showToast(msg: error ?? 'Cart cleared');
  }

  Future<void> _onQuantityChanged(
    CartProvider provider,
    CartItem item,
    int quantity,
  ) async {
    final error = await provider.setQuantity(item, quantity);
    if (error != null && mounted) Fluttertoast.showToast(msg: error);
  }

  Future<void> _onRemove(CartProvider provider, CartItem item) async {
    final error = await provider.removeItem(item);
    if (!mounted) return;
    Fluttertoast.showToast(msg: error ?? 'Removed ${item.productName}');
  }

  void _goToCheckout(CartProvider provider) {
    if (provider.showingCachedCart) {
      Fluttertoast.showToast(
        msg: 'Reconnect before checking out this cart.',
      );
      return;
    }
    if (provider.cart.items.isEmpty) {
      Fluttertoast.showToast(msg: 'Your cart is empty.');
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const CheckoutResultScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppPrimaryAppBar(
        title: 'Cart',
        actions: [
          Consumer<CartProvider>(
            builder: (_, provider, __) {
              if (provider.cart.items.isEmpty) return const SizedBox.shrink();
              return TextButton(
                onPressed: provider.loading || provider.showingCachedCart
                    ? null
                    : _confirmClear,
                child: const Text('Clear'),
              );
            },
          ),
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (context, provider, _) => _buildBody(context, provider),
      ),
    );
  }

  Widget _buildBody(BuildContext context, CartProvider provider) {
    final cart = provider.cart;
    final isReadOnly = provider.showingCachedCart;
    final isFirstLoad = provider.loading && !provider.hasLoaded;
    if (isFirstLoad) {
      return const AppShimmerList(itemCount: 4, itemHeight: 140);
    }

    if (provider.error != null && cart.items.isEmpty) {
      return AppErrorState(
        title: "Couldn't load your cart",
        message: provider.error!,
        onRetry: _refresh,
      );
    }

    if (cart.items.isEmpty) {
      return RefreshIndicator(
        onRefresh: _refresh,
        child: const AppEmptyState(
          icon: Icons.shopping_cart_outlined,
          title: 'Your cart is empty',
          message: 'Browse the catalogue and add gift cards to get started.',
        ),
      );
    }

    return Column(
      children: [
        if (provider.loading) const LinearProgressIndicator(minHeight: 2),
        if (provider.offlineNotice != null)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            color: AppColors.warningBg,
            child: Text(
              provider.offlineNotice!,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.warning,
              ),
            ),
          ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: cart.items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, index) {
                final item = cart.items[index];
                return CartItemRow(
                  item: item,
                  busy: isReadOnly || provider.isItemBusy(item.id),
                  onQuantityChanged: (q) =>
                      _onQuantityChanged(provider, item, q),
                  onRemove: () => _onRemove(provider, item),
                );
              },
            ),
          ),
        ),
        CartSummaryPanel(
          subtotal: cart.subtotal,
          currency: cart.currency,
          totals: provider.totals,
          totalsLoading: provider.totalsLoading,
          totalsError: provider.totalsError,
          onRetryTotals: isReadOnly ? null : () => provider.loadTotals(),
          onCheckout: isReadOnly ? null : () => _goToCheckout(provider),
          checkoutLabel: isReadOnly ? 'Reconnect to checkout' : 'Checkout',
        ),
      ],
    );
  }
}
