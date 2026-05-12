import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/features/checkout/data/models/checkout_result_model.dart';

class CheckoutStatusStyle {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color accent;
  final Color tint;
  const CheckoutStatusStyle({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accent,
    required this.tint,
  });
}

CheckoutStatusStyle checkoutStatusStyle(CheckoutStatus status) {
  switch (status) {
    case CheckoutStatus.purchaseSuccessful:
      return const CheckoutStatusStyle(
        title: 'Purchase successful',
        subtitle:
            'Your vouchers are ready. Tap one to view the code, PIN, and redemption details.',
        icon: Icons.check_circle_rounded,
        accent: AppColors.success,
        tint: AppColors.successBg,
      );
    case CheckoutStatus.purchaseFailed:
      return const CheckoutStatusStyle(
        title: 'Purchase failed',
        subtitle:
            "We couldn't complete the purchase with SureGifts. No charge has been confirmed.",
        icon: Icons.error_rounded,
        accent: AppColors.danger,
        tint: AppColors.dangerBg,
      );
    case CheckoutStatus.paymentSuccessful:
      return const CheckoutStatusStyle(
        title: 'Payment successful',
        subtitle:
            "Payment is confirmed. We're fulfilling your vouchers with SureGifts — this can take a moment.",
        icon: Icons.payments_rounded,
        accent: AppColors.primaryAccent,
        tint: Color(0xFFE8EFFD),
      );
    case CheckoutStatus.purchaseProcessing:
      return const CheckoutStatusStyle(
        title: 'Purchase processing',
        subtitle:
            "SureGifts is generating your vouchers. They'll appear in your voucher history once ready.",
        icon: Icons.hourglass_top_rounded,
        accent: AppColors.primaryAccent,
        tint: Color(0xFFE8EFFD),
      );
    case CheckoutStatus.pending:
      return const CheckoutStatusStyle(
        title: 'Order pending',
        subtitle:
            'Your order is queued. You can come back to voucher history shortly to check the result.',
        icon: Icons.schedule_rounded,
        accent: AppColors.primaryAccent,
        tint: Color(0xFFE8EFFD),
      );
    case CheckoutStatus.unknown:
      return const CheckoutStatusStyle(
        title: 'Order submitted',
        subtitle:
            "We received your order but couldn't classify its status. Check voucher history shortly.",
        icon: Icons.help_outline_rounded,
        accent: AppColors.textSecondary,
        tint: AppColors.surfaceMuted,
      );
  }
}
