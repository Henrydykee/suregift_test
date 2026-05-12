import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/core/presentation/widgets/app_error_state.dart';
import 'package:suregift_test/features/vouchers/data/models/voucher_model.dart';
import 'package:suregift_test/features/vouchers/presentation/state/vouchers_provider.dart';
import 'package:suregift_test/features/vouchers/presentation/widgets/voucher_credentials_card.dart';
import 'package:suregift_test/features/vouchers/presentation/widgets/voucher_hero_card.dart';
import 'package:suregift_test/features/vouchers/presentation/widgets/voucher_redemption_details.dart';

Future<void> showVoucherDetailSheet(BuildContext context, Voucher voucher) {
  final provider = context.read<VouchersProvider>()..openVoucher(voucher);
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    useSafeArea: true,
    builder: (_) => ChangeNotifierProvider<VouchersProvider>.value(
      value: provider,
      child: const VoucherDetailSheet(),
    ),
  ).whenComplete(provider.clearSelection);
}

class VoucherDetailSheet extends StatelessWidget {
  const VoucherDetailSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) => Container(
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            const _GrabHandle(),
            _SheetHeader(onClose: () => Navigator.of(context).maybePop()),
            Expanded(child: _SheetBody(scrollController: scrollController)),
          ],
        ),
      ),
    );
  }
}

class _SheetBody extends StatelessWidget {
  final ScrollController scrollController;
  const _SheetBody({required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Consumer<VouchersProvider>(
      builder: (context, provider, _) {
        final voucher = provider.selected;
        if (voucher == null) return const _EmptySelection();

        return RefreshIndicator(
          onRefresh: () => provider.refreshSelected(),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              VoucherHeroCard(voucher: voucher),
              const SizedBox(height: 16),
              VoucherCredentialsCard(voucher: voucher),
              if (provider.detailError != null) ...[
                const SizedBox(height: 12),
                AppInlineError(
                  message: provider.detailError!,
                  onRetry: provider.refreshSelected,
                ),
              ],
              const SizedBox(height: 16),
              VoucherRedemptionDetails(voucher: voucher),
            ],
          ),
        );
      },
    );
  }
}

class _GrabHandle extends StatelessWidget {
  const _GrabHandle();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 4),
      height: 4,
      width: 42,
      decoration: BoxDecoration(
        color: AppColors.border,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class _SheetHeader extends StatelessWidget {
  final VoidCallback onClose;
  const _SheetHeader({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 8, 6),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Voucher details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          IconButton(
            onPressed: onClose,
            icon: const Icon(Icons.close_rounded),
            color: AppColors.textSecondary,
            tooltip: 'Close',
          ),
        ],
      ),
    );
  }
}

class _EmptySelection extends StatelessWidget {
  const _EmptySelection();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Text(
          'No voucher selected.',
          style: TextStyle(color: Colors.grey.shade600),
        ),
      ),
    );
  }
}
