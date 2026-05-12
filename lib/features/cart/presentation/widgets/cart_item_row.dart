import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_card.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/core/presentation/widgets/app_network_image.dart';
import 'package:suregift_test/core/utils/currency_format.dart';
import 'package:suregift_test/features/cart/data/models/cart_item_model.dart';

class CartItemRow extends StatelessWidget {
  final CartItem item;
  final bool busy;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onRemove;

  const CartItemRow({
    super.key,
    required this.item,
    required this.busy,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppNetworkImage(
                url: item.productImageUrl,
                width: 64,
                height: 64,
                borderRadius: BorderRadius.circular(10),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.productName.isEmpty
                          ? item.productCode
                          : item.productName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${formatCurrency(item.unitPrice, item.currency)} each',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      formatCurrency(item.subtotal, item.currency),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                tooltip: 'Remove',
                onPressed: busy ? null : onRemove,
                icon: const Icon(
                  Icons.delete_outline_rounded,
                  color: AppColors.danger,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _QtyButton(
                icon: Icons.remove_rounded,
                enabled: !busy && item.quantity > 1,
                onTap: () => onQuantityChanged(item.quantity - 1),
              ),
              SizedBox(
                width: 56,
                child: Center(
                  child: busy
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child:
                              CircularProgressIndicator(strokeWidth: 2.2),
                        )
                      : Text(
                          '${item.quantity}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                ),
              ),
              _QtyButton(
                icon: Icons.add_rounded,
                enabled: !busy && item.quantity < 99,
                onTap: () => onQuantityChanged(item.quantity + 1),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  const _QtyButton({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: Material(
        color: enabled ? AppColors.primary : AppColors.border,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: enabled ? onTap : null,
          child: Icon(
            icon,
            size: 20,
            color: enabled ? Colors.white : AppColors.textMuted,
          ),
        ),
      ),
    );
  }
}

