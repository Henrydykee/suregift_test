import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';

class AppBulletLine extends StatelessWidget {
  final String text;
  const AppBulletLine({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Container(
            width: 4,
            height: 4,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.textMuted,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              height: 1.45,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
