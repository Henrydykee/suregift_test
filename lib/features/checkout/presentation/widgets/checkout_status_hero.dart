import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/features/checkout/data/models/checkout_result_model.dart';
import 'package:suregift_test/features/checkout/presentation/widgets/checkout_status_style.dart';

class CheckoutStatusHero extends StatelessWidget {
  final CheckoutResult result;
  final CheckoutStatusStyle style;
  const CheckoutStatusHero({
    super.key,
    required this.result,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
      child: Column(
        children: [
          Container(
            height: 88,
            width: 88,
            decoration: BoxDecoration(
              color: style.tint,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: style.accent.withValues(alpha: 0.18),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Icon(style.icon, color: style.accent, size: 44),
          ),
          const SizedBox(height: 18),
          Text(
            style.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            style.subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.5,
              color: Colors.grey.shade700,
              height: 1.45,
            ),
          ),
          if (result.status == CheckoutStatus.purchaseFailed &&
              result.failureReason != null) ...[
            const SizedBox(height: 14),
            _FailureReasonBox(message: result.failureReason!),
          ],
        ],
      ),
    );
  }
}

class _FailureReasonBox extends StatelessWidget {
  final String message;
  const _FailureReasonBox({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.dangerBg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.danger.withValues(alpha: 0.18)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline_rounded,
              size: 16, color: AppColors.danger),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 12.5,
                color: AppColors.danger,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
