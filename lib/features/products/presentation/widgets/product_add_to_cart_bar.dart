import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/core/utils/currency_format.dart';
import 'package:suregift_test/features/cart/presentation/state/cart_provider.dart';

class ProductAddToCartBar extends StatelessWidget {
  final double? total;
  final String currency;
  final VoidCallback onAdd;

  const ProductAddToCartBar({
    super.key,
    required this.total,
    required this.currency,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final loading = context.select<CartProvider, bool>((p) => p.addingItem);

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
        child: Material(
          elevation: 10,
          shadowColor: Colors.black.withValues(alpha: 0.18),
          borderRadius: BorderRadius.circular(18),
          color: AppColors.surface,
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      total == null ? '—' : formatCurrency(total, currency),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                FilledButton.icon(
                  onPressed: loading ? null : onAdd,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    disabledBackgroundColor:
                        AppColors.primary.withValues(alpha: 0.6),
                    disabledForegroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: loading
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.shopping_cart_outlined),
                  label: Text(
                    loading ? 'Adding…' : 'Add to cart',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
