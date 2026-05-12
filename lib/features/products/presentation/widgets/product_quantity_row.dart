import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_card.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';

class ProductQuantityRow extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onChanged;

  const ProductQuantityRow({
    super.key,
    required this.quantity,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppSectionCard(
      title: 'Quantity',
      child: Row(
        children: [
          _StepButton(
            icon: Icons.remove_rounded,
            enabled: quantity > 1,
            onTap: () => onChanged(quantity - 1),
          ),
          Expanded(
            child: Center(
              child: Text(
                '$quantity',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
          _StepButton(
            icon: Icons.add_rounded,
            enabled: quantity < 99,
            onTap: () => onChanged(quantity + 1),
          ),
        ],
      ),
    );
  }
}

class _StepButton extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  const _StepButton({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Material(
        color: enabled ? AppColors.primary : AppColors.border,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: enabled ? onTap : null,
          child: Icon(
            icon,
            color: enabled ? Colors.white : AppColors.textMuted,
          ),
        ),
      ),
    );
  }
}
