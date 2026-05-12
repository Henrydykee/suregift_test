import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';

class AppSectionHeader extends StatelessWidget {
  final IconData icon;
  final String label;
  const AppSectionHeader({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.primary),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            letterSpacing: -0.1,
          ),
        ),
      ],
    );
  }
}
