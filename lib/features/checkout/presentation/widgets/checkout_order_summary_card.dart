import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:suregift_test/core/presentation/widgets/app_card.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/core/presentation/widgets/app_section_header.dart';
import 'package:suregift_test/core/utils/currency_format.dart';
import 'package:suregift_test/features/checkout/data/models/checkout_result_model.dart';

class CheckoutOrderSummaryCard extends StatelessWidget {
  final CheckoutResult result;
  const CheckoutOrderSummaryCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final orderRef = result.orderId == null ? null : '#${result.orderId}';
    return AppCard(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppSectionHeader(
            icon: Icons.receipt_long_rounded,
            label: 'Order summary',
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Total paid',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                formatCurrency(result.totalAmount, result.currency),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(height: 1, color: AppColors.border),
          const SizedBox(height: 14),
          if (orderRef != null) ...[
            _SummaryLine(label: 'Order ID', value: orderRef),
            const SizedBox(height: 10),
          ],
          if (result.paymentReference != null) ...[
            _CopyableSummaryLine(
              label: 'Payment ref',
              value: result.paymentReference!,
            ),
            const SizedBox(height: 10),
          ],
          if (result.suregiftsOrderId != null) ...[
            _CopyableSummaryLine(
              label: 'SureGifts ID',
              value: result.suregiftsOrderId!,
            ),
            const SizedBox(height: 10),
          ],
          if (result.rawStatus.isNotEmpty)
            _SummaryLine(label: 'Status', value: result.rawStatus),
        ],
      ),
    );
  }
}

class _SummaryLine extends StatelessWidget {
  final String label;
  final String value;
  const _SummaryLine({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

class _CopyableSummaryLine extends StatelessWidget {
  final String label;
  final String value;
  const _CopyableSummaryLine({required this.label, required this.value});

  Future<void> _copy() async {
    await Clipboard.setData(ClipboardData(text: value));
    await Fluttertoast.showToast(msg: '$label copied');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        Flexible(
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        IconButton(
          onPressed: _copy,
          icon: const Icon(Icons.copy_rounded, size: 16),
          tooltip: 'Copy',
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
        ),
      ],
    );
  }
}
