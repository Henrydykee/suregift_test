import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:suregift_test/core/presentation/widgets/app_colors.dart';
import 'package:suregift_test/core/presentation/widgets/app_network_image.dart';
import 'package:suregift_test/core/utils/currency_format.dart';
import 'package:suregift_test/features/vouchers/data/models/voucher_model.dart';
import 'package:suregift_test/features/vouchers/presentation/widgets/voucher_status_chip.dart';

class VoucherHeroCard extends StatelessWidget {
  final Voucher voucher;
  const VoucherHeroCard({super.key, required this.voucher});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primaryDark, AppColors.primary],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.22),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned(
              right: -32,
              top: -28,
              child: Icon(
                Icons.confirmation_number_rounded,
                size: 180,
                color: Colors.white.withValues(alpha: 0.10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ProductRow(voucher: voucher),
                  const SizedBox(height: 18),
                  Text(
                    'Voucher value',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white.withValues(alpha: 0.75),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formatCurrency(voucher.amount, voucher.currency),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _MetaRow(voucher: voucher),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductRow extends StatelessWidget {
  final Voucher voucher;
  const _ProductRow({required this.voucher});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.18),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: AppNetworkImage(
            url: voucher.productImageUrl,
            width: 60,
            height: 60,
            borderRadius: BorderRadius.circular(10),
            placeholderIconSize: 28,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                voucher.productName.isEmpty
                    ? voucher.productCode
                    : voucher.productName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 6),
              VoucherStatusChip(status: voucher.status),
            ],
          ),
        ),
      ],
    );
  }
}

class _MetaRow extends StatelessWidget {
  final Voucher voucher;
  const _MetaRow({required this.voucher});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _HeroMeta(
            label: 'Purchased',
            value: _formatDate(voucher.createdAtUtc),
          ),
        ),
        Container(
          width: 1,
          height: 30,
          color: Colors.white.withValues(alpha: 0.18),
        ),
        Expanded(
          child: _HeroMeta(
            label: 'Expires',
            value: _formatDate(voucher.expiryDate),
            alignEnd: true,
          ),
        ),
      ],
    );
  }
}

class _HeroMeta extends StatelessWidget {
  final String label;
  final String value;
  final bool alignEnd;
  const _HeroMeta({
    required this.label,
    required this.value,
    this.alignEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    final align =
        alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    return Padding(
      padding: alignEnd
          ? const EdgeInsets.only(left: 14)
          : const EdgeInsets.only(right: 14),
      child: Column(
        crossAxisAlignment: align,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Colors.white.withValues(alpha: 0.75),
              fontWeight: FontWeight.w500,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

String _formatDate(DateTime? d) =>
    d == null ? '—' : DateFormat('d MMM yyyy').format(d.toLocal());
