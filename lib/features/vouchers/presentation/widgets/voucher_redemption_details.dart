import 'package:flutter/material.dart';
import 'package:suregift_test/core/presentation/widgets/app_card.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/features/vouchers/data/models/voucher_model.dart';

class VoucherRedemptionDetails extends StatelessWidget {
  final Voucher voucher;
  const VoucherRedemptionDetails({super.key, required this.voucher});

  @override
  Widget build(BuildContext context) {
    final instructions = voucher.redemptionInstructions;
    final terms = voucher.termsAndConditions;
    if ((instructions == null || instructions.isEmpty) &&
        (terms == null || terms.isEmpty)) {
      return const SizedBox.shrink();
    }

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (instructions != null && instructions.isNotEmpty) ...[
            const _SectionTitle('How to redeem'),
            const SizedBox(height: 8),
            Text(
              instructions,
              style: const TextStyle(
                fontSize: 14,
                height: 1.45,
                color: AppColors.textPrimary,
              ),
            ),
          ],
          if (instructions != null &&
              instructions.isNotEmpty &&
              terms != null &&
              terms.isNotEmpty)
            const SizedBox(height: 16),
          if (terms != null && terms.isNotEmpty) ...[
            const _SectionTitle('Terms & conditions'),
            const SizedBox(height: 8),
            Text(
              terms,
              style: TextStyle(
                fontSize: 13,
                height: 1.45,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String label;
  const _SectionTitle(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),
    );
  }
}
