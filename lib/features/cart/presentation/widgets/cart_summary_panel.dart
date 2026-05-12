import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_buttons.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/core/utils/currency_format.dart';
import 'package:suregift_test/features/cart/data/models/cart_totals_model.dart';

class CartSummaryPanel extends StatelessWidget {
  final double subtotal;
  final String currency;
  final CartTotals? totals;
  final bool totalsLoading;
  final String? totalsError;
  final Future<void> Function() onRetryTotals;
  final VoidCallback onCheckout;

  const CartSummaryPanel({
    super.key,
    required this.subtotal,
    required this.currency,
    required this.totals,
    required this.totalsLoading,
    required this.totalsError,
    required this.onRetryTotals,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    final hasTotals = totals != null;
    final summaryCurrency =
        totals?.currency.isNotEmpty == true ? totals!.currency : currency;
    final summarySubtotal = totals?.subtotal ?? subtotal;
    final totalValue = totals?.total ?? subtotal;

    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        decoration: const BoxDecoration(
          color: AppColors.surface,
          border: Border(top: BorderSide(color: AppColors.border)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _SummaryRow(
              label: 'Subtotal',
              value: formatCurrency(summarySubtotal, summaryCurrency),
            ),
            if (hasTotals) ...[
              if (totals!.fees != null && totals!.fees! > 0) ...[
                const SizedBox(height: 6),
                _SummaryRow(
                  label: 'Fees',
                  value: formatCurrency(totals!.fees, summaryCurrency),
                ),
              ],
              if (totals!.tax != null && totals!.tax! > 0) ...[
                const SizedBox(height: 6),
                _SummaryRow(
                  label: 'Tax',
                  value: formatCurrency(totals!.tax, summaryCurrency),
                ),
              ],
            ],
            const SizedBox(height: 10),
            const Divider(height: 1, color: AppColors.border),
            const SizedBox(height: 10),
            _SummaryRow(
              label: 'Total',
              value: formatCurrency(totalValue, summaryCurrency),
              emphasized: true,
            ),
            if (totalsLoading && !hasTotals) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const SizedBox(
                    height: 14,
                    width: 14,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Calculating total…',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ],
            if (totalsError != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      totalsError!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.danger,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: onRetryTotals,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 14),
            AppPrimaryButton(
              label: 'Checkout',
              icon: Icons.lock_outline_rounded,
              onPressed: onCheckout,
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool emphasized;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.emphasized = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = emphasized ? AppColors.textPrimary : Colors.grey.shade700;
    final weight = emphasized ? FontWeight.w700 : FontWeight.w500;
    final size = emphasized ? 18.0 : 14.0;

    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(fontSize: size, fontWeight: weight, color: color),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: size,
            fontWeight: emphasized ? FontWeight.w700 : FontWeight.w600,
            color: emphasized ? AppColors.primary : AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
