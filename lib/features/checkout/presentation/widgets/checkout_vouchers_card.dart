import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:suregift_test/core/presentation/widgets/app_card.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/core/presentation/widgets/app_section_header.dart';
import 'package:suregift_test/core/utils/currency_format.dart';
import 'package:suregift_test/features/vouchers/data/models/voucher_model.dart';
import 'package:suregift_test/features/vouchers/presentation/pages/voucher_detail_sheet.dart';

class CheckoutVouchersCard extends StatelessWidget {
  final List<Voucher> vouchers;
  const CheckoutVouchersCard({super.key, required this.vouchers});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSectionHeader(
            icon: Icons.confirmation_number_rounded,
            label: 'Vouchers (${vouchers.length})',
          ),
          const SizedBox(height: 14),
          for (var i = 0; i < vouchers.length; i++) ...[
            if (i > 0)
              const Divider(height: 18, color: AppColors.border, thickness: 1),
            _VoucherTile(voucher: vouchers[i]),
          ],
        ],
      ),
    );
  }
}

class _VoucherTile extends StatelessWidget {
  final Voucher voucher;
  const _VoucherTile({required this.voucher});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showVoucherDetailSheet(context, voucher),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    voucher.productName.isEmpty
                        ? voucher.productCode
                        : voucher.productName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formatCurrency(voucher.amount, voucher.currency),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  if (voucher.voucherCode != null) ...[
                    const SizedBox(height: 6),
                    _CopyableInline(
                      label: 'Code',
                      value: voucher.voucherCode!,
                    ),
                  ],
                  if (voucher.pin != null) ...[
                    const SizedBox(height: 4),
                    _CopyableInline(label: 'PIN', value: voucher.pin!),
                  ],
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textMuted,
            ),
          ],
        ),
      ),
    );
  }
}

class _CopyableInline extends StatelessWidget {
  final String label;
  final String value;
  const _CopyableInline({required this.label, required this.value});

  Future<void> _copy() async {
    await Clipboard.setData(ClipboardData(text: value));
    await Fluttertoast.showToast(msg: '$label copied');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _copy,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            Text(
              '$label: ',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
            ),
            Flexible(
              child: Text(
                value,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            const SizedBox(width: 6),
            const Icon(Icons.copy_rounded,
                size: 12, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }
}
