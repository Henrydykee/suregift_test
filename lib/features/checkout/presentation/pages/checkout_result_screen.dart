import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suregift_test/core/di/di_config.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/core/presentation/widgets/app_error_state.dart';
import 'package:suregift_test/core/presentation/widgets/app_primary_app_bar.dart';
import 'package:suregift_test/features/cart/presentation/state/cart_provider.dart';
import 'package:suregift_test/features/checkout/data/models/checkout_result_model.dart';
import 'package:suregift_test/features/checkout/presentation/state/checkout_provider.dart';
import 'package:suregift_test/features/checkout/presentation/widgets/checkout_loading_state.dart';
import 'package:suregift_test/features/checkout/presentation/widgets/checkout_order_summary_card.dart';
import 'package:suregift_test/features/checkout/presentation/widgets/checkout_result_actions.dart';
import 'package:suregift_test/features/checkout/presentation/widgets/checkout_status_hero.dart';
import 'package:suregift_test/features/checkout/presentation/widgets/checkout_status_style.dart';
import 'package:suregift_test/features/checkout/presentation/widgets/checkout_vouchers_card.dart';
import 'package:suregift_test/features/vouchers/presentation/state/vouchers_provider.dart';

class CheckoutResultScreen extends StatelessWidget {
  const CheckoutResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CheckoutProvider>(
      create: (_) => inject<CheckoutProvider>()..run(),
      child: const _CheckoutResultView(),
    );
  }
}

class _CheckoutResultView extends StatefulWidget {
  const _CheckoutResultView();

  @override
  State<_CheckoutResultView> createState() => _CheckoutResultViewState();
}

class _CheckoutResultViewState extends State<_CheckoutResultView> {
  CheckoutResult? _lastHandledResult;

  @override
  void initState() {
    super.initState();
    context.read<CheckoutProvider>().addListener(_onProviderChanged);
  }

  @override
  void dispose() {
    context.read<CheckoutProvider>().removeListener(_onProviderChanged);
    super.dispose();
  }

  void _onProviderChanged() {
    final provider = context.read<CheckoutProvider>();
    final result = provider.result;
    if (result == null || identical(result, _lastHandledResult)) return;
    _lastHandledResult = result;

    if (!result.status.isTerminalFailure) {
      context.read<CartProvider>().loadCart(forceRefresh: true);
      context.read<VouchersProvider>().loadVouchers(forceRefresh: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AppPrimaryAppBar(title: 'Checkout',),
      body: Consumer<CheckoutProvider>(
        builder: (context, provider, _) {
          if (provider.loading) return const CheckoutLoadingState();

          if (provider.error != null && provider.result == null) {
            return AppErrorState(
              title: "Checkout couldn't complete",
              message: provider.error!,
              onRetry: provider.run,
            );
          }

          final result = provider.result;
          if (result == null) return const SizedBox.shrink();

          return _ResultBody(result: result);
        },
      ),
    );
  }
}

class _ResultBody extends StatelessWidget {
  final CheckoutResult result;
  const _ResultBody({required this.result});

  @override
  Widget build(BuildContext context) {
    final style = checkoutStatusStyle(result.status);
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
      children: [
        CheckoutStatusHero(result: result, style: style),
        const SizedBox(height: 18),
        CheckoutOrderSummaryCard(result: result),
        if (result.vouchers.isNotEmpty) ...[
          const SizedBox(height: 14),
          CheckoutVouchersCard(vouchers: result.vouchers),
        ],
        const SizedBox(height: 22),
        CheckoutResultActions(result: result),
      ],
    );
  }
}
